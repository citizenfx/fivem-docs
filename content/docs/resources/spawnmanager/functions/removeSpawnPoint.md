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
    x = 466.8401,
    y = 197.7201,
    z = 111.5291,
    heading = 291.71,
    model = 'a_m_m_farmer_01'
})

-- Now let's remove it...
exports.spawnmanager:removeSpawnPoint(mySpawnPoint)
```
