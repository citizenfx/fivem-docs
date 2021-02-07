---
title: registerMessageHook
---


## About
Using this export allows you to add message hooks to your chat that can modify and cancel chat messages.<br>
outMessage structure:

```lua
outMessage = {
  template = template,
  color = color,
  multiline = true,
  args = {author, otherArgs...}
}
```

## Name
```
registerMessageHook
```

Parameters
----------

```
function hookFunction
```

hookRef functions
----------

### updateMessage(`object messageObject`)
 - Updates the message object to the one specified in the function.
### cancel()
 - Cancels the sending of the current message.
### setSeObject(`string seObject`)
 - Changes the current message ace requirement.
### setRouting(`int/table player(s)`)
 - Changes the routing of the current message (Who it is being sent to).


Examples
--------
This example replaces all chat messages with the word slugs to snails.

##### Lua Example:
```lua
exports.chat:registerMessageHook(function(source, outMessage, hookRef)
  if string.find(string.lower(outMessage.args[2]), "slugs") then
    local filtered = string.gsub(string.lower(outMessage.args[2]), "slugs", "snails")
    hookRef.updateMessage({
      args = {
        outMessage.args[1],
        filtered -- updates the message with our version
      }
    })
    --hookRef.cancel() -- You can also just cancel the message
    exports.chat:addMessage(source, {
      color = {255, 0, 0},
      args = {"SYSTEM", "No slugs, just snails."}
    }) -- Send them a friendly message.
  end
end)
```

## Example Result:
![screenshot-1](/chat_registerMessageHook.png)
