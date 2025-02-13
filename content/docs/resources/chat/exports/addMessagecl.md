---
title: addMessage (client)
---

## About
Using this export allows you to add a message to the local players chat.<br>
Message object structure:

```lua
message = {
  template = template,
  color = color,
  multiline = true,
  args = {author, otherArgs...}
}
```

## Name
```
addMessage
```

Parameters
----------

```
object/string message
```

Examples
--------

This example sends a chat message to a player locally from a client script (only the executing client will see it).

##### Lua Example:
```lua
AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  exports.chat:addMessage({
    color = {255, 0, 0},
    args = {"SYSTEM", string.format("%s has started.", resourceName)}
  })
end)
```

##### C# Example:
```c#
using Newtonsoft.Json;
// ...
EventHandlers["onResourceStart"] += new Action<string>(OnResourceStart); // add this in the class constructor
// ...
void OnResourceStart(string resourceName)
{
    if (API.GetCurrentResourceName() != resourceName) return;
    Exports["cl_chat"].addMessage(new
        {
            color = new[] { 255, 0, 0 },
            multiline = true,
            args = new[] { "[SYSTEM]", API.GetCurrentResourceName() + " has started." }
        });
}
```

Output:<br>
![screenshot-1](/chat_addMessage_export.png)
