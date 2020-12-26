---
title: removeWeaponEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a ped has a weapon removed over the network.

Parameters
----------

```
int pedId, int weaponType
```

- **pedId**: Ped id.
- **weaponType**: Weapon hash.

Examples
--------
This example prints the ped and the weapon they have had removed.

##### Lua Example:
```lua
AddEventHandler("removeWeaponEvent", function(player, content)
    print(tostring(content.pedId) .. " has has weapon of hash " .. tostring(content.weaponType) .. " removed")
end)
```

##### C# Example:
```cs
EventHandlers["removeWeaponEvent"] += new Action<int, dynamic>(OnRemoveWeaponEvent);

private void OnRemoveWeaponEvent(int player, dynamic content)
{
    Debug.WriteLine($"{content.pedId} has had weapon of hash {content.weaponType} removed");
}
```