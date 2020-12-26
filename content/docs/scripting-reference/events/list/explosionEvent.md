---
title: explosionEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a networked explosion occurs.

Parameters
----------

```
int f186, int f208, int ownerNetId, int f214, int explosionType, int damageScale, int posX, int posY, int PosZ, bool f242, int f104, int cameraShake, bool isAudible, bool f189, bool isInvisible, bool f126, bool f241, bool f243, int f210, int unkX, int unkY, int unkZ, bool f190, bool f191, int f164, int posX224, int posY224, int posZ224, bool f240, int f218, bool f216
```

- **f186**: Unknown.
- **f208**: Unknown.
- **ownerNetId**: Net id of entity which owned the explosion.
- **f214**: Unknown.
- **explosionType**: Explosion Type:
```
0 = GRENADE
1 = GRENADELAUNCHER
2 = STICKYBOMB
3 = MOLOTOV
4 = ROCKET
5 = TANKSHELL
6 = HI_OCTANE
7 = CAR
8 = PLANE
9 = PETROL_PUMP
10 = BIKE
11 = DIR_STEAM
12 = DIR_FLAME
13 = DIR_WATER_HYDRANT
14 = DIR_GAS_CANISTER
15 = BOAT
16 = SHIP_DESTROY
17 = TRUCK
18 = BULLET
19 = SMOKEGRENADELAUNCHER
20 = SMOKEGRENADE
21 = BZGAS
22 = FLARE
23 = GAS_CANISTER
24 = EXTINGUISHER
25 = PROGRAMMABLEAR
26 = TRAIN
27 = BARREL
28 = PROPANE
29 = BLIMP
30 = DIR_FLAME_EXPLODE
31 = TANKER
32 = PLANE_ROCKET
33 = VEHICLE_BULLET
34 = GAS_TANK
35 = BIRD_CRAP
36 = RAILGUN
37 = BLIMP2
38 = FIREWORK
39 = SNOWBALL
40 = PROXMINE
41 = VALKYRIE_CANNON
42 = AIR_DEFENCE
43 = PIPEBOMB
44 = VEHICLEMINE
45 = EXPLOSIVEAMMO
46 = APCSHELL
47 = BOMB_CLUSTER
48 = BOMB_GAS
49 = BOMB_INCENDIARY
50 = BOMB_STANDARD
51 = TORPEDO
52 = TORPEDO_UNDERWATER
53 = BOMBUSHKA_CANNON
54 = BOMB_CLUSTER_SECONDARY
55 = HUNTER_BARRAGE
56 = HUNTER_CANNON
57 = ROGUE_CANNON
58 = MINE_UNDERWATER
59 = ORBITAL_CANNON
60 = BOMB_STANDARD_WIDE
61 = EXPLOSIVEAMMO_SHOTGUN
62 = OPPRESSOR2_CANNON
63 = MORTAR_KINETIC
64 = VEHICLEMINE_KINETIC
65 = VEHICLEMINE_EMP
66 = VEHICLEMINE_SPIKE
67 = VEHICLEMINE_SLICK
68 = VEHICLEMINE_TAR
69 = SCRIPT_DRONE
70 = RAYGUN
71 = BURIEDMINE
72 = SCRIPT_MISSILE
```
- **damageScale**: Damage scale.
- **posX**: X component of the explosion's position.
- **posY**: Y component of the explosion's position.
- **posZ**: Z component of the explosion's position.
- **f242**: Unknown.
- **f104**: Unknown.
- **cameraShake**: Camera shake amount.
- **isAudible**: Is the explosion audiable.
- **f189**: Unknown.
- **isInvisible**: Is the explosion invisible.
- **f126**: Unknown.
- **f241**: Unknown.
- **f243**: Unknown.
- **f210**: Unknown.
- **unkX**: X component of an unknown vector.
- **unkY**: Y component of an unknown vector.
- **unkZ**: Z component of an unknown vector.
- **f190**: Unknown.
- **f191**: Unknown.
- **f164**: Unknown.
- **posX224**: X component of a vector if f224 is true.
- **posY224**: Y component of a vector if f224 is true.
- **posZ224**: Z component of a vector if f224 is true.
- **f240**: Unknown.
- **f218**: Unknown.
- **f216**: Unknown.

Examples
--------
Examples illistrate how to cancel explosion types of STICKYBOMB. Setting up a wrapper of explosionTypes is recommended.

##### Lua Example:
```lua
AddEventHandler("explosionEvent", function(player, content)
    if content.explosionType == 2 then
        CancelEvent()
    end
end)
```

##### C# Example:
```cs
EventHandlers["explosionEvent"] += new Action<int, dynamic>(OnExplosionEvent);

private void OnExplosionEvent(int player, dynamic content)
{
    if (content.explosionType == 2)
    {
        CancelEvent();
    }
}
```