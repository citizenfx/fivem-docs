---
title: onPlayerKilled
---

Name
----------
```
baseevents:onPlayerKilled
```

Parameters
----------

```
player killerID, array deathData
```

- **killerID**: The Client ID of the player who killed the player or -1 if the player was run over by a vehicle (even if a player was driving it).
- **deathData**: An array containing the following things:
    - **(int) killerType**: The pedType of the ped who killed the player. (see screenshot below for the possible pedType values.)
    - **(hash) weaponHash**: The hash of the weapon which was used to kill the player.
    - **(bool) killerInVeh**: A boolean indicating if the killer was in a vehicle.
    - **(int) killerVehSeat**: The seat number in which the killer is sitting.
    - **(string) killerVehName**: The display name of the vehicle the killer is in (eg: 'Adder').
    - **(array) deathCoords**: An array containing the x, y, z coordinates of where the player died.

##### Ped types
![](/ped_types.png)

Examples
--------

TODO


<!-- TriggerEvent('baseevents:onPlayerKilled', killerid, {killertype=killertype, weaponhash = killerweapon, killerinveh=killerinvehicle, killervehseat=killervehicleseat, killervehname=killervehiclename, killerpos=table.unpack(GetEntityCoords(ped))}) -->
