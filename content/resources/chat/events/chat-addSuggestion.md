---
title: chat:addSuggestion
---

Triggering this event allows you to add command suggestions to your chat.

Parameters
----------

```
string commandName, string commandDescription, object commandParameters
```

Examples
--------

```lua
-- Note, the command has to start with `/`.
TriggerEvent('chat:addSuggestion', '/command', 'help text', {
    { name="paramName1", help="param description 1" },
    { name="paramName2", help="param description 2" }
})
```
