---
title: vehicleComponentControlEvent
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a ped takes control of a vehicle's component.

## Parameters

```
string sender, table data
```

- **sender**: *number* The ID of the player that triggered the event.
- **data**: *table*
  - **vehicleGlobalId**: *number* Vehicle's ID
  - **pedGlobalId**: *number* Ped's ID
  - **componentIndex**: *number* Component's ID.
  - **request**: *boolean* Whether the request was accepted or not (not sure...)
  - **componentIsSeat**: *boolean* Is the vehicle's component a seat.
  - **pedInSeat**: *number* Ped's seat ID.

## Examples

### Lua Example:

```lua
-- TO DO
```
