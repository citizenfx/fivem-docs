---
title: RegisterNUICallback
---

Registers a callback in the client that can be called from the NUI.

Syntax
------

```lua
RegisterNUICallback(string callbackName, function callback[, any data, string cb])
```

### Required arguments
- **callbackName**: A string representing the callback name to call.

### Optional arguments
- **data**: The data sent from the NUI.
- **cb**: A string of data to send with the request.

Examples
--------
```lua
RegisterNUICallback('callbackName', function( data, cb )
  -- The data sent from the NUI is now accessible in the client file
  print( data )
  
  -- This will send a callback to the NUI
  cb( 'sendThisBack' )  
end)
```
