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

Lua's traditional way to register a net event and add an event handler:
```lua
RegisterNetEvent("eventName")
-- The event handler function follows after registering the event first.
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered.
end)
```

Lua's simplified way:
```lua
RegisterNetEvent("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered.
end)
```

-- SERVER
```lua
TriggerClientEvent('eventName', playerId, 'Hello world!')
```

[AddEventHandler]: /docs/scripting-reference/runtimes/lua/functions/AddEventHandler/
[RegisterNetEvent]: /docs/scripting-reference/runtimes/lua/functions/RegisterNetEvent/
