---
title: onResourceStop
weight: 548
---

Called when a resource stops.

Parameters
----------

```
string resourceName
```

- resourceName: The name of the resource that stopped.

Examples
--------

##### JavaScript Example:
```js
on("onResourceStop", (resourceName) => {
  if(GetCurrentResourceName() != resourceName) {
    return;
  }

  console.log(`The resource ${resourceName} has been stopped.`)
});
```
