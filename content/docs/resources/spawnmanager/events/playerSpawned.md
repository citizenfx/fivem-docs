---
title: playerSpawned
---

Parameters
----------

```
object spawnInfo
```

- **spawnInfo**: An object containing the following information:
    - **(float) x**: The x coordinate of where the player spawned to.
    - **(float) y**: The y coordinate of where the player spawned to.
    - **(float) z**: The z coordinate of where the player spawned to.
    - **(float) heading**: The heading that the player is facing when spawned.
    - **(int) idx**: The spawnpoint index.
    - **(Hash) model**: The ped model hash the player spawned as.
    - **(bool) skipFade**: Whether the fade was skipped when the player spawned.

Examples
--------

```js
{
    z: 111.5291,
    y: 197.7201,
    x: 466.8401,
    heading: 291.71,
    idx: 6,
    model: 1631478380
}
```
