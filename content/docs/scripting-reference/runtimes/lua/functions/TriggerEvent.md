---
title: TriggerEvent
---

## What is TriggerEvent?

`TriggerEvent` is a function in FiveM that allows you to trigger a specified event, optionally passing along additional data. This function is integral for communication within the client-client or server-server scripts, enabling different parts of your resources to interact with each other seamlessly.

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

## Security
It's generally better to use `AddEventHandler` because it ensures that the event triggers are only accepted if they originate from the same context as the event listener (either client-to-client or server-to-server). This helps maintain a clear separation between client-side and server-side logic, reducing the risk of unexpected behavior and potential security issues. 

### Fake events

You can _try_ to catch some cheaters with fake events. It's a alternative way to catch potential cheaters which correlate server-side events. For example, a cheater could want to trigger `server:giveMoneyToPlayer` event to try spawning themselves money. 

First, we will create a table that will contains all the events to "bait" the cheater. 

```lua
local eventsBait = {
    'server:giveMoneyToPlayer',
    'server:revivePlayer',
    'server:setPlayerAdmin'
}
```

Note you can add/remove any event you wish to create to "bait" the player. Be careful, the events name cannot be used in any script to avoid confusion. When selecting names, try to get original names that will make the cheater want to try it. Afer this, we will loop the table to create the events. Here's how:

```lua
for _, eventName in ipairs(eventsBait) do
    RegisterServerEvent(eventName)
    AddEventHandler(eventName, function()
        local playerId = source  -- Get the player ID of the source of the event
        local reason = "You have been dropped for triggering a prohibited event"
        print("Dropping player " .. playerId .. " for triggering event: " .. eventName)
        DropPlayer(playerId, reason) -- dropping player
    end)
end
```

In this example, we created 3 new events that will drop the player (disconnect) and send a message to server console that a prohibited event has been trigger. This is a good place to add a log and ban player.

## Best Practices

1. **Consistent Naming**: Use clear and consistent naming conventions for your events to avoid confusion and make your code more readable.

2. **Minimal Data Passing**: Only pass the necessary data with your events to keep them lightweight and efficient.

3. **Error Handling**: Ensure that your event handlers include error handling to manage any unexpected issues that may arise when processing events.

4. **Documentation**: Document your custom events and their expected parameters to make your code easier to understand and maintain.

## Conclusion

`TriggerEvent` is a powerful tool in FiveM scripting that helps different parts of your script communicate with each other. By using events and passing data, you can create interactive and responsive gameplay experiences. Whether you're updating player scores, handling user input, or managing game mechanics, `TriggerEvent` helps keep your code organized and efficient. Use it to make your FiveM scripts more modular and responsive.