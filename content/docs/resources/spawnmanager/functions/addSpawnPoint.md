---
title: addSpawnPoint
---

## About
This export allows you to add a spawn point to the spawnmanager and returns an index for that spawnpoint.

## Name
```
addSpawnPoint
```

## Parameters

```
object spawn
```

### Required Arguments

- **spawn**: An object containing the following information:
    - **(float) x**: The x coordinate of where the player will be spawned.
    - **(float) y**: The y coordinate of where the player will be spawned.
    - **(float) z**: The z coordinate of where the player will be spawned.
    - **(float) heading**: The heading that the player is facing when spawned.
    - **(Hash) model**: The ped model hash the player will spawn as.
    - **(bool) skipFade**: Whether to skip the fade in and out when spawning.

Examples
--------

##### Lua Example:
```lua
local mySpawnPoint = exports.spawnmanager:addSpawnPoint({
    z = 111.5291,
    y = 197.7201,
    x = 466.8401,
    heading = 291.71,
    idx = 6,
    model = 1631478380,
    skipFade = false
})

-- Spawns the player at the spawn point we just created
exports.spawnmanager:spawnPlayer(mySpawnPoint)
```
