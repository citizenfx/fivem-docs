---
title: respawnPlayerPedEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a player respawns.

Parameters
----------

```
string player, table content
```

- **player**: The player that has respawned.
- **table**: A table which contains information regarding the player's respawn.

Examples
--------
This example prints the name of the player and his coordinates on respawn.
##### Lua Example:
```lua
AddEventHandler("respawnPlayerPedEvent", function(player, content)
	print(GetPlayerName(player).." has spawned at "..tostring(content.posX)..", "..tostring(content.posY)..", "..tostring(content.posZ))
end)
```
