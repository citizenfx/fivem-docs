---
title: TriggerEvent
---

Triggers the specified event with optional data.

Syntax
------

```lua
TriggerEvent(string eventName[, ...])
```

### Required arguments
- **eventName**: A string representing the event name to trigger.

### Optional arguments
- **...**: Any additional data that should be passed along.

Examples
--------

Client
```lua
TriggerEvent('eventName', 'Hello world!')
```
Server
```lua
RegisterNetEvent('eventName')
AddEventHandler('eventName', function(text)
  print(('I just received %s'):format(text)) -- I just received Hello world!
end)
```
