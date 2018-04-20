---
title: "Non-Native Functions (Shared)"
---

Here is a list of some of the functions that you can use in **server** and **client** side lua scripts. Server or client specific functions have been left out of this list, those can be found on their own pages ([client]({{< ref "game-references/non-native-functions3.md" >}}) and [server]({{< ref "game-references/non-native-functions2.md" >}})). These functions are **not** documented in the [FiveM Native Reference List](https://runtime.fivem.net/doc/reference.html).


- **`Citizen.CreateThread(function)`**

This allows you to create a new thread. All code inside the `function() end` part will be executed asynchronously.

Example:
```lua
print("Hi, I get called first.")
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        Print("Hello world!")
    end
end)
print("Can you see me?")
```
The example above will first print "Hi, I get called first." to the console, then "Hello world!" once, then "Can you see me?" and then once every second "Hello world!" again. "Can you see me?" gets printed to the console even though the "while true" loop never ends, because that while true loop is inside a new thread, and won't affect the main thread of the script. It can still cause the game to freeze if you don't put a `Citizen.Wait()` function in a loop in a new thread, so don't forget to add that delay!

- **`Citizen.Wait(miliseconds)`**

This will "pause" the execution of the current thread for `miliseconds` amount of time.

- **`Citizen.SetTimeout(miliseconds, function)`**

This will execute the specified `function` after the specified amount of `miliseconds`.

Example:
```lua
Citizen.SetTimeout(5000, function()
    print("This will be sent after 5 seconds.")
end)
```
The above example will print "This will be sent after 5 seconds." to the console after waiting for 5 seconds, meanwhile all other code around this part won't be blocked having to wait for this function to finish.

- **`AddEventHandler(eventName, eventFunction)`**

Use this to listen for events, see the [events]({{< ref "events/listening-for-events.md" >}}) page for more info.

- **`RemoveEventHandler(eventHandlerData)`**

Removes the provided event handler. Example:
```lua
local eventA = AddEventHandler("someEvent", function()
    print("someEvent executed")
end)

TriggerEvent("someEvent")

RemoveEventHandler(eventA)
```

- **`TriggerEvent(eventName, ...)`**

Triggers the `eventName` event, and passes on the `...` arguments. 


