---
title: Emit - server
---

Use `emit` function when you want to trigger an event from the server to the server.\
You need to declare the event on the server with [on](/docs/scripting-reference/runtimes/javascript/functions/on-server) or [onNet](/docs/scripting-reference/runtimes/javascript/functions/onNet-server) first.

## Signature

```ts
function emit(eventName: string, ...args?: any ) => void
```

### Required argument

- **eventName**: The event name you want to trigger.

### Optional arguments

- **...args**: The arguments you want to pass.

## Examples

```ts
// No arg
emit("foo:playerIsHere");

// With args
emit("foo:thisPlayerIsHere", playerId, playerLicense);
```
