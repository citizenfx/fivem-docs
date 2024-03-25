---
title: onClientGameTypeStart
---

Parameters
----------

```
string resourceName
```

- **resourceName**: The name of the resource/gametype that started.

Examples
--------

##### JavaScript Example:
```js
on('onClientMapStart', name => {
   console.log('Map started: ', name);
});
```
