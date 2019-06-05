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
        if sm[1] == "/command" then
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
