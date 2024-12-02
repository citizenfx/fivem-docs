---
title: populationPedCreating
weight: 552
---

This event is fired before creating a population ped and allows manipulating population from script.
You can also cancel this event with CancelEvent().
Setters contains two function:
- setPosition to set the position where the ped is going to spawn at.
- setModel to set the model that the ped is going to spawn as.

Parameters
----------

```
float posX, float posY, float posZ, uint model, object setters
```

- **posX**: The X position the ped is going to spawn at.
- **posY**: The Y position the ped is going to spawn at.
- **posZ**: The Z position the ped is going to spawn at.
- **model**: The model the ped is going to spawn as.
- **setters**: Object to override what the ped spawns as.
  - **setModel(string model)** - Sets the model of the ped created.
  - **setPosition(float x, float y, float z)** - Adjusts the position of the ped.

Examples
--------

This example illustrates how you can intercept population:

##### Lua Example:
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

##### JavaScript Example:
```js
setImmediate(() => {
  RequestModel('s_m_y_cop_01')
})

on('populationPedCreating', (x, y, z, model, setters) => {
    console.log(`Making cop at ${x} ${y} ${z} plus a bit (${model})`);
    setters.setModel('s_m_y_cop_01') // you can use a hash as well
    setters.setPosition(x, y, z + 5.5)
})

```

##### C# Example:
```cs
const string replacement = "s_m_y_cop_01";
new Model(replacement).Request();

EventHandlers["populationPedCreating"] += new Action<float, float, float, uint, dynamic>(
        ( x, y, z, model, setters ) => {
            Debug.WriteLine( $"Making cop at {x}, {y}, {z} plus a bit ({(PedHash)model})" );
            setters.setModel( replacement );
            setters.setPosition( x, y, z + 5.5f );
        });

```
