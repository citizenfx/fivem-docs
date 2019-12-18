---
title: onResourceStart
weight: 547
---

Called while a resource starts.

Parameters
----------

```
string resourceName
```

- resourceName: The name of the resource that started.

Examples
--------
This example prints the name of the current resource, upon start.

##### Lua Example:
```lua
AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  print('The resource ' .. resourceName .. ' has been started.')
end)
```

##### C\# Example:
```csharp
// in the class constructor
EventHandlers["onResourceStart"] += new Action<string>(OnResourceStart);

// delegate method
private void OnResourceStart(string resourceName)
{
  if (GetCurrentResourceName() != resourceName) return;

  Debug.WriteLine($"The resource {resourceName} has been started.");
}
```

##### JavaScript Example:
```js
on("onResourceStart", (resourceName) => {
  if(GetCurrentResourceName() != resourceName) {
    return;
  }

  console.log(`The resource ${resourceName} has been started.`)
});
```
