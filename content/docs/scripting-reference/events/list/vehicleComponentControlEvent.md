---
title: vehicleComponentControlEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a ped takes control of a vehicle's component.

Parameters
----------

```
string sender, table data
```

- **sender**: *number* <p>The ID of the player that triggered the event.</p>
- **data**: *table*
  - **vehicleGlobalId**: *number* <p>Vehicle's ID</p>
  - **pedGlobalId**: *number* <p>Ped's ID</p>
  - **componentIndex**: *number* <p>Component's ID.</p>
  - **request**: *boolean* <p>Whether the request was accepted or not (not sure...)</p>
  - **componentIsSeat**: *boolean* <p>Is the vehicle's component a seat.</p>
  - **pedInSeat**: *number* <p>Ped's seat ID.</p>

Examples
--------
##### Lua Example:
```lua
-- TO DO
```
