---
title: clearTick
---

Removes a tick timer, stopping it from running. This is to be used in combination with a [setTick][setTick] id.

Syntax
------

```ts
clearTick(id);
```

### Required arguments
- **id**: The timer to be cleared.

Examples
--------

This example creates a tick timer that prints a string to the console. We then clear it 5000ms after the server/client started.

```ts
const timer = setTick(() => {
  console.log("I'm running.");
});

setTimeout(() => {
  clearTick(timer);
  console.log('I stopped running.');
}, 5000);

```

[setTick]: /docs/scripting-reference/runtimes/javascript/functions/setTick