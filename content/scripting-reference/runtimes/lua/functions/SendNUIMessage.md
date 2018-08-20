```lua
local _sendNuiMessage = SendNuiMessage
function SendNUIMessage(message)
	_sendNuiMessage(json.encode(message))
end
```
