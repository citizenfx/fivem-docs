---
title: RemoveEventHandler
---

Removes the provided event handler.

Syntax
------

```lua
RemoveEventHandler(table eventHandlerData)
```

### Required arguments
- **eventHandlerData**: The return value of [AddEventHandler][].

Examples
--------

```lua
local eventA = AddEventHandler("someEvent", function()
  print("someEvent executed")
end)

TriggerEvent("someEvent")

RemoveEventHandler(eventA)
```

[AddEventHandler]: /docs/scripting-reference/runtimes/lua/functions/AddEventHandler
