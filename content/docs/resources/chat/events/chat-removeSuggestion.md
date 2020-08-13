---
title: chat:removeSuggestion
---

## About
Triggering this allows you to remove any existing command suggestions for the specified command.

## Name
```
chat:removeSuggestion
```

Parameters
----------

```
string commandName
```

Examples
--------
This example removes the suggestion that was created with the example of [chat:addSuggestion](../chat-addSuggestion).

##### Lua Example:
```lua
TriggerEvent('chat:removeSuggestion', '/command')
```

##### C\# Example:
```csharp
TriggerEvent("chat:removeSuggestion", "/command");
```

##### JavaScript Example:
```javascript
emit('chat:removeSuggestion', '/command');
```
