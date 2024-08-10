---
title: Event Cancelation
weight: 433
---

### Canceling Events
To cancel an event, use the {{% native_link "CANCEL_EVENT" %}} native from within an event handler. This does not stop other event handlers from running.

#### Example
**Lua**
```lua
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Cancelling this event!
    CancelEvent()
end)
```

**C#**
```csharp
EventHandlers["eventName"] += new Action<string, bool>(TargetFunction);

private void TargetFunction(string param1, bool param2)
{
    // Canceling this event!
    CancelEvent();
}
```

**JS**
```js
on('eventName', (eventParam1, eventParam2) => {
    // Canceling this event!
    CancelEvent();
});
```

### Checking for event cancelation
To check if the last event you triggered was canceled, use the {{% native_link "WAS_EVENT_CANCELED" %}} native. This only works for **local** events.

#### Example
**Lua**
```lua
TriggerEvent("eventName", eventParam1, eventParam2)

if WasEventCanceled() then
    -- Code that runs if the event was canceled.
end
```

In Lua, the `TriggerEvent()` function returns true if the event was canceled, allowing you to also use the following syntax:

**Lua**
```lua
if TriggerEvent("eventName", eventParam1, eventParam2) then
    -- Code that runs if the event was canceled.
end
```

**C#**
```csharp
TriggerEvent("eventName", eventParam1, eventParam2);

if (WasEventCanceled())
{
    // Code that runs if the event was canceled. 
}
```

**JS**
```js
emit("eventName", eventParam1, eventParam2);

if (WasEventCanceled()) {
    // Code that runs if the event was canceled. 
}
```