---
title: "Triggering Events"
---

### Triggering server events
To trigger a server event from inside a server side script, use the `TriggerEvent()` native.

#### Example
**Lua**
```lua
TriggerEvent("eventName", eventParam1, eventParam2)
```

**C#**
```csharp
TriggerEvent("eventName", eventParam1, eventParam2);
```

To trigger a server event from inside a **client** script, use the `TriggerServerEvent()` native.
#### Example
**Lua**
```lua
TriggerServerEvent("eventName", eventParam1, eventParam2)
```

**C#**
```csharp
TriggerServerEvent("eventName", eventParam1, eventParam2);
```

----------
### Triggering client events
To trigger a client event from within a client script, use the `TriggerEvent()` native, just like the first server side example above.

**Lua**
```lua
TriggerEvent("eventName", eventParam1, eventParam2)
```

**C#**
```csharp
TriggerEvent("eventName", eventParam1, eventParam2);
```

When triggering a client event from a server script however, use the `TriggerClientEvent()` native if you're using Lua. C# has a slightly different approach, explained below.

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