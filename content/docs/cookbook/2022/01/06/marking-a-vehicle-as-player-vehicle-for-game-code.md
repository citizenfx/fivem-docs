---
title: Marking a vehicle as 'player vehicle' for game code
date: 2022-01-06T20:15:28.000+01:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **January 06, 2022**. Newer information may exist.
{{< /alert >}}

A recent finding from [the forums](https://forum.cfx.re/t/radio-does-not-re-init-play-when-exceeding-40-0-units/4797420/4?u=d-bubble) is that the GTA game code checks for the presence of a decorator named `player_vehicle` on entities to enable/disable certain behavior for player-driven vehicles (e.g. personal vehicles?).

Among other things, this includes:

*   Radio emitters for the radio station the car is playing
*   Some special behavior for entering the vehicle via a door (i.e. the 'enter vehicle' key)

Example code
------------

```lua
-- somewhere *once* during initialization
DecorRegister("Player_Vehicle", 3)

-- on a vehicle
if DecorIsRegisteredAsType("Player_Vehicle", 3) then
    DecorSetInt(vehicle, "Player_Vehicle", -1)
end
```
