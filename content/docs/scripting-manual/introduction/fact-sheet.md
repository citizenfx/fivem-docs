---
title: Fact Sheet
weight: 414
---

Here's a quick informative sheet to get you up to speed with FiveM development.

# What does ScRT mean?
_ScRT_ means _Scripting Runtime_ or _Script Runtime_. FiveM has three different scripting runtimes available (Lua, C# and JavaScript), and they are mentioned down below.

# How do I get started with scripting?
The scripting manual can be found [here](/docs/scripting-manual/) and it features the following articles:

- [Introduction to resources](/docs/scripting-manual/introduction/introduction-to-resources)
    - [Creating your first script](/docs/scripting-manual/introduction/creating-your-first-script)
- [Scripting runtimes](/docs/scripting-manual/runtimes)
    - [Scripting in Lua](/docs/scripting-manual/runtimes/lua)
    - [Scripting in JavaScript](/docs/scripting-manual/runtimes/javascript)
    - [Scripting in C#](/docs/scripting-manual/runtimes/csharp)
- [Migrating from deprecated methods](/docs/scripting-manual/migrating-from-deprecated)
  - [Chat Messages](/docs/scripting-manual/migrating-from-deprecated/chat-messages)
- [Working with events](/docs/scripting-manual/working-with-events)
  - [Listening for events](/docs/scripting-manual/working-with-events/listening-for-events)
  - [Triggering events](/docs/scripting-manual/working-with-events/triggering-events)
- [NUI](/docs/scripting-manual/nui-development)
- [Using Scaleform](/docs/scripting-manual/using-scaleform)
- [Voice](/docs/scripting-manual/voice)
- [Using new game features](/docs/scripting-manual/using-new-game-features)

You can refer to the page mentioned above to see the scripting manual in full detail.

# Natives
## What's a Native?
Simply put, a Native, is a function exposed by the game in order to be called from scripts and either perform a given action in the game itself or request data from it. For example, one would type the following, to get the local player's ped from a Lua script and then give a weapon to that ped. 

```lua
ped = GetPlayerPed(-1)
GiveWeaponToPed(ped, GetHashKey("WEAPON_PISTOL"), 100, false, false) -- We got a gun now!
```

## Where are all the natives?
Natives are located [here](https://docs.fivem.net/natives/).

# Developer Commands & Game References
## Where are all the developer commands?
Developer commands can be found [here](/docs/client-manual/console-commands/#developer-commands).

## Where are all the blips, ped models and others?
These are named _Game references_, and they can be found over [here](/docs/game-references).

# Performance
## What are hitch warnings?
Hitch warnings indicate that one of your resources is not performing as it should and you should look into the affected resource to _figure out why, using the profiler can help diagnosing this._ Things such as these, can sometimes be caused by writing underperforming SQL queries that take a long time to execute, as well as unoptimized loops that end up halting the script execution.

## Profiler
The profiler can be used to diagnose _why_ a resource is taking a long time to execute, there's a [guide](/docs/scripting-manual/debugging/using-profiler) explaining how to use it, it can be used both on the server and client.

## Resource Monitor (Resmon)
The resource monitor can be used on the client to diagnose which resource is taking a long time to execute, it shows certain things such as cpu usage (msec) and memory usage for each resource. 

It can be enabled by typing `resmon true`. It's possible that you see a message such as `Access denied for command resmon` (especially when running in production builds), this means that the developer mode needs to be enabled by launching the FiveM/RedM client using the `+set moo 31337` argument (for example, by adding it to a shortcut).