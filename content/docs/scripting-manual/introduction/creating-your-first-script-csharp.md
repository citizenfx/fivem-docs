---
title: Creating your first script in C#
weight: 412
---

Getting started with scripting for FiveM might be a tad overwhelming, given the wide range of possibilities and the sparsely spread documentation. In this quick and simple guide, we'll try to show you how to get started with a quick resource in C#. We will be implementing a car spawner through a command.

## Prerequisites
Before creating your first script with C#, there are a couple of things you will need to set up and understand.

* [A basic understanding of C#](https://learn.microsoft.com/en-us/dotnet/csharp/#learn-to-program)
* [Creating a C# project and setup your environment](/docs/scripting-manual/runtimes/csharp)
* [Understanding of resources and manifest files](/docs/scripting-reference/resource-manifest/resource-manifest)

### Writing code
Now that you have set up your C# project and environment, you will have two projects; `MyResourceNameClient` and `MyResourceNameServer`.

Any C# class that handles FiveM scripting-related events must inherit from the `BaseScript` class. Lets do this by going to `Class1.cs` in your client project. At the same time, we will also define a constructor, which we will use further on. Make sure you have a using directive to `CitizenFX.Core`.
```csharp
using CitizenFX.Core;

namespace MyResourceNameClient
{
    public class Class1 : BaseScript
    {
        public Class1()
        {

        }
    }
}
```

Easy right? But what about adding functionality? We will start by adding a command using various FiveM scripting concepts.

```csharp
using System;
using System.Collections.Generic;
using CitizenFX.Core;
using static CitizenFX.Core.Native.API;

namespace MyResourceNameClient
{
    public class Class1 : BaseScript
    {
        public Class1()
        {
            EventHandlers["onClientResourceStart"] += new Action<string>(OnClientResourceStart);
        }

        private void OnClientResourceStart(string resourceName)
        {
            if (GetCurrentResourceName() != resourceName) return;

            RegisterCommand("car", new Action<int, List<object>, string>((source, args, raw) =>
            {
                // TODO: make a vehicle! fun!
                TriggerEvent("chat:addMessage", new
                {
                    color = new[] {255, 0, 0},
                    args = new[] {"[CarSpawner]", $"I wish I could spawn this {(args.Count > 0 ? $"{args[0]} or" : "")} adder but my owner was too lazy. :("}
                });
            }), false);
        }
    }
}
```

You might be overwhelmed at this point, but don't worry. We will go through everything bit by bit.

```csharp
EventHandlers["onClientResourceStart"] += new Action<string>(OnClientResourceStart);
```
In the constructor we've added an event handler for the [onClientResourceStart](/docs/scripting-reference/events/list/onClientResourceStart/) event. It takes one argument; a string with the name of the resource that was started. It also has a delegate method `OnClientResourceStart`, which we defined beneath the constructor. Once the resource has started, FiveM will trigger this event and invoke the method.

```csharp
if (GetCurrentResourceName() != resourceName) return;
```
This if statement makes use of the native `GetCurrentResourceName()`. In short, _natives_, which has nothing to do with indigenous people, is actually a R* label for 'game-defined script functions'. We can access these natives through the `CitizenFX.Core.Native.API` class. You will be using other natives later when spawning a vehicle. In this snippet, `GetCurrentResourceName()` returns the name of the resource that our script is running. We compare this to the `resourceName` argument to make sure that we only call the rest of the method once. If we don't do this check, the rest of the method will run every time any resource has started.

```csharp
RegisterCommand("car", new Action<int, List<object>, string>((source, args, raw) =>
{
    // TODO: make a vehicle! fun!
    TriggerEvent("chat:addMessage", new
    {
        color = new[] {255, 0, 0},
        args = new[] {"[CarSpawner]", $"I wish I could spawn this {(args.Count > 0 ? $"{args[0]} or" : "")} adder but my owner was too lazy. :("}
    });
}), false);
```
To start, we see a call to a function. We did not define that function. Well, _we_ (as in, the FiveM team) did, but not when guiding you, the reader, through this wondrously written marvel of a guide. That means it must come from somewhere else!

And, guess what, it's actually {{% native_link "REGISTER_COMMAND" %}}! Click that link, and you'll be led to the documentation for this native. It looks a bit like this:

```c
// 0x5fa79b0f
// RegisterCommand
void REGISTER_COMMAND(char* commandName, func handler, BOOL restricted);
```

We'll mainly care about the name on the second line (`RegisterCommand`, as used in the C# code above), and the arguments.

As you can see, the first argument is the **command name**. The second argument is a **function** (represented by the Action delegate in our example) that is the command handler, and the third argument is a **boolean** that specifies whether or not it should be a restricted command.

The function itself gets an argument that is the `source`, which only really matters if you're running on the server (it'll be the client ID of the player that entered the command, a really useful thing to have), and a List of `args` which are basically what you enter after the command like `/car zentorno` making `args` end up being `new List<object>{ "zentorno" }` or `/car zentorno unused` being `new List<object>{ "zentorno", "unused" }`.

But what about `TriggerEvent()`? That's also defined by _us_. It's used to call the event `chat:addMessage`, which is part of the [chat](/docs/resources/chat/events/chat-addMessage/) resource. In our written example, we send the author name `[CarSpawner]` in red and a message as arguments.

At this point, you can build your client project, add/move it to your resource and run it. When typing `/car` in the chat box, you will see our command returning the chat message we defined. ![screenshot-1](/csharp-tut-6.png)

Hey! It's complaining in the chat box that you were too lazy to implement this. We'll show them that you're _absolutely not lazy_, and actually implement this now.

### Implementing a car spawner
You may have followed the Lua tutorial on creating your first script and remember that there was a lot of boilerplate code that might looked overwhelming. Fear not, FiveM provides an easy to use C# wrapper that will allow us to reduce the code.

```csharp
RegisterCommand("car", new Action<int, List<object>, string>(async (source, args, raw) =>
{
    // account for the argument not being passed
    var model = "adder";
    if (args.Count > 0)
    {
        model = args[0].ToString();
    }

    // check if the model actually exists
    // assumes the directive `using static CitizenFX.Core.Native.API;`
    var hash = (uint) GetHashKey(model);
    if (!IsModelInCdimage(hash) || !IsModelAVehicle(hash))
    {
        TriggerEvent("chat:addMessage", new 
        {
            color = new[] { 255, 0, 0 },
            args = new[] { "[CarSpawner]", $"It might have been a good thing that you tried to spawn a {model}. Who even wants their spawning to actually ^*succeed?" }
        });
        return;
    }

    // create the vehicle
    var vehicle = await World.CreateVehicle(model, Game.PlayerPed.Position, Game.PlayerPed.Heading);
    
    // set the player ped into the vehicle and driver seat
    Game.PlayerPed.SetIntoVehicle(vehicle, VehicleSeat.Driver);

    // tell the player
    TriggerEvent("chat:addMessage", new 
    {
        color = new[] {255, 0, 0},
        args = new[] {"[CarSpawner]", $"Woohoo! Enjoy your new ^*{model}!"}
    });
}), false);
```

This uses some natives and C# wrapper methods. We'll link a few of them and explain the hard parts.

#### Step 1: Validation
We started with checking the model. We set it to `adder`. If there are any arguments, we set the model to the first argument and cast it to a string.

Then, we check if the vehicle is in the CD image using {{% native_link "IS_MODEL_IN_CDIMAGE" %}}. This basically means 'is this registered with the game'. We also check if it's a vehicle using {{% native_link "IS_MODEL_A_VEHICLE" %}}. If either check fails, we tell the player and return from the command.

There may be C# wrapper here, but it's important to reify the use of natives as you will use them a lot when scripting. Make sure you have the `using static CitizenFX.Core.Native.API;` directive in your class.

#### Step 2: Creating the vehicle
Using the client side C# wrapper class `World`, we call the `CreateVehicle` method which takes a model, `Vector3` position, and `float` heading as arguments. This is the great thing about C#. You have access to a method supplied by _us_ such that you don't have to request and load a model like you would in Lua. This method returns us a `Vehicle` object. If you have experience with *ScriptHookV.NET* you may recognize these classes. The C# wrapper of FiveM is very similar.

#### Step 3: Setting the player into the vehicle
Since we have our ped and a vehicle now, using the C# wrapper with the `Game.PlayerPed` object, we can set ourselves into the vehicle's driver seat.

### Running this
Build your project and make sure the latest `MyResourceNameClient.net.dll` is in the folder of your resource. In your server console, type `restart mymode` (or whatever you named your resource), and try `/car voltic2` in the game client (which should by now be really bored of respawning). You'll now have your very own Rocket Voltic!

## Server scripts
You'll probably also want to write scripts that interact with the server. This section is still to be written. :-(
