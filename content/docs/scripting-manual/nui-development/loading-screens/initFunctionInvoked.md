---
title: initFunctionInvoked
toc_hide: true
---

Triggered after an init function was invoked, after [initFunctionInvoking](../initFunctionInvoking).

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'initFunctionInvoked',
    type: string,
    name: string,
}
```

- **eventName**: The event name.
- **type**: The type of init function that was invoked.
- **name**: The name of the init function.
