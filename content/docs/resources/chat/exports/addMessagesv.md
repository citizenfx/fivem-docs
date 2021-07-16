---
title: addMessage (server)
---

## About
Using this export allows you to add a message to the target players chat.<br>
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
int target, object/string message
```

Examples
--------

This example sends a chat message to all players.

##### Lua Example:
```lua
AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  exports.chat:addMessage(-1, {
    color = {255, 0, 0},
    args = {"SYSTEM", string.format("%s has started.", resourceName)}
  })
end)
```
Output:<br>
![screenshot-1](/chat_addMessage_export.png)
