---
title: registerMode
---

## About
Using this export allows you to add modes to your chat.<br>
Mode object structure:

```lua
message = {
  name = name,
  displayName = displayName,
  color = color,
  seObject = seObject,
  cb = cb
}
```

## Name
```
registerMode
```

Parameters
----------

```
object modeData
```

Examples
--------
This example adds a admin chat for all players with the permission `admin.chat`.

##### Lua Example:
```lua
exports.chat:registerMode({
  name = "adminChat",
  displayName = "Admin",
  color = "#fca503",
  seObject = "admin.chat",
  cb = function(source, message, cbs)
    cbs.updateMessage({
      template = "[ADMIN]" .. ' {}'
    })

    cbs.setSeObject("admin.chat")
  end
})
```

## Example Result:
![screenshot-1](/chat_registerMode.png)
