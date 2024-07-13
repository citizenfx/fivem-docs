---
title: TriggerServerEvent
---

## What is TriggerServerEvent?

`TriggerServerEvent` is a function in FiveM that allows you to trigger a specified event, optionally passing along additional data. This function is integral for communication within the client-server scripts, enabling different parts of your resources to interact with each other seamlessly.

Please note this is similar to `TriggerEvent`, but allow you to pass from client to server.

## Syntax

```lua
TriggerServerEvent(string eventName[, ...])
```

### Required Arguments

- `eventName`: A string representing the name of the event to trigger. This is the identifier for the event you want to invoke.

### Optional Arguments

- `...`: Any additional data that should be passed along with the event. This can be one or more variables or values that the event handler will process.

## How to Use TriggerServerEvent

Using `TriggerServerEvent` involves specifying the event name and, _optionally_, any data you want to pass to the event handler. This function is used to invoke custom events that you have defined in any client script to pass to server.

## Examples

### Basic Usage

Here's a simple example demonstrating how to trigger an server event:

```lua
TriggerServerEvent('myCustomServerEvent')
```

In this example, the event named 'myCustomServerEvent' is triggered. You would have an register net event somewhere in your server script listening for this event. Note that you will only be able to trigger to server of the script.

### Triggering an Event with Data

You can also pass additional data when triggering an event:

```lua
local playerName = 'JohnDoe'
local playerScore = 100

TriggerServerEvent('myCustomServerEvent', playerName, playerScore)
```

In this example, the event 'myCustomServerEvent' is triggered with two pieces of data: the player's name and score. The event handler for 'myCustomServerEvent' would process this data accordingly.

### Handling the Triggered Event

To handle the event triggered by `TriggerServerEvent`, you need to define an register net event listener. Here's an example of how you can set up an event listener for the 'myCustomServerEvent' event:

(Recommanded)
```lua
-- In any server file of the script
RegisterNetEvent('myCustomServerEvent', function(name, score)
    print(string.format('Player %s has a new score of %d', name, score))
end)

```
You can also make:
```lua
RegisterNetEvent('myCustomServerEvent')
AddEventHandler('myCustomServerEvent', function(name, score)
    print(string.format('Player %s has a new score of %d', name, score))
end)
```

In this example, when 'myCustomServerEvent' is triggered from client to server, the provided function will run, printing out the player's name and new score on the server console.

Please note it's generally better to use `RegisterNetEvent` because it register and add the event handler at the same time.

### Directly Triggering a Function

You can also trigger a function directly using `TriggerServerEvent`. This can be useful for organizing your code and creating modular, reusable functions. Here's an example:

```lua
local function updatePlayerScore(name, score)
    -- Will display on server console
    print(string.format('Player %s has a new score of %d', name, score))
end

RegisterNetEvent('myCustomServerEvent', updatePlayerScore)

-- Trigger the command "event" to start the function on client
RegisterCommand("event", function(source, args, rawCommand)
    TriggerServerEvent('myCustomServerEvent', 'JohnDoe', 100)
end, false)
```

In this example, the `updatePlayerScore` function is defined and used directly as the event handler. This approach allows for cleaner code and easier maintenance.

## Best Practices

1. **Consistent Naming**: Use clear and consistent naming conventions for your events to avoid confusion and make your code more readable.

2. **Minimal Data Passing**: Only pass the necessary data with your events to keep them lightweight and efficient.

3. **Error Handling**: Ensure that your event handlers include error handling to manage any unexpected issues that may arise when processing events.

4. **Documentation**: Document your custom events and their expected parameters to make your code easier to understand and maintain.

## Conclusion

`TriggerServerEvent` is a powerful tool in FiveM scripting that helps different parts of your script communicate from client to server. By using events and passing data, you can create whether you're updating player scores, handling database, or managing game informations, `TriggerServerEvent` helps keep your code organized and efficient. Use it to make your FiveM scripts more modular and responsive.
