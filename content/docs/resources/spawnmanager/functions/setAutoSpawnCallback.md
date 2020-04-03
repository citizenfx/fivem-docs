---
title: setAutoSpawnCallback
---

## About
This export allows you to choose your own callback for autospawning, instead of using spawnmanager's 'native' [spawnPlayer](https://github.com/citizenfx/cfx-server-data/blob/2bde7889b4593d842e911827a33294211f40de93/resources/%5Bmanagers%5D/spawnmanager/spawnmanager.lua#L207) function. 

## Name
```
setAutoSpawnCallback
```

## Parameters

```
function callback
```

### Required Arguments

- **callback** The callback to execute when auto-spawning the player.

##### Lua Example:
```lua
exports.spawnmanager:setAutoSpawnCallback(function()
    -- todo fancy spawning stuff
end)
```
