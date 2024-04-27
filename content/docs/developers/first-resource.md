---
title: How to create your first FiveM resource
weight: 1280
---

Getting started with scripting for FiveM might be a tad overwhelming, given the wide range of possibilities and the sparsely spread documentation. In this simple guide, we'll try to show you how to get started with a quick resource in Lua. 

This guide will show you how to make a resource to send a notification to player.


Prerequisites
-------

To complete this guide, you will need to have all the prerequisites. You can skip ahead to [create the folder](#create-the-folder) section if you have everything.

- [FiveM client](https://docs.fivem.net/docs/client-manual/installing-fivem/)
- [FiveM server](https://docs.fivem.net/docs/server-manual/setting-up-a-server/)
- [Visual Studio Code](https://code.visualstudio.com/download)

Create the folder
--------

Inside `resources` folder of your FiveM server, we are gonna create a folder our first resource. For this, we will create a folder called `first-resource`.

<img src="https://i.imgur.com/A7dMuhh.png" alt="pic" width="500">

So we should have a folder called `first-resource` in `resources` folder of you FiveM server.

Structure
-------------------------

To enhance the organization of our codebase, we're going to create distinct sections, each serving a specific purpose. We'll create three folders and one file to achieve this:
- `client`: This folder will contain all client-side code, responsible for handling interactions and rendering elements visible to the player.
- `server`: Here, we'll store all server-side logic, including data management, player authentication, and game mechanics that should be processed on the server.
- `shared`: The shared folder will house code that needs to be accessed by both the client and server sides. This could include common functions, constants, or data structures.
- `fxmanifest.lua`: This file is crucial for FiveM resource management. It defines metadata about the resource, such as its name, description, and dependencies.

## Resource manifest

The resource manifest, often referred to as `fxmanifest.lua`, serves as the backbone of your resource in FiveM. It provides essential instructions to the server regarding what components to initiate and how they are organized. This crucial file delineates the structure and composition of your resource, ensuring that the server can interpret and execute it correctly. It defines fundamental metadata about the resource, such as its name, description, version, and dependencies. You can learn more [here](https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest).

```lua
fx_version 'cerulean'
game 'gta5'

author 'John Doe <j.doe@example.com>'
description 'My first resource!'
version '1.0.0'

shared_script 'shared/main_sh.lua'
client_script 'client/main_cl.lua'
server_script 'server/main_sv.lua'
```

Copy this code and past it in the `fxmnifest.lua` file. It should look like this after:

<img src="https://i.imgur.com/DkBN0GS.png" alt="pic" width="500">

The manifest will read the following:
- Shared script in the `shared` folder
- Client script in the `client` folder
- Server script in the `server` folder

**Note:** You're free to name the folders/files whatever you wish. The names provided here are just common conventions.

## Server resource

In order to make our first resource, we will create the file `main_sv.lua` inside `server` folder. This should look like this:

<img src="https://i.imgur.com/Fi0pMit.png" alt="pic" width="500">

The server-side files, stored in the `server` folder, manage critical operations and data storage inaccessible to players, ensuring integrity and preventing exploitation through robust validation and processing mechanisms.

In this file, we will start by using [RegisterCommand](https://docs.fivem.net/natives/?_0x5FA79B0F) native. You can learn more about natives [here](/#natives). You can copy the following:
```lua
-- Registering a command called 'selfnotif'
RegisterCommand('selfnotif', function(source)
    -- Check if the code is executed by a player
    if not (source > 0) then 
        return 
    end -- 1
    
    -- Define a local variable called 'value' and assign it the string 'Hello world'
    local value = 'Hello world' -- 2
    
    -- Print the value of the 'value' variable to the server console
    print(value) -- 3
    
    -- Trigger a client event named 'cfx:client:firstEvent' and pass the 'value' variable as data
    TriggerClientEvent('cfx:client:firstEvent', source, value) -- 4
end, false)
```

Let's break this in part:
#### 1. Checking if Code is Executed by a Player:
```lua
if not (source > 0) then return end
```
This line ensures that the code is executed by a player rather than the server console. If the `source` is not greater than 0 (indicating it's not a player), the function returns early.

#### 2. Defining a Local Variable:
```lua
local value = 'Hello world'
```
This line defines a local variable named `value` and assigns it the string 'Hello world'. In Lua, variables need to be localized using the `local` keyword. It's a best practice that helps in managing the scope, efficiency, encapsulation, and prevention of name clashes within the codebase. By defining a variable as `local`, it is restricted to the block where it is declared and its nested blocks. This ensures that the variable's value is contained within a specific context and cannot be inadvertently modified from outside that context.

In this example, the `local value` will be only available in the `selfnotif` register command.

#### 3. Printing to the Server Console:
```lua
print(value)
```
This line prints the `value` of the value variable to the server console using the `print()` function. The string 'Hello world' will be displayed in the server console when this command is executed by a player.

#### 4. Triggering a Client Event:
```lua
TriggerClientEvent('cfx:client:firstEvent', source, value)
```
This line triggers a client event named 'cfx:client:firstEvent' and passes the `value` variable as data to clients. Client events are used to send information between the server and clients. In this case, the 'firstEvent' event is triggered for the client associated with the `source` (player) and sends the `value` variable as data.

For further details on the usage of events in FiveM, you can refer to [here](https://docs.fivem.net/docs/scripting-reference/events/).

#### Preview
After following every steps of the server section. The code inside `main_sv` should look like this.

<img src="https://i.imgur.com/wcCfS4l.png" alt="pic" width="500">

## Client resource

To continue the guide, we will create another file `main_cl.lua` inside `client` folder. This should look like this:

<img src="https://i.imgur.com/p6CzdXh.png" alt="pic" width="500">

The client-side files, located in the `client` folder, control interactions visible to players and handle rendering, while also enforcing security measures and processing that cannot be tampered with by players.

In this file, we will use an [event](https://docs.fivem.net/docs/scripting-reference/events/). You can copy the following:
```lua
RegisterServerEvent('cfx:client:firstEvent', function(information)
	if not information then return end -- 1
  TriggerEvent('chat:addMessage', {
    template = '<div class="chat-message"><b>SYSTEM</b><br>{0} has been sent to you</div>',
    args = {information}
  }) -- 2
end)
```

Let's break this in part:
#### 1. Checking if param is valid
```lua
if not information then return end
```
This line serves as a crucial validation step, ensuring that the code receives a valid parameter sent by the server. Detecting and handling invalid parameters can be instrumental in identifying and thwarting cheating attempts. For further insights on advanced techniques, refer to the [advanced part](/content/docs/developers/first-resource-extra).

#### 2. Trigger the chat event
```lua
TriggerEvent('chat:addMessage', {
  template = '<div class="chat-message"><b>SYSTEM</b><br>{0} has been sent to you</div>',
  args = {information}
})
```
This event triggers the 'chat:addMessage' event on the client script of the `chat` resource. The message sent includes the value of the `information` parameter returned by the event, along with the string 'has been sent to you.'.

#### Preview
After following every steps of the server section. The code inside `main_cl` should look like this.

<img src="https://i.imgur.com/sgSdjLc.png" alt="pic" width="500">

## Start the resource

Now that we did everything in this guide, we need to start your first script! You can go into your `server.cfg` that you did [here](https://docs.fivem.net/docs/server-manual/setting-up-a-server-vanilla/#servercfg) and insert the following:

```lua
ensure first-resource
```

at the bottom of the resources started. It should look this this:

<img src="https://i.imgur.com/swPWB7x.png" alt="pic" width="500">

### Execution Overview:

#### 1. **User Input:**
   - Login in the server and run the command `selfnotif` in the client chat (can be open by default with `t` or in F8 console log).

#### 2. **Server-Side Execution:**
   - The `RegisterCommand` native is triggered.
   - It verifies if the source is a player.
   - Assigns the string "Hello World" to the local variable `value`.
   - Prints the value of `value` to the server console.
   - Sends the value of `value` to the client using the event `'cfx:client:firstEvent'`.

#### 3. **Client-Side Execution:**
   - The client script receives the `'cfx:client:firstEvent'` event.
   - It checks the validity of the first parameter.
   - Sends a client event on `chat` resource to execute the chat message with the parameter received.

### Result:
- You will see "Hello World has been sent to you" in the client chat.
  
  <img src="https://i.imgur.com/QfBlU3a.png" alt="pic" width="200">
- "Hello World" is displayed in the server console.
  
  <img src="https://i.imgur.com/aPsq1F2.png" alt="pic" width="200">

### Workflow:
- **User Action:** You invoke the command in the chat.
- **Server Processing:** The server executes the command, processes the logic, and communicates with the client.
- **Client Interaction:** You receive the information and handles the display accordingly.

## Conclusion:
Congratulations! By following this process, you've successfully created your first FiveM resource, implementing basic server-client communication via events and commands.
