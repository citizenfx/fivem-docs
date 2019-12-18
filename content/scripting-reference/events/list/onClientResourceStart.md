---
title: onClientResourceStart
weight: 545
---

Called after a resource starts.

Parameters
----------

```
string resourceName
```

- resourceName: The name of the resource that started.

Examples
--------
This example prints the name of the resource it was in, upon start.

##### Lua Example:
```lua
AddEventHandler('onClientResourceStart', function (resourceName)
  if(GetCurrentResourceName() ~= resourceName) then
    return
  end
  print('The resource ' .. resourceName .. ' has been started on the client.')
end)
```

##### C\# Example:
```csharp
// In class constructor
EventHandlers["onClientResourceStart"] += new Action<string>(OnClientResourceStart);

// Delegate method
// - assuming `using static CitizenFX.Core.Native.API`
private void OnClientResourceStart(string resourceName)
{
    if(GetCurrentResourceName() != resourceName) return;

    Debug.WriteLine($"The resource {resourceName} has been started on the client.");
}
```

##### JavaScript Example:
```js
on("onClientResourceStart", (resourceName) => {
  if(GetCurrentResourceName() != resourceName) {
    return;
  }
  console.log(`The resource ${resourceName} has been started on the client.`)
});
```
