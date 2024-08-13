---
title: Citizen.SetTimeout
---

This will execute the specified function after the specified amount of milliseconds.

Syntax
------

```lua
Citizen.SetTimeout(int milliseconds, function callback)
```

### Required arguments
- **milliseconds**: The amount of milliseconds to pause the current thread.
- **callback**: The function to run after the timer completes.

Examples
--------

This example will print `This will be sent after 5 seconds.` to the console after waiting for 5 seconds, meanwhile all
other code around this part won't be blocked having to wait for this function to finish.

```lua
Citizen.SetTimeout(5000, function()
  print("This will be sent after 5 seconds.")
end)
```
