---
title: chat:addSuggestions
---

## About
Triggering this event allows you to add multiple command suggestions to your chat using a single event.

## Name
```
chat:addSuggestions
```


Parameters
----------

```
array suggestions
```

- **suggestions**: an array containing multiple [suggestion](../chat-addSuggestion) objects.

Examples
--------

This example adds a command suggestion for the `/command` and `/othercommand` commands.

##### Lua Example:
```lua
-- Note, the command has to start with `/`.

TriggerEvent('chat:addSuggestions', {
    {
        name='/command',
        help='help text',
        params={
            { name="paramName1", help="param description 1" },
            { name="paramName2", help="param description 2" }
        }
    },
    {
        name='/othercommand',
        help='other help text',
        params={
            { name="otherParamName1", help="other param description 1" },
            { name="otherParamName2", help="other param description 2" }
        }
    },
})
