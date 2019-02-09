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
This example removes the suggestion that was creating with the example of [chat:addSuggestion](../chat-addSuggestion).

##### Lua Example:
```lua
TriggerEvent('chat:removeSuggestion', '/command')
```

##### C\# Example:
```csharp
TriggerEvent("chat:removeSuggestion", "/command");
```
