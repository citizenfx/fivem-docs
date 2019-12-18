---
title: onClientResourceStop
weight: 546
---

Called after a resource stops.

Parameters
----------

```
string resourceName
```

- resourceName: The name of the resource that stopped.

Examples
--------
This example prints the name of the resource that was just stopped.

##### Lua Example:
```lua
AddEventHandler('onClientResourceStop', function (resourceName)
  print('The resource ' .. resourceName .. ' has been stopped on the client.')
end)
```

##### C\# Example:
```csharp
// In class constructor
EventHandlers["onClientResourceStop"] += new Action<string>(OnClientResourceStop);

// Delegate method
private void OnClientResourceStop(string resourceName)
{
    Debug.WriteLine($"The resource {resourceName} has been stopped on the client.");
}
```

##### JavaScript Example:
```js
on("onClientResourceStop", (resourceName) => {
  if(GetCurrentResourceName() != resourceName) {
    return;
  }

  console.log(`The resource ${resourceName} has been stopped on the client.`)
});
```
