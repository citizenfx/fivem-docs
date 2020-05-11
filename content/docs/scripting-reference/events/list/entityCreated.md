---
title: entityCreated
weight: 551
---

This native is a server side native which requires [Onesync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered after the creation of an entity.

Parameters
----------

```
int entity
```

- **entity**: The created entity.


Examples
--------
##### Lua Example:
This example triggers a message once an entity gets created saying by who it was created/requested.
```lua
AddEventHandler("entityCreated",  function(entity)
  local owner = NetworkGetEntityOwner(entity)
  if (owner) then
   print("Entity ID: "..tostring(entity).." has been created by "..GetPlayerName(owner))
  end
end)
```
