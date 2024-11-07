---
title: Understanding and Using Native Functions
weight: 1300
---

In FiveM, you have access to what are called "native functions" or simply "natives". These functions are provided by the game itself, using them will allow you to perform a wide variety of actions within the game environment. This guide will explain what natives are, where you can find them, and how to use them in your scripts.

## What Are Native Functions?
Native functions in FiveM are predefined functions that enable interaction with the game. They are essential for creating and managing game mechanics, player interactions, and various other functionalities within your server. Natives are used in both client-side and server-side. Some of them are created by Cfx like [DropPlayer](https://docs.fivem.net/natives/?_0xBA0613E1).


## Where Can You Find Native Functions?
FiveM provides comprehensive documentation for native functions. This documentation is essential for understanding what each native function does, how to use it, and what parameters it requires.

- **FiveM Natives**: All documented natives can be found on [our official website](https://docs.fivem.net/natives/).

- **Community Forums**: The [Cfx.re Forums](https://forum.cfx.re/) are another valuable resource. Here, you can find discussions, tutorials, and examples from other developers who share their experiences and solutions related to using native functions.

- **Native Docs Repo**: Users can contribute to the [repository](https://github.com/citizenfx/natives) by adding descriptions, names, and new native functions.

## Difference Between Client and Server-Side Natives

### Client Natives
Client natives are functions that run on the player's game client. These functions are primarily used to handle tasks related to the player's immediate environment, rendering, input handling, and interactions that need to occur on the client side. Examples include manipulating the player’s view, handling UI elements, and interacting with client-specific data.
<!-- Maybe found some better examples explanation -->

### Server-Side Natives
Server-side natives, on the other hand, run on the server. These functions manage game logic that needs to be controlled and validated by the server, such as player authentication and ensuring game state consistency. They are crucial for maintaining the integrity and security of the game.

Please note that some natives can be used on client and server. You can refer to `API set` setter in the official native documentation.

*client:* Only runs for client
*server:* Only runs for server
*shared:* Runs for client and server

<!-- ### RPC Natives
-- TO DO -->

## How to Use Native Functions
Using native functions in your FiveM resources involves calling the functions with the appropriate parameters. Let's go through the basic steps of using natives in both client-side and server-side resources.

### Client-Side Example
Client-side scripts are executed on the player's game client and are used to handle tasks such as rendering, player input, and more. Here’s a basic example of how to use a native function in a client-side script:

1. **Create a Client Script**: In your resource folder, create a new client script file, e.g., `main_cl.lua`.
2. **Register and Use a Native Function**: Use the native function `AddTextEntry` to add a custom text entry that can be displayed on the game UI.

```lua
-- main_cl.lua

-- Add a custom text entry
AddTextEntry('CUSTOM_ENTRY', 'Hello, FiveM!')

-- Display the custom text entry when a player presses a specific key
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- You can learn more about wait on https://docs.fivem.net/docs/scripting-reference/runtimes/lua/functions/Citizen.Wait
        if IsControlJustReleased(0, 38) then -- Native that check if control E is released
            BeginTextCommandDisplayHelp('CUSTOM_ENTRY') -- Display notification with another native
            EndTextCommandDisplayHelp(0, false, true, -1)
        end
    end
end)
```

### Server-Side Example
Server-side scripts run on the game server and are responsible for handling game logic, player data, and other backend tasks. Here’s an example of using a native function in a server-side script:

1. **Create a Server Script**: In your resource folder, create a new server script file, e.g., `main_sv.lua`.
2. **Register a Command and Use a Native Function**: Use the native function `GetPlayerName` to get the name of a player and print it to the server console.

```lua
-- main_sv.lua

-- Register a command to get the player name
RegisterCommand('getplayername', function(source, args, rawCommand) -- This is also a native to register a player/console command
    local playerName = GetPlayerName(source)
    print('Player Name: ' .. playerName)
end, false)
```

### Create Your First Resource
To learn how to create your first resource step-by-step, refer to the comprehensive guide in [this section](/docs/scripting-manual/introduction/creating-your-first-script). This guide will walk you through the process of setting up a new resource, writing your first script, and integrating it into your FiveM server.

### Commonly Used Native Functions
Here are some commonly used native functions and their descriptions:

- **RegisterCommand**: Register a player/console command.
  ```lua
  RegisterCommand(commandName, handler, restricted) -- shared
  ```

- **GetPlayerName**: Returns the name of a player.
  ```lua
  local playerName = GetPlayerName(playerId) -- server
  ```

- **EndTextCommandThefeedPostTicker**: Displays a notification on the screen (corner left).
  ```lua
  EndTextCommandThefeedPostTicker(false, true) -- client
  ```

## Conclusion
By following this guide, you should now have a basic understanding of what native functions are, where to find them, and how to use them in your FiveM scripts. Happy coding!