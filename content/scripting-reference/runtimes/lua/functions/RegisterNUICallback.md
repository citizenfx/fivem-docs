---
title: RegisterNUICallback
---

Registers a callback in the client that can be called from the NUI.

Syntax
------

```lua
RegisterNUICallback(string callbackName, function callback[, any data, any cb])
```

### Required arguments
- **callbackName**: A string representing the callback name to call.

### Optional arguments
- **data**: A string/table of data sent from the NUI.
- **cb**: A string/table of data you want to send back to the NUI.

Examples
--------
```lua
RegisterNUICallback('callbackName', function( data, cb )
  -- The data sent from the NUI is now accessible in the client file
  print( data )
  
  -- This will send the string "sendThisBack" back to the NUI
  cb( 'sendThisBack' )  
end)
```
