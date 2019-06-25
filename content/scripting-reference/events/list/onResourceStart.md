---
title: onResourceStart
weight: 547
---

Called when a resource starts.

Parameters
----------

```
string resourceName
```

- resourceName: The name of the resource that started.

Examples
--------

##### JavaScript Example:
```js
on("onResourceStart", (resourceName) => {
  if(GetCurrentResourceName() != resourceName) {
    return;
  }

  console.log(`The resource ${resourceName} has been started.`)
});
```
