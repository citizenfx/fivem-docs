---
title: Emit - client
---

Use `emit` function when you want to trigger an event on the same client.\
You need to declare the event on the client with [on](/docs/scripting-reference/runtimes/javascript/functions/on-client) or [onNet](/docs/scripting-reference/runtimes/javascript/functions/onNet-client) first.

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
emit("foo:gimmeAFrenchBread");

// With args
emit("foo:gimmeSomeFrenchBread", amount);
```
