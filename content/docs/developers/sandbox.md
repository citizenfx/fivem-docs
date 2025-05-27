---
title: Sandbox
weight: 930
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
Writing certain file types across resources is blocked to prevent code injection:
- `.lua` - Lua source files
- `.dll` - Dynamic Link Libraries
- `.ts` - TypeScript files
- `.js`, `.mjs`, `.cjs` - JavaScript files
- `.cs` - C# source files

Note: Writing these files is allowed within the same resource, but blocked across different resources.

The `SaveResourceFile` native function follows these same restrictions.

### System Path Restrictions
- Operations in the server main folder are blocked
- Operations outside resource folders are blocked
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
{{% alert theme="warning" %}}
Enabling resource modifications or filesystem permissions can be dangerous if misused. Only enable these for resources you trust completely and understand their modifications.
{{% /alert %}}

### File System Permissions
To allow specific resources to write to other resources regardless of file extension restrictions, use the `add_filesystem_permission` configuration:

```lua
-- Allow resourceA to write any file type to resourceB
add_filesystem_permission resourceA write resourceB
```

This override grants full write access, bypassing the default file extension restrictions. Please note that author names need to match to authorize write access.

### ConVar Permissions
To restrict ConVar access to specific resources, use the `add_convar_permission` configuration:

```lua
-- Restrict reading of a ConVar to specific resources
add_convar_permission resourceA read some_convar_name
```

{{% alert theme="info" %}}
By default, ConVars are readable by all resources. Once a ConVar has at least one permission configured, it becomes restricted and only explicitly permitted resources can access it.
{{% /alert %}}

