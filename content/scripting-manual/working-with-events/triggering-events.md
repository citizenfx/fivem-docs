---
title: Triggering events
weight: 432
---

### Triggering local events
To trigger a server event from inside a server-side script, or trigger a client event from inside a client-side script, use the `TriggerEvent()` (or for JS, `emit()`) function.

#### Example
**Lua**
```lua
TriggerEvent("eventName", eventParam1, eventParam2)
```

**C#**
```csharp
TriggerEvent("eventName", eventParam1, eventParam2);
```

**JS**
```js
emit("eventName", eventParam1, eventParam2);
```

### Triggering server events
To trigger a server event from inside a **client** script, use the `TriggerServerEvent()` (or for JS, `emitNet()`) function.
#### Example
**Lua**
```lua
TriggerServerEvent("eventName", eventParam1, eventParam2)
```

**C#**
```csharp
TriggerServerEvent("eventName", eventParam1, eventParam2);
```

**JS**
```js
emitNet("eventName", eventParam1, eventParam2);
```

----------

### Triggering client events
To trigger a client event from a server-side script however, use the `TriggerClientEvent()` native if you're using Lua, the C# method below, or the JS method.

**Lua**
```lua
TriggerClientEvent("eventName", targetPlayer, eventParam1, eventParam2)
-- Use -1 for "targetPlayer" if you want the event to trigger on all connected clients.
```

**C#**
```csharp
// Method one. Trigger an event directly on a client source.
player.TriggerEvent("eventName", eventParam1, eventParam2);

// Method two. Trigger an event for everyone on the server.
TriggerClientEvent("eventName", eventParam1, eventParam2); // Note you do not need to specify a target of -1.

// Method three. Again, triggering an event directly on a client source (like method one),
// but using the TriggerClientEvent native function instead.
TriggerClientEvent(player, "eventName", eventParam1, eventParam2);
```

**JS**
```js
emitNet("eventName", targetPlayer, eventParam1, eventParam2);
```
