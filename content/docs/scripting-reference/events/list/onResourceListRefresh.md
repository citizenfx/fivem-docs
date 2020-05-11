---
title: onResourceListRefresh
weight: 548
---

This event gets triggered once 'refresh' command gets executed.


Examples
--------
This example prints 'Resources list refreshed' once 'refresh' command is executed.

##### Lua Example:
```lua
AddEventHandler('onResourceListRefresh', function()
    print("Resources list refreshed")
end)
```
