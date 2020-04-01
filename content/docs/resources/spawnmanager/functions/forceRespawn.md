---
title: forceRespawn
---

## About
If the auto-spawn flag is enabled, this export instantly and forcefully respawns the player, disregarding the 2 second cooldown.

## Name
```
forceRespawn
```

##### Lua Example:

```lua
Citizen.CreateThread(function()
    exports.spawnmanager:setAutoSpawn(true) -- must be true for this to work
    while true do
        if IsEntityDead(PlayerPedId()) then -- check if the player is dead
            exports.spawnmanager:forceRespawn() -- forcefully respawn without a cooldown
        end
        Citizen.Wait(100)
    end
end)
```
