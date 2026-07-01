---
title: Implementing Sentry in C#
description: An in-depth guide to implementing Sentry error reporting in C# using Mono.
weight: 490
---

## Introduction

This guide explains how to capture unhandled exceptions in FiveM C# resources on Windows and Linux servers and send them to Sentry, while addressing the common issue of silent segmentation faults (segfaults) that prevent proper exception handling.

This guide is specifically intended for Mono V1, using Mono version `5.16.1.0`, as identified by the `mono_get_runtime_build_info` output in the Linux `libcitizen-scripting-mono.so` assembly.

## The Problem on Linux

On Windows, unhandled exceptions in C# scripts are usually caught by the Mono runtime, printed with a stack trace, and can be hooked reliably.

On Linux, many unhandled exceptions (especially `NullReferenceException` from null dereferences) trigger a native SIGSEGV before the managed unhandled exception hook can run. This results in:

- No stack trace in console.
- No call to `mono_install_unhandled_exception_hook`.
- Server crash with no useful logging.

## Recommended Configuration: Enable Explicit Null Checks for Reliable Exception Handling

By default, Mono optimizes null reference detection for performance: it allows code to dereference potentially null pointers directly. If a null is accessed, this triggers a hardware page fault (attempting to read unmapped memory near address 0), which generates a SIGSEGV signal on Linux. [(1)](https://www.mono-project.com/docs/advanced/runtime/docs/exception-handling/#synchronous-signals)

Mono's signal handler intercepts this and converts it into a managed `NullReferenceException`.

In some environments—like embedded Mono in FXServer—signal handler conflicts or other issues can prevent this conversion, causing the SIGSEGV to become a fatal native crash (silent segfault) that bypasses managed exception handling.

The reliable workaround is to disable this implicit mechanism and force Mono to emit explicit null checks in the JIT-compiled code:

```
export MONO_DEBUG=explicit-null-checks
# Your normal startup commands follow
cd server-data
bash ../server/run.sh +exec server.cfg
```

This environment variable (set before starting the server) instructs Mono's JIT compiler to insert conditional checks before object dereferences (e.g., `if (obj == null) throw new NullReferenceException();`). As a result:

- Null dereferences throw a managed `NullReferenceException` directly through normal code paths.
- The exception remains fully in managed code, ensuring unhandled exception hooks (like `mono_install_unhandled_exception_hook`) are invoked reliably.
- Full stack traces are printed/logged.
- Tools like Sentry can capture the exception properly.
- No reliance on SIGSEGV signals, eliminating silent native crashes from null dereferences [(2)](https://manpages.debian.org/testing/mono-runtime-common/mono.1.en.html#explicit_null_checks).

**Note:** This adds a small performance overhead (extra branches in generated code) but is negligible for most server workloads and is a common recommendation for debugging Mono on Linux.
In the next section, we'll implement the Mono hooks to forward these exceptions to Sentry. [(3)](https://www.mono-project.com/docs/debug+profile/debug/#known-limitiations)

## Implementing Mono Hooks via MonoExceptionService

We'll implement a custom service (e.g., `MonoExceptionService`) to intercept unhandled exceptions in Mono's exception system and forward them to Sentry for detailed error tracking. This approach is cross-platform compatible.

The `citizen-scripting-mono` component already installs a default `mono_install_unhandled_exception_hook` during Mono initialization (in `MonoComponentHostShared::Initialize`). This default hook logs basic exception details to the console (e.g., "Unhandled exception in Mono script environment").

By overriding or chaining this hook in your resource, you can capture the exception object, extract full details (message, stack trace, etc.), and send it to Sentry—while optionally preserving the default logging behavior.

{{% alert color="warning" %}}
Overriding the hook replaces the default console logging.
{{% /alert %}}

An example implementation is as follows:

```csharp
using CitizenFX.Core;
using CitizenFX.Core.Native;
using Sentry;
using System;
using System.Runtime.InteropServices;
using System.Threading.Tasks;

namespace YourNamespace.Services
{
    public class MonoExceptionService : BaseScript
    {
        private bool _disposed;
        private GCHandle? _handlerGCHandle;
        private string _monoLibraryName;

        // Platform-specific native loaders
        [DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Ansi)]
        private static extern IntPtr LoadLibrary(string lpFileName);

        [DllImport("kernel32.dll", CharSet = CharSet.Ansi, ExactSpelling = true, SetLastError = true)]
        private static extern IntPtr GetProcAddress(IntPtr hModule, string procName);

        [DllImport("libdl.so.2", EntryPoint = "dlopen", CharSet = CharSet.Ansi)]
        private static extern IntPtr dlopen(string fileName, int flags);

        [DllImport("libdl.so.2", EntryPoint = "dlsym", CharSet = CharSet.Ansi)]
        private static extern IntPtr dlsym(IntPtr handle, string symbol);

        private const int RTLD_LAZY = 0x0001;

        // Mono hook delegates
        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        private delegate void MonoInstallUnhandledExceptionHook(UnhandledExceptionDelegate hook, IntPtr user_data);

        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        private delegate void UnhandledExceptionDelegate(IntPtr excPtr, IntPtr userDataPtr);

        public MonoExceptionService()
        {
            // Determine Mono library name
            _monoLibraryName = API.GetConvar("mono_exception_library", "");

            if (string.IsNullOrEmpty(_monoLibraryName))
            {
                _monoLibraryName = RuntimeInformation.IsOSPlatform(OSPlatform.Windows)
                    ? "mono-2.0-sgen.dll"
                    : "libcitizen-scripting-mono.so";

                Debug.WriteLine($"[MonoHook] No convar set. Using: {_monoLibraryName}");
            }
            else
            {
                Debug.WriteLine($"[MonoHook] Using convar library: {_monoLibraryName}");
            }

            // Initialize Sentry (replace DSN with your own)
            SentrySdk.Init(o =>
            {
                o.Dsn = "http://your-dsn-here@your-sentry-server/1";
                o.Debug = true;
                o.TracesSampleRate = 1.0;
            });

            // Install the hook
            InstallHook();
        }

        private void InstallHook()
        {
            try
            {
                IntPtr monoModule = RuntimeInformation.IsOSPlatform(OSPlatform.Windows)
                    ? LoadLibrary(_monoLibraryName)
                    : dlopen(_monoLibraryName, RTLD_LAZY);

                if (monoModule == IntPtr.Zero)
                    throw new Exception("Failed to load Mono library");

                IntPtr funcPtr = RuntimeInformation.IsOSPlatform(OSPlatform.Windows)
                    ? GetProcAddress(monoModule, "mono_install_unhandled_exception_hook")
                    : dlsym(monoModule, "mono_install_unhandled_exception_hook");

                if (funcPtr == IntPtr.Zero)
                    throw new Exception("mono_install_unhandled_exception_hook not found");

                var installHook = Marshal.GetDelegateForFunctionPointer<MonoInstallUnhandledExceptionHook>(funcPtr);
                var handlerDelegate = new UnhandledExceptionDelegate(CustomUnhandledExceptionHandler);

                _handlerGCHandle = GCHandle.Alloc(handlerDelegate);
                installHook(handlerDelegate, IntPtr.Zero);

                Debug.WriteLine($"[MonoHook] Successfully installed using {_monoLibraryName}");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"[MonoHook] Hook installation failed: {ex.Message}");
            }
        }

        private static void CustomUnhandledExceptionHandler(IntPtr excPtr, IntPtr userDataPtr)
        {
            try
            {
                if (excPtr == IntPtr.Zero)
                {
                    Debug.WriteLine("[MonoHook] Received null exception pointer");
                    return;
                }

                var excHandle = GCHandle.FromIntPtr(excPtr);
                var exception = excHandle.Target as Exception;

                if (exception == null)
                {
                    Debug.WriteLine("[MonoHook] Unhandled exception: (null or invalid)");
                    return;
                }

                string fullDetails = $"Unhandled Mono Exception\nMessage: {exception.Message}\nStack: {exception.StackTrace ?? "(no stack)"}";

                SentrySdk.CaptureException(exception, scope =>
                {
                    scope.SetExtra("FullDetails", fullDetails);
                });

                Debug.WriteLine($"[MonoHook] Captured: {fullDetails}");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"[MonoHook] Failed to process exception: {ex.Message}");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (_disposed) return;

            if (disposing && _handlerGCHandle.HasValue)
            {
                _handlerGCHandle.Value.Free();
            }

            _disposed = true;
        }
    }
}
```

## Proof of Concept

![Stack Trace](/debugging/bugsink-stacktrace.png)

## Conclusion

With this setup—enabling explicit null checks via `MONO_DEBUG=explicit-null-checks` and implementing a custom unhandled exception hook—you now have reliable exception capturing in FiveM C# resources on Linux servers.

Null dereferences and other unhandled exceptions will no longer cause silent native segfaults. Instead, they throw proper managed `NullReferenceExceptions` (or equivalents), triggering your hook to forward full details (including stack traces) to Sentry for monitoring and debugging.

This combination resolves one of the common pain points in Linux-based FXServer instances while keeping the solution lightweight and compatible with the embedded Mono V1 runtime (fork of Mono `5.16.1.0`).

Happy scripting and less crashes!
