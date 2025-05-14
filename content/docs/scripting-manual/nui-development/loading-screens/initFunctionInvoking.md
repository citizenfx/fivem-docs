---
title: initFunctionInvoking
toc_hide: true
---

Triggered when an init function is being invoked, as a result of [startInitFunctionOrder](../startInitFunctionOrder).

Several [onDataFileEntry](../onDataFileEntry) may be triggered after this.
After the init function finishes invoking, [initFunctionInvoked](../initFunctionInvoked) will be triggered.

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'initFunctionInvoking',
    type: string,
    name: string,
    idx: number,
}
```

- **eventName**: The event name.
- **type**: The type of init function being invoked.
- **name**: The name of the init function.
- **idx**: The index of the init function.
