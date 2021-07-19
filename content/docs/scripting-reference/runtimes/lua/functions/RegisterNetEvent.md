---
title: RegisterNetEvent
---

<!-- alias: RegisterServerEvent for server only -->

Marks the event safe for network use. Aka, allows you to trigger the eventName event on the client, from a server side
script. If you do not provide a callback function use [AddEventHandler][] to listen for the event after registering it.

Syntax
------

```lua
RegisterNetEvent(string eventName, function callback)
```

### Required arguments
- **eventName**: A string representing the event name to register.

### Optional arguments
- **callback**: The function to run when the event is called.

Examples
--------

```lua
RegisterNetEvent('eventName', function(...)
  print('Event fired')
end)
```

or

```lua
RegisterNetEvent('eventName')
AddEventHandler('eventName', function(...)
  print('Event fired')
end)
```

[AddEventHandler]: /docs/scripting-reference/runtimes/lua/functions/AddEventHandler
