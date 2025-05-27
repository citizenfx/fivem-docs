---
title: startInitFunction
toc_hide: true
---

Triggered when init functions are about to be invoked.

[startInitFunctionOrder](../startInitFunctionOrder) will be triggered after this with additional info,
in turn triggering multiple [initFunctionInvoking](../initFunctionInvoking) and in turn [initFunctionInvoked](../initFunctionInvoked) triggers.
After the init functions were invoked, [startInitFunctionOrder](../startInitFunctionOrder) will be triggered again with additional functions,
or [endInitFunction](../endInitFunction) will be triggered, finalizing the process.

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'startInitFunction',
    type: string,
}
```

- **eventName**: The event name.
- **type**: The type of init functions to be invoked.
