---
title: EmitNet - client
---

Use `emitNet` function when you want to trigger an event from the client to the server.\
You need to declare the event on the server with [onNet](/docs/scripting-reference/runtimes/javascript/functions/onNet-server) first.

## Signature

```ts
function emitNet(eventName: string, ...args?: any ) => void
```

### Required argument

- **eventName**: The event name you want to trigger.

### Optional arguments

- **...args**: The arguments you want to pass.

## Examples

```ts
// No arg
emit("foo:killPatrickForMe");

// With args
emit("foo:killThisGuyForMe", 2);
```
