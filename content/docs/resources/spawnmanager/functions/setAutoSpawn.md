---
title: setAutoSpawn
---

## About
This export allows you to change the auto-spawning flag.

When this is enabled, players will be automatically spawned upon joining the server at a random spawnpoint. After dying, they will also be respawned after 2 seconds. To instantly and forcefully respawn the player without the cooldown, use [forceRespawn](../forceRespawn).

To determine which spawn point to use in auto-spawning, use [setAutoSpawnCallback](../setAutoSpawnCallback).

If auto-spawning is disabled, you have to manually call [spawnPlayer](../spawnPlayer).

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
