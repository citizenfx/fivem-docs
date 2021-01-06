---
title: Script runtimes
weight: 930
description: >
  Describes support for the fxOM script runtimes.
---

CitizenFX supports pluggable scripting runtimes. These runtimes are implemented as CitizenFX components (`code/components/`) implementing `fxOM` (CitizenFX Object Model) interfaces defined in `fxScripting.idl`.

The specific interfaces used at the time of this writing are:

|         Interface          |                                     Purpose                                      |
| -------------------------- | -------------------------------------------------------------------------------- |
| IScriptRuntime             | Base interface for script runtimes. Exposes basic lifetime management functions. |
| IScriptTickRuntime         | Allows exposing a Tick function for runtimes that need to run periodically.      |
| IScriptEventRuntime        | Allows exposing a TriggerEvent function to handle incoming script events.        |
| IScriptRefRuntime          | Allows exposing function references that can be called, duplicated and cloned.   |
| IScriptFileHandlingRuntime | Allows to mark a script runtime as handling specific files.                      |

In addition, there is a host interface: `IScriptHost`, which will be passed to `IScriptRuntime::Create`.

## Interface reference

### IScriptRuntime

#### Create

```cs
void Create(in IScriptHost scriptHost);
```

This method is called by the host when the script runtime is created. The script host passed should probably be saved.

#### Destroy

```cs
void Destroy();
```

This method is called by the host when the script runtime is about to be destroyed.

#### GetParentObject

```cs
void* GetParentObject(); // direct return value, not result_t
```

This should return the object set by `SetParentObject`.

#### SetParentObject

```cs
void SetParentObject(void* object); // direct return value, not result_t
```

This sets the parent object. This is typically a native `fx::Resource*`, which may be relevant to runtimes implemented in C++.

#### GetInstanceId

```cs
int GetInstanceId(); // direct return value, not result_t
```

This should return a random instance ID created by the runtime upon initialization.

### IScriptTickRuntime

#### Tick

```cs
void Tick();
```

This is called by the host every frame.

### IScriptEventRuntime

#### TriggerEvent

```cs
void TriggerEvent(in char* eventName, in char* argsSerialized, in uint32_t serializedSize, in char* sourceId);
```

TriggerEvent is called by the host whenever an event has been triggered. `eventName` contains the name of the executed event,
`argsSerialized` and `serializedSize` indicate the argument array (serialized using the common serialization convention, see the 'conventions' section), and
`sourceId` contains a string identifying the source of the event.

### IScriptRefRuntime

A 'ref' is a function reference, which is used to allow other resources (or the host) to invoke delegates/closures in the script runtime.
Each ref is identified by an integer on resource level, in the host it is qualified with the resource name, instance ID and the ref index.
Refs should not be reference counted by index, each creation should be paired with a single deletion.

#### CallRef

```cs
void CallRef(in int32_t refIdx, in char* argsSerialized, in uint32_t argsSize, out char* retvalSerialized, out uint32_t retvalSize);
```

CallRef is called by the host when a reference should be invoked. `refIdx` contains the ref to call, `argsSerialized`/`argsSize` contain the argument array, and `retvalSerialized` and `retvalSize` should contain the return value array upon completion.

#### DuplicateRef

```cs
void DuplicateRef(in int32_t refIdx, out int32_t newRefIdx);
```

DuplicateRef should return a new reference index referencing the same internal function object as `refIdx` into `newRefIdx`.

#### RemoveRef

```cs
void RemoveRef(in int32_t refIdx);
```

RemoveRef should delete the reference identified by `refIdx`.

### IScriptFileHandlingRuntime

#### HandlesFile

```cs
int32_t HandlesFile(in char* scriptFile);
```

Should return whether or not the specified file should be handled by this runtime.

#### LoadFile

```cs
void LoadFile(in char* scriptFile);
```

This function should load the file in the runtime.

### IScriptHost

#### InvokeNative

```cs
void InvokeNative(inout NativeCtx context);
```

Invokes a native function. `nativeIdentifier` should contain the native function identifier, `numArguments` the amount of arguments, and `arguments` the specific function arguments following the RAGE native ABI.

Any result, for natives that return any, will be returned in the first argument fields in the context.

#### OpenSystemFile

Returns a stream referencing the specified file name in the system VFS.

#### OpenHostFile

Returns a stream referencing the specified file name, relative to the host path (`resources:/resourceName/`).

#### CanonicalizeRef

#### ScriptTrace

### IScriptHostWithResourceData

This can be obtained using QueryInterface on the IScriptHost.

#### GetResourceName

Returns the name of the parent resource.

#### GetNumResourceMetaData

This function should not be used, instead the native {{% native_link "GET_NUM_RESOURCE_METADATA" %}} should be used.

#### GetResourceMetaData

This function should not be used, instead the native {{% native_link "GET_RESOURCE_METADATA" %}} should be used.

### IScriptHostWithManifest

This can be obtained using QueryInterface on the IScriptHost.

#### IsManifestVersionBetween

```cs
bool IsManifestVersionBetween(guid_t* lowerBound, guid_t* upperBound);
```

Returns whether or not the host resource's manifest version is within a specific range of GUIDs (`lowerBound <= guid < upperBound`).

If one of the GUIDs is the null GUID, only tests if the version is greater/less then the other GUID.

## Conventions

### Serialization

Serialization occurs using MessagePack, with a specific extension ID for delegates/function refs.
