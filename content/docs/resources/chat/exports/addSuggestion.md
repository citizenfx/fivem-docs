---
title: addSuggestion
---

## About
Using this export allows you to add command suggestions to your chat.

## Name
```
addSuggestion
```

Parameters
----------

```
string commandName, string commandDescription, object commandParameters
```

Examples
--------
This example adds a command suggestion for the `/command` command.

##### Lua Example:
```lua
-- Note, the command has to start with `/`.
exports.chat:addSuggestion('/command', 'help text', {
    { name="paramName1", help="param description 1" },
    { name="paramName2", help="param description 2" }
})
```

## Example Result:
![screenshot-1](/chat_addSuggestion.png)
