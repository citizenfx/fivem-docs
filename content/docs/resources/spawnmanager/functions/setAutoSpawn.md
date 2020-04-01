---
title: setAutoSpawn
---

## About
This export allows you to change the auto-spawning flag. 

When this is enabled, players will be automatically spawned after the loading screen. They will also be automatically respawned with a 2 second cooldown. To instantly and forcefully respawn the player without the cooldown, use [forceRespawn](./functions/forceRespawn).

If the auto-spawning flag is disabled, you will have to manually spawn players when they first log in and also manually respawn players when they die, could be useful in an environment where you don't want instant respawn. 

## Name
```
setAutoSpawn
```

## Parameters

```
bool enabled
```

### Required Arguments

- **enabled** Whether to enable or disable auto-spawning. 

##### Lua Example:
```lua
exports.spawnmanager:setAutoSpawn(true)
```
