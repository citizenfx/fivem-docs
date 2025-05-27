---
title: onDataFileEntry
toc_hide: true
---

Triggered when a data file entry occurred, as either a result of
[startDataFileEntries](../startDataFileEntries) or [initFunctionInvoking](../initFunctionInvoking).

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'onDataFileEntry',
    name: string,
    type: number,
    isNew: boolean,
}
```

- **eventName**: The event name.
- **name**: The name of the data file entry.
- **type**: The type of the data file entry.
- **isNew**: Whether this data file entry is new.
