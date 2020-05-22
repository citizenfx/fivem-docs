---
title: AddEventHandler
---

Use this to listen for events, see the [events][listening-for-events] page for more info.

Syntax
------

```lua
AddEventHandler(string eventName, function callback)
```

### Required arguments
- **eventName**: The name of the event you want to listen to.
- **callback**: The function to run when the event is called.

Examples
--------

-- SERVER

Don't forget to [RegisterNetEvent][]!
```lua
AddEventHandler('eventName', function(text)
  print(('I just received %s from %i'):format(text, source)) -- I just received Hello world! from (player id)
  -- source is a global variable (Player's id)
end)
```
-- CLIENT
```lua
TriggerServerEvent('eventName', 'Hello world!')
```
[listening-for-events]: /docs/scripting-manual/working-with-events/listening-for-events/
[RegisterNetEvent]: /docs/scripting-reference/runtimes/lua/functions/RegisterNetEvent/
