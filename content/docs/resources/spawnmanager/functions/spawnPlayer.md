---
title: spawnPlayer
---

## About
This export allows you to choose specifically when or where to spawn a player. You'll most likely want to use this if you've turned off the auto-spawn flag with [setAutoSpawn](./functions/setAutoSpawn).

 Once the player has spawned, the [playerSpawned](../../events/playerSpawned) event will be triggered. 


## Name
```
spawnPlayer
```

## Parameters

```
spawnIdx, function callback(object spawn)
```

### Optional Arguments

 - `spawnIdx` this can be a spawn point from a map resource registered by [mapmanager](../../../mapmanager), or can be added with [addSpawnPoint](./functions/addSpawnPoint). Instead of an integer, you can pass a table defining a spawn point. If this isn't specified, a random spawn point will be picked out of the already registered spawn points (if any).

- `callback` is executed once the player has successfully spawned and passes a `spawn` object as specified in [playerSpawned](../../events/playerSpawned).

## Examples

##### Lua Example:
```lua
-- Spawns the player at a random spawnpoint
exports.spawnmanager:spawnPlayer()
```

```lua
-- Spawns the player at a specific spawnpoint with a callback
exports.spawnmanager:spawnPlayer(1, function(spawn)
    TriggerEvent('chat:addMessage', { args = { 'You have spawned! Congrats!' } })
end)
```

```lua
-- Spawns the player by passing a table as a spawnpoint
exports.spawnmanager:spawnPlayer({
    x = 466.8401,
    y = 197.7201,
    z = 111.5291,
    heading = 291.71,
    model = 'a_m_m_farmer_01',
    skipFade = false
})
```
`model` is optional in this case. Not specifying it will preserve whatever ped model the player was using beforehand, or if it's their initial spawn it will spawn them as Michael.
