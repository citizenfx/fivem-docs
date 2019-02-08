---
title: TriggerServerEvent
---

Triggers the specified event on the server with optional data.

Syntax
------

```lua
TriggerServerEvent(string eventName[, ...])
```

### Required arguments
- **eventName**: A string representing the event name to call on the server.

### Optional arguments
- **...**: Any additional data that should be passed along.

Examples
--------
Client:
```lua
TriggerServerEvent('myEventName:someEvent', 'fish', 'I <3 snails')
```
Server:
```lua
RegisterServerEvent("myEventName:someEvent")
AddEventHandler("myEventName:someEvent", function(myData, myOtherData)
	print(GetPlayerName(source) .. ' triggered my event, they said: ' .. myData .. '! They also said: ' .. myOtherData)
end)
```
This will print something along the lines of: "Jarrrk triggered my event, they said: fish! They also said: I <3 snails"
