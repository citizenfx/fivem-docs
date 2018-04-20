---
title: "Listening for events"
---

To use existing events in your resources, you need to listen for them. This the same for client/server side scripts.

#### Example
**Lua**
```lua
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered.
end)
```

**C#**
```csharp
// In the constructor of a class that inherits BaseScript.
EventHandlers.Add("eventName", new Action<string, bool>(TargetFunction));


// Create a function to handle the event somewhere else in your code.
private void TargetFunction(string param1, bool param2)
{
    // Code that gets executed once the event is triggered goes here.
}
```

#### Note when using lua*
If you want your _client_ events to be available from the server, in other words, if you want to be able to trigger the client event from a server side script. Then you will need to register the event first.

To register a client event as a net event, place this in your client script.
```lua
RegisterNetEvent("eventName")

-- The event handler function follows after registering the event first.
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered.
end)
```

If you want your _server_ events to be available from the client, then you'll need to register the events as server events first.

To do this, place the following line for your event in your server script.
```lua
RegisterServerEvent("eventName")

-- The event handler function follows after registering the event first.
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered.
end)
```

_*You only need to register events when using lua. C# does not require you to do this manually._