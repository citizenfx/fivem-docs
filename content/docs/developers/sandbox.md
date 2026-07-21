---
title: Sandbox
weight: 10
description: >
  Documentation about the FiveM sandbox restrictions and allowed APIs.
---

FiveM implements a security sandbox for resources to ensure stability and prevent malicious code execution. This document describes the restrictions and allowed APIs within this sandbox environment.

## File System Operations

### Path Types

All file system operations support two types of paths:
1. Resource mount paths (recommended): `@resourceName/path`
2. Absolute paths: `/absolute/path/to/resource`

Resource mount paths are recommended as they're cleaner and more portable.

### Directory Listing

The `io.readdir()` function returns a directory handle:

```lua
-- Using mount paths (recommended)
local files1 = io.readdir("@myResource/")
local files2 = io.readdir("@myResource/assets")

-- Using absolute paths
local files3 = io.readdir("/absolute/path/to/resource")
local files4 = io.readdir("/absolute/path/to/resource/assets")
```

```lua
local files = io.readdir("@myResource/")
for file in files:lines() do
    print(file) -- Process each file
end

files:close() -- Not required, but best to do so
```

### File Operations

```lua
-- Using mount paths (recommended)
local file1 = io.open("@myResource/data.json", "r")

-- Using absolute paths
local file2 = io.open("/absolute/path/to/resource/data.json", "r")

-- Available modes
"r"  -- Read
"w"  -- Write
"a"  -- Append
"+"  -- Create
```

#### Write Restrictions

- Writing files within the same resource is allowed
- Writing files to another resource is blocked for all file types

Blocked operations return error code 13 ("Permission denied").

The `SaveResourceFile` native function follows these same rules.

### System Path Restrictions

- Operations in the server main folder are blocked
- Operations outside resource folders are blocked
- Symlinks are disabled and cannot be followed or created
- Path traversal using `..` is disabled and rejected
- Blocked operations return error code 13 "Permission denied"

## OS Operations

### Time Functions

New time measurement functions are available:

```lua
local nano = os.nanotime()   -- Nanosecond precision
local micro = os.microtime() -- Microsecond precision
local delta = os.deltatime() -- Time difference
local tsc = os.rdtsc()       -- Read Time-Stamp Counter
local tscp = os.rdtscp()     -- Read Time-Stamp Counter and Processor ID
```

### Restricted Operations

```lua
-- Blocked with "Permission denied" (code 13)
os.execute("command")  -- All commands blocked
io.tmpfile()          -- Temporary files blocked
io.popen(command .. resourcePath .. path .. suffix)    -- Only emulated 'ls' and 'dir' allowed

-- Limited functionality
os.getenv("os") -- Returns "Windows" or "Linux"
os.setlocale()  -- Returns current locale, cannot modify
```

### Allowed Operations

```lua
-- These operations remain available
load() -- Not blocked
```

## Permission System

{{% alert color="warning" %}}
Enabling resource modifications or filesystem permissions can be dangerous if misused. Only enable these for resources you trust completely.
{{% /alert %}}

### File System Permissions

To explicitly allow a resource to write files to another resource, use the `add_filesystem_permission` configuration in the `server.cfg` file:

```lua
-- Allow resourceA to write files to resourceB
add_filesystem_permission resourceA write resourceB
```

This override grants full write access to the target resource and bypasses the default cross-resource write restrictions.

### ConVar Permissions

To restrict ConVar access to specific resources, use the `add_convar_permission` configuration in the `server.cfg` file:

```lua
-- Restrict reading of a ConVar to specific resources
add_convar_permission resourceA read some_convar_name
```

{{% alert color="info" %}}
By default, ConVars are readable by all resources. Once a ConVar has at least one permission configured, it becomes restricted and only explicitly permitted resources can access it.
{{% /alert %}}

### Unsafe Worker Permission

Spawning workers is restricted by default. To explicitly allow a resource to spawn workers, use the `add_unsafe_worker_permission` configuration:

```cfg
add_unsafe_worker_permission "resourceName"
```

### Unsafe Child Process Permission

Spawning child processes is restricted by default. To explicitly allow a resource to spawn child processes, use the `add_unsafe_child_process_permission` configuration:

```cfg
add_unsafe_child_process_permission "resourceName"
```
