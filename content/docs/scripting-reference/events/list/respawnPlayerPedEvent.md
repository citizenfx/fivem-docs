---
title: respawnPlayerPedEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a player respawns.

Parameters
----------

```
int posX, int posY, int posZ, int f64, int f70, int f72, int f92, bool f96, bool f97, bool f99, bool f100, int f80, int f84, int f88
```

- **posX**: X component of player's spawn position.
- **posY**: Y component of player's spawn position.
- **posZ**: Z component of player's spawn position.
- **f64**: Unknown.
- **f70**: Unknown.
- **f72**: Unknown.
- **f92**: Unknown.
- **f96**: Unknown.
- **f97**: Unknown.
- **f99**: Unknown.
- **f100**: Unknown.
- **f80**: Unknown.
- **f84**: Unknown.
- **f88**: Unknown.

Examples
--------
This example prints the name of the player and their coordinates on respawn.

##### Lua Example:
```lua
AddEventHandler("respawnPlayerPedEvent", function(player, content)
	print(GetPlayerName(player).." has spawned at "..tostring(content.posX)..", "..tostring(content.posY)..", "..tostring(content.posZ))
end)
```

##### C# Example:
```cs
EventHandlers["respawnPlayerPedEvent"] += new Action<int, dynamic>(OnRespawnPlayerPedEvent);

private void OnRespawnPlayerPedEvent(int player, dynamic content)
{
	string name = GetPlayerName(player.ToString());
	Debug.WriteLine($"{name} has spawned at {content.posX}, {content.posY}, {content.posZ}");
}
```