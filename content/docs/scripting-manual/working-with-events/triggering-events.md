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
There are currently two different ways to trigger a server event from inside a **client** script.
For smaller transactions the goto would be `TriggerServerEvent()`, while for larger transactions (which contain more data) `TriggerLatentServerEvent()` would be more optimal.
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

#### Triggering latent server events
Latent events should be used when needing to transfer a large amount of data from client -> server, as latent events **do not** block the entire network channel, unlike `TriggerServerEvent`. 

Latent events take an extra paramater 'bps' which stands for 'bytes per second', this defines how fast it should send data to the server.

**Lua**
```lua
TriggerLatentServerEvent("eventName", bps, eventParam1, eventParam2)
```

**C#**
```csharp
TriggerLatentServerEvent("eventName", bps, eventParam1, eventParam2);
```

**JS**
```js
TriggerLatentServerEvent("eventName", bps, eventParam1, eventParam2);
```

----------

### Triggering client events
The same can be said for client events, instead using `TriggerClientEvent()`, while for larger transactions (which contain more data) `TriggerLatentClientEvent()` would be more optimal.

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


#### Triggering latent client events
Latent events should be used when needing to transfer a large amount of data from server -> client, as latent events **do not** block the clients entire network channel, unlike `TriggerClientEvent`. This is important for timeout functionality, as sending a large amount of data blocks the network for the client, resulting them in timing out. 

Latent events take an extra paramater 'bps' which stands for 'bytes per second', this defines how fast it should send data to the server.

**Lua**
```lua
TriggerLatentClientEvent("eventName", targetPlayer, bps, eventParam1, eventParam2)
-- Use -1 for "targetPlayer" if you want the event to trigger on all connected clients.
```

**C#**
```csharp
// Method one. Trigger an event directly on a client source.
player.TriggerLatentEvent("eventName", eventParam1, eventParam2);

// Method two. Trigger an event for everyone on the server.
TriggerLatentClientEvent("eventName", eventParam1, eventParam2); // Note you do not need to specify a target of -1.

// Method three. Again, triggering an event directly on a client source (like method one),
// but using the TriggerLatentClientEvent native function instead.
TriggerLatentClientEvent(player, "eventName", eventParam1, eventParam2);
```

**JS**
```js
TriggerLatentClientEvent("eventName", targetPlayer, bps, eventParam1, eventParam2);
```