---
title: endDataFileEntries
toc_hide: true
---

Triggered when data file entries have ended, after the [startDataFileEntries](../startDataFileEntries) event
and several [onDataFileEntry](../onDataFileEntry) events.

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'endDataFileEntries',
}
```

- **eventName**: The event name.
