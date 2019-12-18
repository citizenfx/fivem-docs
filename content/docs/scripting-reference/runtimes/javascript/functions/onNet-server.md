---
title: onNet - server
---

Use `onNet` function when you want to listen from server **AND** from client.\
This declares an event which gets triggered with [emit](/docs/scripting-reference/runtimes/javascript/functions/emit-server) (from server) or [emitNet](/docs/scripting-reference/runtimes/javascript/functions/emitNet-client) (from client).

## Signature

```ts
function onNet(eventName: string, fn: Function) => void
```

### Required arguments

- **eventName**: The event name you want to expose.
- **fn**: The function to execute when the event get triggered.

## Examples

```ts
onNet(
  "myResource:doMassiveStuff",
  (heavyArg: Array<string>) => {
    heavyArg = heavyArg.map(val => val + ".");
    // Note that source is accessible when the even is called from a client.
    // Read more on emit on the dedicated emit page
    emit("myResource:returnMassiveStuff", source, heavyArg);
  }
);
```
