---
title: Creating commands
weight: 432
---

## The `chatMessage` method
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

## The [`RegisterCommand()`](https://runtime.fivem.net/doc/natives/#_0x5FA79B0F) -- which you should always be using
This is a somewhat recent addition to the CFX natives, it is recommended to use this as it allow for the use of the integrated ace permissions system. This native consists of 3 parameters (`commandName`[string], `handler`[func] and `restricted`[boolean]).

### Example
```lua
RegisterCommand("commandName", function(source --[[ this is the player ID: a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered]])
    if source > 0 then
        print("You are not console.")
    else
        print("This is console!")
    end
end, true) -- this true bool means that the user cannot execute the command unless they have the 'command.commandName' ace allowed to one of their identifiers.
```
