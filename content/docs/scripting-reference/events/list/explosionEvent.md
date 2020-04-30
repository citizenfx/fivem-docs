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
	[39] = "AIR_DEFENCE",
	[40] = "PIPEBOMB",
	[41] = "VEHICLEMINE",
	[42] = "EXPLOSIVEAMMO",
	[43] = "APCSHELL",
	[44] = "BOMB_CLUSTER",
	[45] = "BOMB_GAS",
	[46] = "BOMB_INCENDIARY",
	[47] = "BOMB_STANDARD",
	[48] = "TORPEDO",
	[49] = "TORPEDO_UNDERWATER",
	[50] = "BOMBUSHKA_CANNON",
	[51] = "BOMB_CLUSTER_SECONDARY",
	[52] = "HUNTER_BARRAGE",
	[53] = "HUNTER_CANNON",
	[54] = "ROGUE_CANNON",
	[55] = "MINE_UNDERWATER",
	[56] = "ORBITAL_CANNON",
	[57] = "BOMB_STANDARD_WIDE",
	[58] = "EXPLOSIVEAMMO_SHOTGUN",
	[59] = "OPPRESSOR2_CANNON",
	[60] = "MORTAR_KINETIC",
	[61] = "VEHICLEMINE_KINETIC",
	[62] = "VEHICLEMINE_EMP",
	[63] = "VEHICLEMINE_SPIKE",
	[64] = "VEHICLEMINE_SLICK",
	[65] = "VEHICLEMINE_TAR",
	[66] = "SCRIPT_DRONE",
	[67] = "RAYGUN",
	[68] = "BURIEDMINE",
	[69] = "SCRIPT_MISSIL",
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
