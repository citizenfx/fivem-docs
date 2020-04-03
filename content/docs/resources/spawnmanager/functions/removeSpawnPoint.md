---
title: removeSpawnPoint
---

## About
This export allows you to remove an existing spawnpoint from the spawnmanager.

## Name
```
removeSpawnPoint
```

## Parameters

```
int spawnIdx
```

### Required Arguments

- **spawnIdx** The index of the spawnpoint to remove.

Examples
--------

##### Lua Example:
```lua
-- Add a new spawnpoint!
local mySpawnPoint = exports.spawnmanager:addSpawnPoint({
    z = 111.5291,
    y = 197.7201,
    x = 466.8401,
    heading = 291.71,
    idx = 6,
    model = 1631478380
})

-- Now let's remove it...
exports.spawnmanager:removeSpawnPoint(mySpawnPoint)
```
