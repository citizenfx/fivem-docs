---
title: Server debugging
weight: 840
---

Creating Full Dumps
-------

This section will explain how to create useful debugging dumps (called .dmp files) in order to assist with troubleshooting. If you encounter a crash, set up your environment to capture the next time it happens.

**NOTE**: Creating full dumps is for Windows servers only. This method is currently not supported on Linux.

#### Prerequisites
1. [ProcDump v9.0][procdump] or newer.

#### Usage
1. Make sure your server is running.
2. Open a command prompt where you extracted procdump to. **Use an ELEVATED command prompt** for this (should say "Administrator" in the title bar).
3. Type in the following command:
    ```dos
    procdump64.exe -accepteula -i
    ```
    This registers procdump as a debugger to capture certain crashes.
4. Open task manager, click `"Details"`. Locate the *largest* `FXServer.exe`. There should be a `"PID"` column. Note down the number.
5. Go back to your command prompt and type in:
    ```dos
    procdump64.exe -accepteula -e -h -mp pidhere
    ```
    where `pidhere` is the number you noted down previously. If you get an error, make sure your `PID` is correct.
6. Wait for the server to crash. When it does, it will write a large .dmp file to the procdump folder.
7. Compress this file (e.g. `.zip`) and upload it to [DropMeFiles][dropmefiles] or equivalent.
8. Run the following in your command prompt to unregister the debugger when you are done:
    ```dos
    procdump64.exe -accepteula -u
    ```

You can now analyze the dump file (using VS2019+, click 'Debug with Native Only' and load [symbols][symbols]) or supply it to whomever requested it. If you are certain you have found a bug, report it on our [forum](https://forum.cfx.re/c/general-discussion/bug-reports) or in the Discord [#server-bugs][discord] channel with as much detail as possible. Using OneSync? Please report OneSync bugs [here](https://forum.cfx.re/c/general-discussion/1s-reports).

[procdump]: https://docs.microsoft.com/en-us/sysinternals/downloads/procdump
[discord]: https://discord.gg/fivem
[dropmefiles]: https://dropmefiles.com/
[symbols]: https://runtime.fivem.net/client/symbols/