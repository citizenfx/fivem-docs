---
title: SendNUIMessage
---

Use this to send data to the NUI (NewUI)

Syntax
------

```lua
SendNUIMessage(table data)
```

### Required arguments
- **data** data that will be sent and received in NUI

Examples
--------

LUA
```lua
SendNUIMessage({
	hello = "world",
	action = "showMessage"
})
```

JS (NUI PART)
```js
window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'showMessage') {
		console.log(`Hello ${data.hello}!`) // will print Hello world! in the console (F8)
	}
})
```
