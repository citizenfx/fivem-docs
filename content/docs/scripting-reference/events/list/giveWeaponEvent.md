---
title: giveWeaponEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a ped is given a weapon over the network.

Parameters
----------

```
int pedId, int weaponType, bool unk1, int ammo, bool givenAsPickup
```

- **pedId**: Ped id.
- **weaponType**: Weapon hash.
- **unk1**: Unknown.
- **ammo**: Amount of ammo given.
- **givenAsPickup**: Is weapon given as a pickup.

Examples
--------
This example prints the ped and the weapon they recieved.

##### Lua Example:
```lua
AddEventHandler("giveWeaponEvent", function(player, content)
    print(tostring(content.pedId) .. " has been given weapon of hash " .. tostring(content.weaponType))
end)
```

##### C# Example:
```cs
EventHandlers["giveWeaponEvent"] += new Action<int, dynamic>(OnGiveWeaponEvent);

private void OnGiveWeaponEvent(int player, dynamic content)
{
    Debug.WriteLine($"{content.pedId} has been given weapon of hash {content.weaponType}");
}
```