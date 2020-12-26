---
title: weaponDamageEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when damage occurs between two entity using a weapon.

Parameters
----------

```
int damageType, int weaponType, bool overrideDefaultDamage, bool hitEntityWeapon, bool hitWeaponAmmoAttachment, bool silenced, int damageFlags, bool hasActionResult, int actionResultName, int actionResultId, int f104, int weaponDamage, bool isNetTargetPos, int localPosX, int localPosY, int localPosZ, bool f112, int damageTime, bool willKill, int f120, bool hasVehicleData, int f112_1, int parentGlobalId, int hitGlobalId, int tyreIndex, int suspensionIndex, int hitComponent, bool f133, bool hasImpactDir, int impactDirX, int impactDirY, int impactDirZ
```

- **damageType**: Damage type: 
```
0 = unknown (or incorrect weaponHash)
1 = no damage (flare,snowball, petrolcan)  
2 = melee  
3 = bullet  
4 = force ragdoll fall  
5 = explosive (RPG, Railgun, grenade)  
6 = fire(molotov)  
8 = fall (WEAPON_HELI_CRASH)  
10 = electric  
11 = barbed wire  
12 = extinguisher  
13 = gas  
14 = water cannon (WEAPON_HIT_BY_WATER_CANNON)  
```
- **weaponType**: Weapon's hash.
- **overrideDefaultDamage**: If it overrides damage.
- **hitEntityWeapon**: Whether the target entity has a weapon or not.
- **hitWeaponAmmoAttachment**: Whether the target entity has attachments or not.
- **silenced**: Whether the weapon is silenced or not.
- **damageFlags**: damage flag.
- **hasActionResult**: Unknown.
- **actionResultName**: Unknown.
- **actionResultId**: Unknown.
- **f104**: Unknown.
- **weaponDamage**: Damage caused by the weapon.
- **isNetTargetPos**: If it has an offset from an entity.
- **localPosX**: X component of entity offset.
- **localPosY**: Y component of entity offset.
- **localPosZ**: Z component of entity offset.
- **f112**: Unknown.
- **damageTime**: Damage time.
- **willKill**: Whether the damage is fatal or not.
- **hasVehicleData**: Whether it has vehicle data (probably used to check if the target entity is a vehicle).
- **f112_1**: Unknown.
- **parentGlobalId**: Source id (?).
- **hitGlobalId**: Target id (?).
- **tyreIndex**: Tyre index:
```
tyreIndex = 0 to 4 on normal vehicles  
0 = wheel_lf / bike, plane or jet front  
1 = wheel_rf  
2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left  
3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right  
4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left  
5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right  
45 = 6 wheels trailer mid wheel left  
47 = 6 wheels trailer mid wheel right  
```
- **suspensionIndex**: Suspension index.
- **hitComponent**: Hit component.
- **f133**: Unknown.
- **hasImpactDir**: If it has an impact direction.
- **impactDirX**: X component of impact direction.
- **impactDirY**: Y component of impact direction.
- **impactDirZ**: Z component of impact direction.


Examples
--------
Examples illistrate how to cancel weapon types of pistol.

##### Lua Example:
```lua
AddEventHandler("weaponDamageEvent", function(player, content)
    if content.weaponType == `WEAPON_PISTOL` then
        CancelEvent()
    end
end)
```

##### C# Example:
```cs
EventHandlers["weaponDamageEvent"] += new Action<int, dynamic>(OnWeaponDamageEvent);

private void OnWeaponDamageEvent(int player, dynamic content)
{
    if (content.weaponType == GetHashKey("WEAPON_PISTOL"))
    {
        CancelEvent();
    }
}
```