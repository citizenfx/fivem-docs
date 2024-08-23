---
title: Migrating from CitizenMP.Server
weight: 360
toc_hide: true
description: >
  Got some ancient server? This is a guide on migrating.
---

### Loading Scripts

`require` doesn't exist anymore, any scripts/libraries should be loaded using the `server_script` directive in the resource manifest.

For example:

``` lua
server_script "my_script.lua" -- load script
server_script "my_lib.net.dll" -- load a particular assembly into the .net appdomain
server_script "@resource_name/script.lua" -- load a script from another resource
```

To load files at runtime, you can use [LOAD\_RESOURCE\_FILE]({{% native "LOAD_RESOURCE_FILE" %}}) (`LoadResourceFile("resource_name", "file_name")`), and for example if it is a Lua file you can use

``` lua
load(...)
```

to load the Lua code, like in the following example:

``` lua
function loadLuaFile(resource, file)
    return load(LoadResourceFile(resource, file), file)()
end
```

### String Splitting

`str:Split` does not exist anymore, you should use the proper Lua functions for this. For the commonly copy-pasted `stringsplit` function, this would be:

``` lua
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
```

### Bitwise Operations

Lua 5.3 deprecated `bit32`, and the CfxLua runtime does not enable it. Bitwise operations now work using normal operators (`&`, `|`, ...) like in most other programming languages.

### CLR

NeoLua is no longer in use, so the `clr` namespace does not exist anymore. If you need to run C\# code, use the normal .NET runtime and server exports.

### TempIDs

If you did any specific bitwise operations assuming during `playerConnecting` the `source` value is above 0x10000, this should not be needed anymore to use functions during `playerConnecting`.
