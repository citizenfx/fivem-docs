---
title: TriggerEvent
---

## What is TriggerEvent?

`TriggerEvent` is a function in FiveM that allows you to trigger a specified event, optionally passing along additional data. This function is mainly used for communicating between resources.

## Syntax

```lua
TriggerEvent(string eventName[, ...])
```

### Required Arguments

- `eventName`: A string representing the name of the event to trigger. This is the identifier for the event you want to invoke.

### Optional Arguments

- `...`: Any additional data that should be passed along with the event. This can be one or more variables or values that the event handler will process.

## How to Use TriggerEvent

Using `TriggerEvent` involves specifying the event name and, _optionally_, any data you want to pass to the event handler. This function is used to invoke custom events that you have defined elsewhere in your script.

## Examples

### Basic Usage

Here's a simple example demonstrating how to trigger an event:

```lua
TriggerEvent('myCustomEvent')
```

In this example, the event named 'myCustomEvent' is triggered. You would have an event handler somewhere in your script listening for this event. Note that you will only be able to trigger that even in the same section you are (wheter is client or server). That means if `myCustomEvent` is trigger from client, then the even handler needs to be on the client.

### Triggering an Event with Data

You can also pass additional data when triggering an event:

```lua
local playerName = 'JohnDoe'
local playerScore = 100

TriggerEvent('myCustomEvent', playerName, playerScore)
```

In this example, the event 'myCustomEvent' is triggered with two pieces of data: the player's name and score. The event handler for 'myCustomEvent' would process this data accordingly.

### Handling the Triggered Event

To handle the event triggered by `TriggerEvent`, you need to define an event listener. Here's an example of how you can set up an event listener for the 'myCustomEvent' event:

```lua
AddEventHandler('myCustomEvent', function(name, score)
    print(string.format('Player %s has a new score of %d', name, score))
end)
```

In this example, when 'myCustomEvent' is triggered, the provided function will run, printing out the player's name and new score. This code can be tested on client or server.

### Directly Triggering a Function

You can also trigger a function directly using `TriggerEvent`. This can be useful for organizing your code and creating modular, reusable functions. Here's an example:

```lua
local function updatePlayerScore(name, score)
    print(string.format('Player %s has a new score of %d', name, score))
end

AddEventHandler('myCustomEvent', updatePlayerScore)

-- Trigger the command "event" to start the function
RegisterCommand("event", function(source, args, rawCommand)
    TriggerEvent('myCustomEvent', 'JohnDoe', 100)
end, false)
```

In this example, the `updatePlayerScore` function is defined and used directly as the event handler. This approach allows for cleaner code and easier maintenance.

## Best Practices

1. **Consistent Naming**: Use clear and consistent naming conventions for your events to avoid confusion and make your code more readable.

2. **Minimal Data Passing**: Only pass the necessary data with your events to keep them lightweight and efficient.

3. **Error Handling**: Ensure that your event handlers include error handling to manage any unexpected issues that may arise when processing events.

4. **Documentation**: Document your custom events and their expected parameters to make your code easier to understand and maintain.

