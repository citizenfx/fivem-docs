---
title: entityCreating
weight: 551
---

This native is a server side native which requires [Onesync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered after the creation of an entity. This event is very useful to catch unauthorized created entities and delete them.

This event can be canceled by
```lua
CancelEvent()
```

Parameters
----------

```
int entity
```

- **entity**: The created entity.


Examples
--------
##### Lua Example:
This example cancels all requests of creating new entities.
```lua
AddEventHandler("entityCreating",  function(entity)
  CancelEvent()
end)
```
