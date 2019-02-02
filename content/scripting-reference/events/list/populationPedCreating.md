---
title: populationPedCreating
weight: 551
---

This event is fired after population creation and allows manipulating population from script. 
You can use setPosition and setModel.

Parameters
----------

```
int posX, int posY, int posZ, string model, object setters
```

- **posX**: X spawn position.
- **posY**: Y spawn position.
- **posZ**: Z spawn position.
- **model**: Spawn model.
- **setters**: The source object of the ped, that can be used with a limited set of functions only.

Examples
--------

This example illustrates how you can intercept population:

```lua
CreateThread(function()
    RequestModel('s_m_y_cop_01')
end)

AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
    Citizen.Trace(('making cop at %s %s %s plus a bit (was %s)\n'):format(tostring(x), tostring(y), tostring(z), tostring(model)))

    setters.setModel('s_m_y_cop_01') -- you can use a hash as well
    setters.setPosition(x, y, z + 5.5)

    -- you can also CancelEvent() to skip creating the ped
end)
```
