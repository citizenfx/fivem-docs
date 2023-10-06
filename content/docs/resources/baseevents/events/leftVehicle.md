---
title: leftVehicle
---

Name
----------

```
baseevents:leftVehicle
```

Parameters
----------

```
vehicle currentVehicle, int currentSeat, string vehicleDisplayName, int vehicleNetId
```

- **currentVehicle**: The handle of the vehicle the player just left.
- **currentSeat**: The seat number (-1 is drivers seat, 0 = passenger right front, etc.) in which the player was previously sitting.
- **vehicleDisplayName**: A string containing the display name of the vehicle the player just left.
- **vehicleNetId**: The Network ID of the vehicle. Can be used with `NetToVeh()` to get the vehicle client side.

Examples
--------

Server.lua 
```
RegisterNetEvent("baseevents:leftVehicle", function(currentVehicle, currentSeat, vehicleDisplayName, vehicleNetId)
    TriggerClientEvent("example:leftVeh", -1, vehicleNetId)
end)
```

Client.lua
```
RegisterNetEvent("example:leftVeh", function(NetId)
    local veh = NetToVeh(NetId)
    print("Somebody left the vehicle: " .. veh)
end)
```
