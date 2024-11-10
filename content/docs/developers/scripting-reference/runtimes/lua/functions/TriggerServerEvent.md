---
title: TriggerServerEvent
---

## What is TriggerServerEvent?

`TriggerServerEvent` is a function in FiveM that allows you to trigger a server event from the client.

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

1. **Minimal Data Passing**: Sending data via events has msgpack serialization overhead when sending **AND** when recieving, you should try to keep your data types as simple and as small as possible so you don't send a bunch of unneeded data.

2. **Check your data**: ***Never, ever*** trust data from the client, you should always try to verify the data that the client sends. If at all possible you should try to do as much of your logic server-side so the client cannot manipulate it.

You can find common examples in the [security guidelines](/developers/server-security)



