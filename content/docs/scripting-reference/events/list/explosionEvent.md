---
title: explosionEvent
weight: 551
---

This native is a server side native which requires [Onesync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when an explosion occurs.

Note #1: This event is pretty useful to catch cheaters. However, the source of explosion can be changed via ```lua AddOwnedExplosion ``` so do not take this event as a guarantee to ban cheaters.

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

- **content.explosionType**: valid types are:
```lua
local explosionsNames = {
	[0] = "GRENADE",
	[1] = "GRENADELAUNCHER",
	[2] = "STICKYBOMB",
	[3] = "MOLOTOV",
	[4] = "ROCKET",
	[5] = "TANKSHELL",
	[6] = "HI_OCTANE",
	[7] = "CAR",
	[8] = "PLANE",
	[9] = "PETROL_PUMP",
	[10] = "BIKE",
	[11] = "DIR_STEAM",
	[12] = "DIR_FLAME",
	[13] = "DIR_WATER_HYDRANT",
	[14] = "DIR_GAS_CANISTER",
	[15] = "BOAT",
	[16] = "SHIP_DESTROY",
	[17] = "TRUCK",
	[18] = "BULLET",
	[19] = "SMOKEGRENADELAUNCHER",
	[20] = "SMOKEGRENADE",
	[21] = "BZGAS",
	[22] = "FLARE",
	[23] = "GAS_CANISTER",
	[24] = "EXTINGUISHER",
	[25] = "PROGRAMMABLEAR",
	[26] = "TRAIN",
	[27] = "BARREL",
	[28] = "PROPANE",
	[29] = "BLIMP",
	[30] = "DIR_FLAME_EXPLODE",
	[31] = "TANKER",
	[32] = "PLANE_ROCKET",
	[33] = "VEHICLE_BULLET",
	[34] = "GAS_TANK",
	[35] = "FIREWORK",
	[36] = "SNOWBALL",
	[37] = "PROXMINE",
	[38] = "VALKYRIE_CANNON",
}
```

Note #2: Note that sometimes there are ghost explosions going around the map with damage scale, camera shake, etc... being set to 0 or false.

Examples
--------
##### Lua Example:
This example cancels all explosions in the game.
```lua
AddEventHandler("explosionEvent",  function(sender, content)
  CancelEvent()
end)
```
