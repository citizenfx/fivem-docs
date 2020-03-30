---
title: chat:addMessage
---

## About
Triggering this event allows you to send a chat message to this client.
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
chat:addMessage
```

Parameters
----------

```
object message
```

Examples
--------

This example sends a chat message to a player locally from a client script (only the executing client will see it).

##### Lua Example:
```lua
TriggerEvent('chat:addMessage', {
  color = { 255, 0, 0},
  multiline = true,
  args = {"Me", "Please be careful to not step on too many snails!"}
})
```

##### C\# Example:
```csharp
TriggerEvent("chat:addMessage", new
{
    color = new[] {255, 0, 0},
    multiline = true,
    args = new[] {"Me", "Please be careful to not step on too many snails!"}
});
```

##### JavaScript Example:
```javascript
emit('chat:addMessage', {
    color: [255, 0, 0],
    multiline: true,
    args: ['Me', 'Please be careful to not step on too many snails!']
});
```

### Example Result:
![screenshot-1](/chat_addMessage.png)
