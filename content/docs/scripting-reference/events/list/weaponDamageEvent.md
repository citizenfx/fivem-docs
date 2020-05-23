---
title: weaponDamageEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when damage occurs between two entity using a weapon.

Parameters
----------

```
int damageType, int weaponType, bool overrideDefaultDamage, bool hitEntityWeapon, bool hitWeaponAmmoAttachment, bool silenced, int damageFlags, bool f80_1, int f100, int f116, int f104, int weaponDamage, bool f135, int f48, int f52, int f56, bool f112, int damageTime, bool willKill, int f120, bool hasVehicleData, int f112_1, int parentGlobalId, int hitGlobalId, int tyreIndex, int suspensionIndex, int hitComponent, bool f133, bool f125, int f64, int f68, int f72
```

- **damageType**: Damage type: 
```
0= unknown (or incorrect weaponHash)
1= no damage (flare,snowball, petrolcan)  
2= melee  
3= bullet  
4= force ragdoll fall  
5= explosive (RPG, Railgun, grenade)  
6= fire(molotov)  
8= fall (WEAPON_HELI_CRASH)  
10= electric  
11= barbed wire  
12= extinguisher  
13= gas  
14= water cannon (WEAPON_HIT_BY_WATER_CANNON)  
```
- **weaponType**: weapon's hash.
- **overrideDefaultDamage**: if it overrides damage.
- **hitEntityWeapon**: whether the target entity has a weapon or not.
- **hitWeaponAmmoAttachment**: whether the target entity has attachments or not.
- **silenced**: whether the weapon is silenced or not.
- **damageFlags**: damage flag.
- **f80_1**: Unknown.
- **f100**: Unknown.
- **f116**: Unknown.
- **f104**: Unknown.
- **weaponDamage**: damage caused by the weapon.
- **f135**: Unknown.
- **f48**: Unknown.
- **f52**: Unknown.
- **f56**: Unknown.
- **f112**: Unknown.
- **damageTime**: Damage time.
- **willKill**: whether the damage is fatal or not.
- **hasVehicleData**: whether it has vehicle data (probably used to check if the target entity is a vehicle).
- **f112_1**: Unknown.
- **parentGlobalId**: Source id (?).
- **hitGlobalId**: Target id (?).
- **tyreIndex**: Tyre index:
```
tyreIndex = 0 to 4 on normal vehicles  
'0 = wheel_lf / bike, plane or jet front  
'1 = wheel_rf  
'2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left  
'3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right  
'4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left  
'5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right  
'45 = 6 wheels trailer mid wheel left  
'47 = 6 wheels trailer mid wheel right  
```
- **suspensionIndex**: Suspension index.
- **hitComponent**: hit component.
- **f133**: Unknown.
- **f125**: Unknown.
- **f64**: Unknown.
- **f68**: Unknown.
- **f72**: Unknown.


Examples
--------
##### Lua Example:
```lua
-- TO DO
```
