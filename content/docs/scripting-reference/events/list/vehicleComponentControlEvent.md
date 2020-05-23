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

- **vehicleGlobalId**: Vehicle's ID
- **pedGlobalId**: Ped's ID
- **componentIndex**: Component's ID.
- **request**: Whether the request was accepted or not (not sure...)
- **componentIsSeat**: Is the vehicle's component a seat.
- **pedInSeat**: Ped's seat ID.

Examples
--------
##### Lua Example:
```lua
-- TO DO
```
