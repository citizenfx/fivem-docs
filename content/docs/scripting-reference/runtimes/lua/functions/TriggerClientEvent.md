---
title: TriggerClientEvent
---

Triggers an event on the specified client(s), and passes on any additional arguments.

Syntax
------

```lua
TriggerClientEvent(string eventName, int or array playerIds[, ...])
```

### Required arguments
- **eventName**: A string representing the event name to call on the client.
- **playerIds**: The ID of the player to call the event for. Specify -1 for all clients or an array for specific IDs.

### Optional arguments
- **...**: Any additional data that should be passed along.

Examples
--------

### Specific Player ID
-- CLIENT

Don't forget to [RegisterNetEvent][]!
```lua
AddEventHandler('eventName', function(text)
  print(('I just received %s from the server'):format(text)) -- I just received Hello world! from the server
end)
```
-- SERVER
```lua
local playerId = 1
TriggerClientEvent('eventName', playerId, 'Hello world!')
```
[RegisterNetEvent]: /docs/scripting-reference/runtimes/lua/functions/RegisterNetEvent/

### Multiple Players ID

To call an event for multiple players, you need to include their IDs in an array. Here’s an example in Lua:

```lua
-- Define the player IDs to target
local playerIds = {1, 3, 5}  -- Replace with actual player IDs

-- Trigger the event for the specified players
TriggerClientEvent('eventName', -1, playerIds, { example = 0 })
```
This format ensures that the event is called for each player specified in the `playerIds` array.
