---
title: "Client events"
---

### Listen for events

**Lua**
```lua
AddEventHandler("eventName", function(param1, param2)
    -- Code that gets executed once the event is triggered goes here.
end)
```

**C#**
```csharp
// In the constructor of a class that inherits BaseScript.
EventHandlers.Add("eventName", new Action<string, bool>(TargetFunction));



// Somewhere else in your code.
private void TargetFunction(string param1, bool param2)
{
    // Code that gets executed once the event is triggered goes here.
}
```

---

### Trigger client events
**_Triggering events from the server, on a specific client._**

**Lua**
```lua
-- Use -1 as 'targetPlayer' to trigger the event on every client.
TriggerClientEvent("eventName", targetPlayer, eventParameters)
```

**C#**
```csharp
// Method 1 -- Trigger an event for a specific player.
player.TriggerEvent("eventName", eventParameters);


// Method 2 -- Trigger an event for all connected players.
TriggerClientEvent("eventName", eventParameters);
```

**_Triggering events from inside a client script._**

**Lua**
```lua
TriggerEvent("eventName", eventParameters)
```

**C#**
```csharp
TriggerEvent("eventName", eventParameters);
```

----

Default events
--------------


#### `onClientResourceStart(string resourceName)`
**Parameters**

- `resourceName` - A string containing the name of the resource that was started.

#### `onClientResourceStop(string resourceName)`
**Parameters**

- `resourceName` - A string containing the name of the resource that was stopped.

----

spawnmanager events (resource events)
-------------------------------------

#### `playerSpawned(object spawnInfo)`
**Parameters**

- `spawnInfo` - An object containing the following information:
  - `(float) x` - The x coordinate of where the player spawned to.
  - `(float) y` - The y coordinate of where the player spawned to.
  - `(float) z` - The z coordinate of where the player spawned to.
  - `(float) heading` - The heading that the player is facing when spawned.
  - `(int) idx` - The spawnpoint index.
  - `(Hash) model` - The ped model hash the player spawned as.

**Example**
```
{
    "z":111.5291,
    "y":197.7201,
    "x":466.8401,
    "heading":291.71,
    "idx":6,
    "model":1631478380
}
```

----

mapmanager events (resource events)
-----------------------------------

#### `onClientMapStart(string resourceName)`
**Parameters**

- `resourceName` - The name of the resource/map that started.

#### `onClientGameTypeStart(string resourceName)`
**Parameters**

- `resourceName` - The name of the resource/gametype that started.

#### `onClientMapStop(string resourceName)`
**Parameters**

- `resourceName` - The name of the resource/map that stopped.

#### `onClientGameTypeStop(string resourceName)`
**Parameters**

- `resourceName` - The name of the resource/gametype that stopped.

#### `getMapDirectives(function add)`
**Parameters**

- `add` - A function used to add things like spawnpoints and vehicle generators.


---

baseevents (resource events)
----------------------------

#### `onPlayerDied(player deadPlayer, string deathReason)`
**Parameters**

- `deadPlayer` - The client ID of the player who died.
- `deathReason` - A string containing the reason why the player died.


#### `onPlayerKilled(player deadPlayer, player killer, string deathReason)`
**Parameters**

- `deadPlayer` - The client ID of the player who died.
- `killer` - The client ID of the player who killed the `deadPlayer` player.
- `deathReason` - A string containing the reason why the player died.


---

sessionmanager events (resource events)
---------------------------------------
#### `playerActivated()`
#### `sessionInitialized()`


---

chat events (resource events)
-----------------------------
#### `chatMessage(string author, array color, string text)`
Color syntax: `{255, 255, 255}` (`{r, g, b}`).

#### `chat:addMessage(object message)`
Message object structure:
```
message = {
  color = color,
  multiline = true,
  args = {author, otherArgs...}
}
```

#### `chat:addTemplate()`
tbd

#### `chat:addSuggestion()`
tbd

#### `chat:removeSuggestion()`
tbd

#### `chat:clear()`
Clears the chat messages/history and the sent messages history buffer.


