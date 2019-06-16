---
title: RegisterNUICallback
---

Registers a callback in the client that can be called from the NUI.

Syntax
------

```lua
RegisterNUICallback(string callbackName, function callback[, any data, function cb])
```

### Required arguments
- **callbackName**: A string representing the callback name to call.

### Optional arguments
- **data**: The data sent from the NUI. Could be any data type.
- **cb**: A function that lets you send data back to the NUI.

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
