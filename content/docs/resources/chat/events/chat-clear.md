---
title: chat:clear
---

## About
Clears the chat messages/history and the sent messages history buffer.

## Name
```
chat:clear
```

Parameters
----------

This event has no parameters.

Examples
--------
This example registers a `/clear` command that clears the chat.

##### Lua Example:
```lua
RegisterCommand('clear', function(source, args)
    TriggerEvent('chat:clear')
end, false)
```

##### C\# Example:
```csharp
// In a method or the class constructor
RegisterCommand("clear", new Action<int, List<object>, string>(source, args, raw) =>
{
    TriggerEvent("chat:clear")
}, false);
```

##### JavaScript Example:
```javascript
RegisterCommand('clear', (source, args) => {
    emit('chat:clear');
}, false);
```
