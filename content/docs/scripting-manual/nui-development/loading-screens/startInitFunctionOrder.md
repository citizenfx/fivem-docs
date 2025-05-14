---
title: startInitFunctionOrder
toc_hide: true
---

Triggered after [startInitFunction](../startInitFunction), with additional data.
May be triggered multiple times under the same init function type, but with a different `order` value.

Several [initFunctionInvoking](../initFunctionInvoking) and in turn [initFunctionInvoked](../initFunctionInvoked) events will be triggered after this.
After the init functions were invoked, **startInitFunctionOrder** may be triggered again with additional functions,
or [endInitFunction](../endInitFunction) will be triggered, finalizing the process.

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'startInitFunctionOrder',
    type: string,
    order: number,
    count: number,
}
```

- **eventName**: The event name.
- **type**: The type of init functions to be invoked.
- **order**: The order of the init functions to be invoked.
- **count**: The amount of init function to be invoked.
