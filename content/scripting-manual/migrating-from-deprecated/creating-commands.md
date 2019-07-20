---
title: Creating commands
weight: 432
---

<!--
## The `chatMessage` method (deprecated)
In the past, people have used the `chatMessage` event to detect when a chat message is being sent. After that, they would use a string split method to see if the first argument in that table (of split strings) contained a command.

### Example
```lua
AddEventHandler("chatMessage", function(source, name, message)
    if string.sub(message, 1, 1) == "/" then
        sm = stringsplit(message, " ")
        if sm[1] == "/commandName" then
            print("Command was entered.")
        end
    end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end

    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
```
-->

## RegisterCommand
It is recommended to **always** use this (and not `chatMessage`!) as it allows for the use of the integrated ACL system, and other core functionality (automatic completion, console usage, ...). This native consists of 3 parameters (`commandName`[string], `handler`[func] and `restricted`[boolean]).

### Example
```lua
RegisterCommand("commandName", function(source --[[ this is the player ID (on the server): a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered ]])
    if source > 0 then
        print("You are not console.")
    else
        print("This is console!")
    end
end, true) -- this true bool means that the user cannot execute the command unless they have the 'command.commandName' ACL object allowed to one of their identifiers.
```

Further examples can be found at the respective [Lua](../../introduction/creating-your-first-script) and [C#](../../introduction/creating-your-first-script-csharp) introductions.
