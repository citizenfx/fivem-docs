---
title: explosionEvent
weight: 551
---

This native is a server side native which requires [Onesync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when an explosion occurs.

This event can be canceled by
```
CancelEvent()
```

Parameters
----------

```
int sender, table content
```

- **sender**: The player that sends the request.
- **content**: A table which contains all the necessary information:
```
ownerNetId, explosionType, damageScale, cameraShake, posX, posY, posZ, isAudible, isInvisible
```
(Use content.ownerNetId, content.explosionType, etc... to access those values)

Examples
--------
##### Lua Example:
This example cancels all explosions in the game.
```lua
AddEventHandler("explosionEvent",  function(sender, content)
  CancelEvent()
end)
```
