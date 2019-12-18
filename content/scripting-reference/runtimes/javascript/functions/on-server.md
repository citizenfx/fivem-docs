---
title: On - server
---

Use `on` function when you want to listen from server only.\
This declares an event which gets triggered with [emit](/docs/scripting-reference/runtimes/javascript/functions/emit-server) from the server.

## Signature

```ts
function on(eventName: string, fn: Function) => void
```

### Required arguments

- **eventName**: The event name you want to expose.
- **fn**: The function to execute when the event get triggered.

## Examples

```ts
on(
  "foo:kickBar",
                   // We can add callback
  (barId: string, cb: Function => {
    DropPlayer(barId, "Foo doesn't want you anymore!");
    cb("Job is done!");
  }
);
```
