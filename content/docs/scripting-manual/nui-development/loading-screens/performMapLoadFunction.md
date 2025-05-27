---
title: performMapLoadFunction
toc_hide: true
---

Triggered when a map load function was called, either by itself or as a result of [onDataFileEntry](../onDataFileEntry).

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'performMapLoadFunction',
    idx: number,
}
```

- **eventName**: The event name.
- **idx**: The map index.
