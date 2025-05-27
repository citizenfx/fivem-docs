---
title: startDataFileEntries
toc_hide: true
---

Triggered when data file entries are incoming.

Several [onDataFileEntry](../onDataFileEntry) events will be triggered after this,
and a [endDataFileEntries](../endDataFileEntries) event will be triggered after the given data files entries are done.

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'startDataFileEntries',
    count: number,
}
```

- **eventName**: The event name.
- **count**: The amount of data file entries incoming.
