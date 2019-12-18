---
title: On - client
---

Use `on` function when you want to listen from client only.\
This declares an event which gets triggered with [emit](/docs/scripting-reference/runtimes/javascript/functions/emit-client) from the client.

## Signature

```ts
function on(eventName: string, fn: Function) => void
```

### Required arguments

- **eventName**: The event name you want to expose.
- **fn**: The function to execute when the event get triggered.

## Examples

```ts
// No arg
on("foo:imReady", () => {
    console.log("I'm ready to go!");
});

// With arg
on("foo:printMyDelivery", (delivery: string) => {
    console.log(`delivery received: ${delivery}`);
});

// Direct function call
on("foo:spawnMyCar", spawnCar);
```
