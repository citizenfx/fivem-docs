---
title: EmitNet - server
---

Use `emitNet` function when you want to trigger an event from the server to a client or to all clients.\
You need to declare the event on the client with [onNet](/docs/scripting-reference/runtimes/javascript/functions/onNet-client) first.

## Signature

```ts
function emitNet(eventName: string, serverId: string | number, ...args?: any ) => void
```

### Required argument

- **eventName**: The event name you want to trigger.
- **serverId**: The player to send to.\
Note: set **serverId** to `-1` will send the event to all clients.

### Optional arguments

- **...args**: The arguments you want to pass.

## Examples

```ts
// No arg
emit("foo:pokedYou", 2);

// With args
emit("foo:pokedYouAndGiveMessages", 2, ["Javascript is cool!", "But FiveM is better!"]);

// To all clients
emit("foo:pokedYouAll", -1);
```
