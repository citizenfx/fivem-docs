---
title: Listening for events
weight: 431
---

To use existing events in your resources, you need to listen for them. This is the same for client/server side scripts.

In Lua/JS, the `source` variable (global) will contain the player ID that triggered the event. You should most likely save it in a local variable if you're going to use it after the event returns.

In C#, you use the `[FromSource]` attribute, as seen in the example below.

#### Example
**Lua**
```lua
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered.
end)
```

**C#**
```csharp
// Usually in the constructor of a class that inherits BaseScript, but can be done anywhere in a BaseScript.
EventHandlers["eventName"] += new Action<string, bool>(TargetFunction);


// Create a function to handle the event somewhere else in your code, or use a lambda.
private void TargetFunction(string param1, bool param2)
{
    // Code that gets executed once the event is triggered goes here.
}
```

Using **source** (on the server) works as follows:

```csharp
// constructor code
EventHandlers["netEventName"] += new Action<Player, string, bool>(TargetFunction);


// Create a function to handle the event somewhere else in your code, or use a lambda.
private void TargetFunction([FromSource] Player source, string param1, bool param2)
{
    // Code that gets executed once the event is triggered goes here.
    // The variable 'source' contains a reference to the player that triggered the event.
}
```

**JS**
```js
on('eventName', (eventParam1, eventParam2) => {
    // Code that gets executed once the event is triggered goes here.
});
```

#### Note when using Lua/JS
If you want your events to be available 'over the network' (that is, trigger a client event from a server-side script, or trigger a server event from a client-side script), you'll need to register the event first.

To register an event as a network event, place this in your client/server script:

**Lua**
```lua
RegisterNetEvent("eventName")

-- The event handler function follows after registering the event first.
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered.
end)
```

**JS**

_Note: onNet events can be executed both locally as well as remotely_
```js
onNet('eventName', (eventParam1, eventParam2) => {
    // Code here will be executed once the event is triggered.
})
```

_You only need to register events when using Lua or JS -- C# does not require you to do this manually, though you might want to protect your server events with own code._
