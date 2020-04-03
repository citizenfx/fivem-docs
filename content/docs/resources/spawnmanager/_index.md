---
title: spawnmanager
---

## About
The spawnmanager is a base resource that handles the spawning of the player. It allows you to choose when and where to spawn the player and also control how they respawn.

Spawnmanager is included and maintained at the [cfx-server-data](https://github.com/citizenfx/cfx-server-data) repository.

Map resources for [mapmanager](../mapmanager) will have their spawnpoints loaded and usable in spawnmanager, as long as they are started *after* spawnmanager. 

## Exports

### Client
- [spawnPlayer](./functions/spawnPlayer)
- [addSpawnPoint](./functions/addSpawnPoint)
- [removeSpawnPoint](./functions/removeSpawnPoint)
- [loadSpawns](./functions/loadSpawns)
- [setAutoSpawn](./functions/setAutoSpawn)
- [setAutoSpawnCallback](./functions/setAutoSpawnCallback)
- [forceRespawn](./functions/forceRespawn)

## Events

### Client
- [playerSpawned](./events/playerSpawned)