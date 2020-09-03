---
title: setAutoSpawnCallback
---

## About
This export allows you to choose your own callback for autospawning.

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
local firstSpawn = true
exports.spawnmanager:setAutoSpawnCallback(function()
    if firstSpawn then
        -- Spawn them at the spawnpoint
        exports.spawnmanager:spawnPlayer({
            x = 466.8401,
            y = 197.7201,
            z = 111.5291,
            heading = 291.71,
            model = 'a_m_m_farmer_01',
            skipFade = false
        })
        firstSpawn = false
    else
        -- Respawn them at the hospital
        exports.spawnmanager:spawnPlayer({
            x = 354.09,
            y = -603.54,
            z = 28.78,
            heading = 260.0,
            skipFade = false
             -- 'model' is left out here so that their ped model is preserved
        }, function(spawn)
            ClearPedBloodDamage(PlayerPedId())
        end)
    end
end)
exports.spawnmanager:setAutoSpawn(true)
```
