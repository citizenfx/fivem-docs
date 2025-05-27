---
title: endInitFunction
toc_hide: true
---

Triggered when init functions completed invoking, finalizing the [startInitFunction](../startInitFunction) event process.

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'endInitFunction',
    type: string,
}
```

- **eventName**: The event name.
- **type**: The type of init functions that finished invoking.
