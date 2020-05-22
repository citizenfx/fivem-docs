---
title: RegisterNetEvent
---

<!-- alias: RegisterServerEvent for server only -->

Marks the event safe for network use. Aka, allows you to trigger the eventName event on the client, from a server side
script. Use [AddEventHandler][] to listen for the event after registering it.

Syntax
------

```lua
RegisterNetEvent(string eventName)
```

### Required arguments
- **eventName**: A string representing the event name to register.

Examples
--------

```lua
RegisterNetEvent('eventName')
AddEventHandler('eventName', function(...)
  print('Event fired')
end)
```

[AddEventHandler]: /docs/scripting-reference/runtimes/lua/functions/AddEventHandler
