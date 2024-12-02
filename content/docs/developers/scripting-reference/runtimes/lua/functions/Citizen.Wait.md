---
title: Citizen.Wait
---

## What is Citizen.Wait?

`Citizen.Wait` is a function that allows you to pause the execution of the current thread for a specified amount of time. This can be useful for creating delays, scheduling tasks, or controlling the flow of your script.

Under the hood `Citizen.Wait` uses [Lua coroutines](https://www.lua.org/pil/9.html), this means that they **cannot** be called outside of the scope of a coroutine (like CreateThread).

## Syntax

```lua
Citizen.Wait(int milliseconds)
```

**Note:** You can also use [`Wait` alias](https://github.com/citizenfx/fivem/blob/b998343017fc89c6b27b7011ec5be789560c7313/data/shared/citizen/scripting/lua/scheduler.lua#L135) to simplify your code and save some typing.

### Required Arguments
- **milliseconds**: The amount of milliseconds to pause the current thread. This value determines how long the script will wait before continuing execution.

## Examples

### Basic Delay

```lua
CreateThread(function()
    print("Starting delay...")
    Wait(2000) -- Wait for 2000 milliseconds (2 seconds)
    print("2 seconds have passed!")
end)
```

In this example, the script prints a message, waits for 2 seconds, and then prints another message.

### Using Citizen.Wait in a Loop

```lua
CreateThread(function()
    while true do
        print("This message will print every 5 seconds.")
        Wait(5000) -- Wait for 5000 milliseconds (5 seconds)
    end
end)
```

In this example, the script will continuously print a message every 5 seconds.

{{% alert color="warning" %}}
Doing a `while true do` loop without a `Wait` will crash the clients game, please make sure your logic doesn't accidentally prevent `Wait` from being called.
{{% /alert %}}

```lua
CreateThread(function()
    -- define how long we want to sleep for, by default we want to run per-frame
    local sleep = 0
    while true do
		-- check if `E` was just pressed
        if IsJustControlPressed(0, 38) then
			-- we don't want to update for another second
            sleep = 1000
            if IsPedRunning(PlayerPedId()) then
                print("Player is running!")
            end
        end
        Wait(sleep) -- wait for however long `sleep` is defined as.
    end
end)
```

This allow you to change the `Wait` time to avoid having to always check when not necessary.

### Things to keep in mind

`Wait(0)` will pause the current [coroutine](https://en.wikipedia.org/wiki/Coroutine) until the next game tick.

`Wait(2000)` will pause the current [coroutine](https://en.wikipedia.org/wiki/Coroutine) for approximately 2000 ms (2 seconds).

{{% alert color="warning" %}}
The time in-between each tick is [non-deterministic](https://en.wikipedia.org/wiki/Deterministic_system), as it is frame bound. Players who have higher FPS will have game-ticks more often than those with lower FPS.
{{% /alert %}}

If a player is running at 60 fps they will have a tick happen once every 16.6ms.

If a player is running at 180 fps they will have a tick happen once every 5.5ms.


## Best Practices
1. **Something that needs to run per frame should use `Wait(0)`**: If something is required to run on every frame, you should always use `Wait(0)` using `Wait(5)`, `Wait(10)`, etc will cause ticks to be missed on higher frame rates.
2. **Avoid calling heavy natives per-tick**: Don't call expensive native calls like {{% native_link "START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE" %}} per-frame if it can be avoided.
3. **Cache frequently called natives**: Certain natives like {{% native_link "PLAYER_PED_ID" %}} and {{% native_link "GET_PLAYER_PED" %}} change infrequently, you can cache these in another `CreateThread` that runs less often to save some native calling overhead.
