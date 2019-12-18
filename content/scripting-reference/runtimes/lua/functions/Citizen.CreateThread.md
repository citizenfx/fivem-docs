---
title: Citizen.CreateThread
---

This allows you to create a new thread. All code inside the handler will be executed asynchronously.

Syntax
------

```lua
Citizen.CreateThread(function handler)
```

### Required arguments
- **handler**: The thread handler function.

Examples
--------

This example will first print `Hi, I get called first.` to the console, then `Hello world!` once,
then `Can you see me?` and then once every second `Hello world!` again. `Can you see me?` gets printed to the console
even though the `while true` loop never ends, because that `while true` loop is inside a new thread, and won't affect
the main thread of the script. It can still cause the game to freeze if you don't put a [Citizen.Wait()][wait] function
in a loop in a new thread, so don't forget to add that delay!

```lua
print("Hi, I get called first.")
Citizen.CreateThread(function()
  while true do
    print("Hello world!")
    Citizen.Wait(1000)
  end
end)
print("Can you see me?")
```

[wait]: /docs/scripting-reference/runtimes/lua/functions/Citizen.Wait
