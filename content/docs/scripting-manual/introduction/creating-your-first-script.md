---
title: Creating your first script in Lua
weight: 412
---

Getting started with scripting for FiveM might be a tad overwhelming, given the wide range of possibilities and the sparsely spread documentation. In this quick and simple guide, we'll try to show you how to get started with a quick resource in Lua.

{{% alert theme="info" %}}
If you're not familiar with Lua, you can refer to the [Lua 5.4 reference manual](https://www.lua.org/manual/5.4/). The scripting runtime supports both Lua 5.4 and 5.3. For older versions, visit the [manual archive](https://www.lua.org/manual/).
{{% /alert %}}

## Resources
A resource is, simply said, a collection of files that can be individually started, stopped and restarted. Your server-data folder (assuming you already installed a server) should have a `resources` folder already, with a few resources in them already.

If you're working on your own resources, you'll probably want to make a `resources/[local]` directory - this one will be ignored by Git when updating the server-data root. In there, we'll make a `resources/[local]/mymode` folder, since we're making, well, a gametype using the `mapmanager` system.

That means you'll need to have a folder like this by now, assuming a Windows development system: `C:\your\path\to\cfx-server-data\resources\[local]\mymode`. We'll call this folder `mymode` from now on.

### Manifest files
A resource folder (you know, this `mymode` you made above) will need a manifest to be detected by FiveM. Since this is a game type, it'll need some extra information as well to teach `mapmanager` about the fact that this is a game type.

Make a file called `fxmanifest.lua` (this is _always_ Lua, even if you'll be writing scripts in C#/JS later on) in your `mymode` folder. In it, put the following text using your favorite text editor:

```lua
fx_version '{{%  rmv2  %}}'
game 'gta5'

author 'An awesome dude'
description 'An awesome, but short, description'
version '1.0.0'

resource_type 'gametype' { name = 'My awesome game type!' }

client_script 'mymode_client.lua'
```

Any new resource you make will probably want the latest game features. This is what the `fx_version` is for. You can read up on it elsewhere on this documentation site, if you ever feel the need to know more.
To specify if this resource is for gta5, rdr3, or `common`, you should use the `game` variable.

The `resource_type`, on the other hand, tells `mapmanager` that this, in fact, is a game type, and that it's called **"My awesome game type!"**. If you're just making a 'standalone' add-on resource, you probably don't want to include a `resource_type` line.

Finally, the `client_script` indicates to the scripting runtime that the client should load a script, named `mymode_client.lua`. If this were a JS script, it'd say `mymode_client.js`, or if it were C#, it'd probably be `MyModeClient.net.dll`, but for now we're teaching Lua so just forget that.

Finally, we should make a file called `mymode_client.lua` in the `mymode` resource folder thing.

To learn more about resource manifest files, take a look at the [resource manifest reference][manifest-reference].

### Writing code

In this file, let's put the following content:

```lua
local spawnPos = vector3(686.245, 577.950, 130.461)

AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_m_skater_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { 'Welcome to the party!~' }
            })
        end)
    end)

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)
```

This is a tough one, especially if you're not used to the concept of first-class functions. You could also write it differently, using global/local functions - but that's just a bit odd.

Let's go through this bit by bit, with an annotated version.

```lua
-- define a local variable called `spawnPos` with a coordinate somewhere on the map
-- Lua in FiveM (through CfxLua) supports first-class vectors, which in this case can be accessed using .x, .y and .z.
local spawnPos = vector3(686.245, 577.950, 130.461)

-- add an event handler for the (local) event called 'onClientGameTypeStart'.
-- it takes no arguments in this case (in Lua you can omit arguments), since our resource is a game type and you can only run one at once,
-- that means this will basically run when we start ourselves on the client. nice!
AddEventHandler('onClientGameTypeStart', function()
    -- set an automatic spawn callback for the spawn manager.
    -- normally, this works using hardcoded spawn points, but since this is a scripting tutorial, we'll do it this way.
    --
    -- the spawn manager will call this when the player is dead, or when forceRespawn is called.
    exports.spawnmanager:setAutoSpawnCallback(function()
        -- spawnmanager has said we should spawn, let's spawn!
        exports.spawnmanager:spawnPlayer({
            -- this argument is basically a table containing the spawn location...
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            -- ... and the model to spawn as.
            model = 'a_m_m_skater_01'
        }, function()
            -- a callback to be called once the player is spawned in and the game is visible
            -- in this case, we just send a message to the local chat box.
            TriggerEvent('chat:addMessage', {
                args = { 'Welcome to the party!~' }
            })
        end)
    end)

    -- enable auto-spawn
    exports.spawnmanager:setAutoSpawn(true)

    -- and force respawn when the game type starts
    exports.spawnmanager:forceRespawn()
end)
```

A quick mention of the difference between client and server scripts: most of what you'll do in FiveM will be done using client scripts, since in current versions there's no interaction with _game_ functionality in server scripts. Server scripts should be used to have scripted actions occur _across_ clients (using client/server events), and to provide a 'source of trust' for various actions, such as storing/loading things in a persistent database.

Since spawning a player is pretty much entirely game interaction, this happens on the client side. Every player that's joined will have a _local_ instance of each client script running on their PC, with no shared variables or context between them.

## Running this

You're probably hoping to be able to run this little example - well, hopefully you already have a running FXServer instance - if not, follow the guide for that.

Once you've started FXServer, execute the `refresh` command in the console. This'll reread every single `fxmanifest.lua` file for every resource you have installed, since you probably just started the server this isn't _really_ needed but if you had the server running already this is just A Good Idea™ to do.

Finally, execute `start mymode` in the console, and connect to your server using the FiveM client's handy `localhost` button in developer mode (or just enter `localhost` on the direct connect tab, or if you used the default port click [this useful link](fivem://connect/localhost:30120) on the PC you have FiveM installed on).

Once the game loads, you should see yourself spawning somewhere - hopefully on a big stage!

Keep the game running (and maybe set it to borderless or windowed mode in the game options) and Alt-Tab out back into your code editor - we have more work to do!

### Restarting resources

It's silly to close your game and server and restart them both to iterate on your resource. Of course, you can _restart_ your resource as well.

Let's try some different spawn point.

Replace the `spawnPos` line (the first one) in `mymode/mymode_client.lua` with the following:

```lua
local spawnPos = vector3(-275.522, 6635.835, 7.425)
```

Then, in your server console, execute the magical command `restart mymode`. You should (again) see 'Welcome to the party!~' mentioned in your chat box, and end up on a pier instead of the stage.

## Expanding on this

You'll probably want to do more. For this, you're going to have to learn how to _call natives_, which has nothing to do with indigenous people and actually are a R* label for 'game-defined script functions'. There's a lot of intricacies involved in calling natives properly - for a full reference, see the special section for this - but we'll start simple for now.

In a stupid way of 'this trope again', we'll make a command that'll spawn a car. Locally. Because nobody cares about the server when they're starting out.

At the bottom of your `mymode_client.lua`, add this code:

```lua
RegisterCommand('car', function(source, args)
    -- TODO: make a vehicle! fun!
    TriggerEvent('chat:addMessage', {
        args = { 'I wish I could spawn this ' .. (args[1] or 'adder') .. ' but my owner was too lazy. :(' }
    })
end, false)
```

Starting already, we see a call to a function. We did not define that function. Well, _we_ (as in, the FiveM team) did, but not when guiding you, the reader, through this wondrously written marvel of a guide. That means it must come from somewhere else!

And, guess what, it's actually {{% native_link "REGISTER_COMMAND" %}}! Click that link, and you'll be led to the documentation for this native. It looks a bit like this:

```c
// 0x5fa79b0f
// RegisterCommand
void REGISTER_COMMAND(char* commandName, func handler, BOOL restricted);
```

We'll mainly care about the name on the second line (`RegisterCommand`, as used in the Lua code above), and the arguments.

As you can see, the first argument is the **command name**. The second argument is a **function** that is the command handler, and the third argument is a **boolean** that specifies whether or not it should be a restricted command.

The function itself gets an argument that is the `source`, which only really matters if you're running on the server (it'll be the client ID of the player that entered the command, a really useful thing to have), and an array of `args` which are basically what you enter after the command like `/car zentorno` making `args` end up being `{ 'zentorno' }` or `/car zentorno unused` being `{ 'zentorno', 'unused' }`.

Since we already know how to print a message to the chat box, we'll just pretend to spawn a vehicle by printing the name of the vehicle to the console.

Let's restart the resource and see what happens. Run `restart mymode`, then in the client chat box (default `T`) type `/car zentorno`. You'll see the chat box complain that you were too lazy to implement this. We'll show them that you're _absolutely not lazy_, and actually implement this now.

### Implementing a car spawner

This is a lot of boilerplate code, and we'll want to do this the _right_ way since lots of people will copy this example, so it might look a bit overwhelming.

Basically what we'll do is:

1.  Check if the passed model is valid. It's no fun trying to spawn a 'potato' when there's no vehicle with that name.
2.  Load the model. You'll need to explicitly manage every model you're using, these are the rules originally defined by R*.
3.  Wait for the model to be loaded. Yes, the game will continue running asynchronously.
4.  Figure out where the player is once it loaded.
5.  Create the vehicle! Awesome, finally you get to be creative.
6.  Put the player into the vehicle.
7.  Clean up, since we are tidy people and 🚮 and all.

Let's get going!

Replace the bit you just pasted in with this, and don't worry we'll explain it before you can say 'lazy' twice:

```lua
RegisterCommand('car', function(source, args)
    -- account for the argument not being passed
    local vehicleName = args[1] or 'adder'

    -- check if the vehicle actually exists
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'It might have been a good thing that you tried to spawn a ' .. vehicleName .. '. Who even wants their spawning to actually ^*succeed?' }
        })

        return
    end

    -- load the model
    RequestModel(vehicleName)

    -- wait for the model to load
    while not HasModelLoaded(vehicleName) do
        Wait(500) -- often you'll also see Citizen.Wait
    end

    -- get the player's position
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped

    -- create the vehicle
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    -- set the player ped into the vehicle's driver seat
    SetPedIntoVehicle(playerPed, vehicle, -1)

    -- give the vehicle back to the game (this'll make the game decide when to despawn the vehicle)
    SetEntityAsNoLongerNeeded(vehicle)

    -- release the model
    SetModelAsNoLongerNeeded(vehicleName)

    -- tell the player
    TriggerEvent('chat:addMessage', {
		args = { 'Woohoo! Enjoy your new ^*' .. vehicleName .. '!' }
	})
end, false)
```

This uses a LOT of natives. We'll link a few of them and explain the hard parts.

#### Step 1: Validation
We started with checking the vehicle name. If it's `nil` (that is, not existent), we'll default to the `adder`. Either way, it's stored in a variable.

Then, we check if the vehicle is in the CD image using {{% native_link "IS_MODEL_IN_CDIMAGE" %}}. This basically means 'is this registered with the game'. We also check if it's a vehicle using {{% native_link "IS_MODEL_A_VEHICLE" %}}. If either check fails, we tell the player and return from the command.

#### Step 2: Loading the model
Now, we call {{% native_link "REQUEST_MODEL" %}} to load the actual vehicle model. This native takes a `Hash` argument, but in Lua you can also just pass a string and it'll be converted to a hash. You'll often see people use `GetHashKey` ({{% native_link "GET_HASH_KEY" %}}), but if the native is _specified_ as taking a `Hash`, you actually don't need this.

#### Step 3: Waiting for the model to be loaded
We loop calls to {{% native_link "HAS_MODEL_LOADED" %}} to check if loading succeeded. Since this is a loop and we're cooperatively multitasked, you'll have to give the game time to run as well - otherwise it'll never even finish loading and the game will unfortunately freeze. That's what the `Wait` call is for - it waits for the specified amount of milliseconds, then returns right back into the script.

Once the model's loaded, we'll continue.

#### Step 4: Getting the player's position
Players' physical incarnations are identified by their `ped`, which is short for 'pedestrian'. This is a GTA term, and it usually means 'anything that lives and has legs'. We use {{% native_link "PLAYER_PED_ID" %}} to get the local (basically, whoever is executing this command) player's ped.

After we have the ped and store it in a variable, we get the position of the player ped using {{% native_link "GET_ENTITY_COORDS" %}}. Since a ped is an entity (the same goes for vehicles and a few other things), this native is used for getting their position. This native, again, returns a `Vector3`, similar to how the `spawnPos` was defined earlier.

#### Step 5: Creating the vehicle
We use {{% native_link "CREATE_VEHICLE" %}} to, well, create a vehicle. In the meanwhile, we snuck in a call to get the player's heading using {{% native_link "GET_ENTITY_HEADING" %}}, which makes the car spawn facing the same direction as the player.

The `true, false` is a convention in entity creation natives to create the vehicle with a network object (`true`), but not make it a mission object (`false`). You usually want the former, or nobody else will see the vehicle - and you won't want the latter, since you're not writing a full R* mission script.

#### Step 6: Setting the player into the vehicle
Since we have a ped and a vehicle now, we can use {{% native_link "SET_PED_INTO_VEHICLE" %}} to place the ped into the vehicle. As the documentation happens to say, `-1` is the driver seat of the vehicle.

#### Step 7: Cleaning up
The game likes it when you clean up after yourself, and as we're not doing anything with the vehicle or the model anymore in this script, we'll let the game manage it. This is what we use {{% native_link "SET_ENTITY_AS_NO_LONGER_NEEDED" %}} and {{% native_link "SET_MODEL_AS_NO_LONGER_NEEDED" %}} for.

Finally, we tell the player to enjoy their new vehicle.

### Running this
In your server console, `refresh; restart mymode` (yeah you can split stuff with semicolons), and try `/car voltic2` in the game client (which should by now be really bored of respawning). You'll now have your very own Rocket Voltic!

## Server scripts
You'll probably also want to write scripts that interact with the server. This section is still to be written. :-(


[manifest-reference]: /docs/scripting-reference/resource-manifest/resource-manifest/
