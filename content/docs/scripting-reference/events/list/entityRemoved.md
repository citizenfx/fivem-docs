---
title: entityRemoved
weight: 551
---

This native is a server side native which requires [Onesync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered after the removal of an entity.

Parameters
----------

```
int entity
```

- **entity**: The removed entity.


Examples
--------
##### Lua Example:
This example triggers a message once an entity gets removed.
```lua
AddEventHandler("entityRemoved",  function(entity)
    print("Entity ID: "..tostring(entity).." got removed!")
end)
```
