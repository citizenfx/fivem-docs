---
title: TriggerClientEvent
---

Triggers an event on the specified client(s), and passes on any additional arguments.

Syntax
------

```lua
TriggerClientEvent(string eventName, int playerId[, ...])
```

### Required arguments
- **eventName**: A string representing the event name to call on the client.
- **playerId**: The ID of the player to call the event for. Specify -1 for all clients.

### Optional arguments
- **...**: Any additional data that should be passed along.

Examples
--------

-- CLIENT

Don't forget to [RegisterNetEvent][]!
```lua
AddEventHandler('eventName', function(text)
  print(('I just received %s from the server'):format(text)) -- I just received Hello world! from the server
end)
```
-- SERVER
```lua
TriggerClientEvent('eventName', playerId, 'Hello world!')
```
[RegisterNetEvent]: /docs/scripting-reference/runtimes/lua/functions/RegisterNetEvent/
