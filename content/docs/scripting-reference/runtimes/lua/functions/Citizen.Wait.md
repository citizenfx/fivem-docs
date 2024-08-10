---
title: Citizen.Wait
---

## What is Citizen.Wait?

`Citizen.Wait` is a function in FiveM that allows you to pause the execution of the current script thread for a specified amount of time. This can be useful for creating delays, scheduling tasks, or controlling the flow of your script.

## Syntax

```lua
Citizen.Wait(int milliseconds)
```

**Note:** You can also use `Wait` [alias only](https://github.com/citizenfx/fivem/blob/b998343017fc89c6b27b7011ec5be789560c7313/data/shared/citizen/scripting/lua/scheduler.lua#L135).

### Required Arguments

- **milliseconds**: The amount of milliseconds to pause the current thread. This value determines how long the script will wait before continuing execution.

## Examples

### Basic Delay

```lua
Citizen.CreateThread(function()
    print("Starting delay...")
    Citizen.Wait(2000) -- Wait for 2000 milliseconds (2 seconds)
    print("2 seconds have passed!")
end)
```

In this example, the script prints a message, waits for 2 seconds, and then prints another message.

### Using Citizen.Wait in a Loop

```lua
Citizen.CreateThread(function()
    while true do
        print("This message will print every 5 seconds.")
        Citizen.Wait(5000) -- Wait for 5000 milliseconds (5 seconds)
    end
end)
```

In this example, the script will continuously print a message every 5 seconds. Note that not waiting at least `0ms` in a thread will crash the client game.

You can also use sleep methods to avoid having to use the same time. Here's an example:

```lua
local isVariableOn = false
Citizen.CreateThread(function()
    local sleep = 0
    while true do
        if isVariableOn then -- Check if press E
            sleep = 1000 -- set the timer to check every second
            if IsPedRunning(PlayerPedId()) then
                print("Player is running!")
            end
        else
            sleep = 0 -- reset the timer
        end
        Citizen.Wait(sleep) -- Wait for 5000 milliseconds (5 seconds)
    end
end)
```

This allow you to change the `Wait` time to avoid aving to always check when not necessary.

### Things to keep in mind

`Wait(0)` will pause the current `[coroutine](https://en.wikipedia.org/wiki/Coroutine)` until the next tick.

--
**Note** 
The time in-between each tick is not deterministic, as it is frame bound. Players who have higher FPS will run a tick more often than those with lower FPS.

If a player is running at 60 fps they will have a tick happen once every 16.6ms.
If a player is running at 180 fps they will have a tick happen once every 5.5ms.
--

`Wait(2000)` will pause the current `[coroutine](https://en.wikipedia.org/wiki/Coroutine)` for approximately 2000 ms (2 seconds).

## Best Practices

1. **Avoid short waits**: use different coroutines to cache values that don't need to be called every frame, and don't call expensive native calls per-frame, like [START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE](https://docs.fivem.net/natives/?_0x377906D8A31E5586) if it can be avoided, if something needs to be run per-frame run it with `Wait(0)`.
2. **Combine with Conditional Logic**: You can combine `Citizen.Wait` with conditional logic to create more sophisticated behaviors. Please refer to the sleep method example.

## Conclusion

`Citizen.Wait` is a simple function in FiveM scripting that allows you to control the timing and flow of your scripts. By pausing execution for a specified duration, you can create delays, schedule tasks, and manage the sequence of actions in your code. Whether you're creating simple delays or orchestrating complex task sequences, `Citizen.Wait` is an essential tool for effective script management.
