---
title: vehicleComponentControlEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a ped takes control of a vehicle's component.

Parameters
----------

```
int vehicleGlobalId, int pedGlobalId, int componentIndex, bool request, bool componentIsSeat, int pedInSeat
```

- **vehicleGlobalId**: Vehicle's ID.
- **pedGlobalId**: Ped's ID.
- **componentIndex**: Component's ID.
- **request**: Whether the request was accepted or not (not sure...).
- **componentIsSeat**: Is the vehicle's component a seat.
- **pedInSeat**: Ped's seat ID.

Examples
--------
This example prints the name of the player and their seat and vehicle id.

##### Lua Example:
```lua
AddEventHandler("vehicleComponentControlEvent", function(player, content)
    print(GetPlayerName(player) .. " has taken control of seat " .. tostring(pedInSeat) ..  " in vehicle " .. tostring(vehicleGlobalId))
end)
```

##### C# Example:
```cs
EventHandlers["vehicleComponentControlEvent"] += new Action<int, dynamic>(OnVehicleComponentControlEvent);

private void OnVehicleComponentControlEvent(int player, dynamic content)
{
    string name = GetPlayerName(player.ToString());
    Debug.WriteLine($"{name} has taken control of seat {content.pedInSeat} in vehicle {content.vehicleGlobalId}");
}
```

