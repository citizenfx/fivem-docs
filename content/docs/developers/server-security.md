---
title: Secure your events
---

The anti-cheat team is always trying to improve the anti-cheat, but sometimes things slip through.

In this guide we'll try to help cover some common-practice things you can do to make your server more secure.

## Events
Cheats can allow the client to trigger events in any context

* When we say `context` we mean they can execute `client->server` (via `TriggerServerEvent`) or `client resource->client resource` (via `TriggerEvent`)

### Proper Use of Event Handlers in Lua
When working with events in Lua, it's crucial to register them correctly based on whether they are called by the client or the server.

A common mistake is registering server events that are not supposed to be called by the client, or vice-versa, which can lead to security vulnerabilities.

#### `AddEventHandler`

Use `AddEventHandler` when the event is intended to be triggered within the same context, either client-client or server-server. This ensures that the events are not networked and cannot be called by the opposing side.

```lua
AddEventHandler("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered within the same context.
end)
```

#### `RegisterNetEvent`

Use `RegisterNetEvent` when the event needs to be triggered across different contexts, such as from client to server or server to client.

**NOTE**: This doesn't block execution from the same context, under the hood `RegisterNetEvent` is a wrapper that is just the following

```lua
RegisterNetEvent("eventName")
AddEventHandler("eventName", function()

end)
```

```lua
RegisterNetEvent("eventName", function(eventParam1, eventParam2)
    -- Code here will be executed once the event is triggered across different contexts.
end)
```

This example is for the client, this example *is not bullet proof* as with anything on the client, it can be manipulated by cheating clients.

If you want to block execution from the same context, you should register your event like so:
```lua
RegisterNetEvent("eventName", function(eventParam1, eventParam2)
    -- server will send net id `65535` for events from the server
    if source ~= 65535 then return end
end)
```

You can learn more [on this guide](/docs/scripting-manual/working-with-events/listening-for-events/).

### Add Checks
Even if you build a strong anti-cheat, adding checks on **server** events makes them more secure. This is a good practice, although it doesn't prevent everything. Below, we will share some good tips.

When using networked events, make sure to add some checks like:
- Player money
- Player [state bags](/docs/scripting-manual/networking/state-bags/)
- Player inventory items
- Player [position](https://docs.fivem.net/natives/?_0x1647F1CB)
- Player experience and level
- Player [permissions](https://forum.cfx.re/t/basic-aces-principals-overview-guide/90917) and roles

Make sure to retrieve all values using server-side methods, not allowing players to change the values.

This ensures the integrity and security of your game environment. Please note that client checks can also be a good practice but can be easily be overridden.

### Examples of common security patterns
All examples assume some kind of framework.

##### Bad Security

{{% alert color="warning" %}}
This is meant to show you *bad* ways of doing events, you should **never** do this.
{{% /alert %}}

```lua
RegisterNetEvent("job:givePlayerItem", function(item, count)
    local ply = FX.GetPlayerFromSource(source)
    -- directly adding items to the user from their own input
    -- is always bad practice, you should always validate user input
    ply.addItem(item, count)
end)
```

##### Good Security

You can also check out [this example resource](https://github.com/TheIndra55/secure-resource-examples) for a more in-depth example with client and server examples.

```lua
-- coord is randomly made up
local VALID_JOB_COORD = vector3(125.0, 111.1, 35.83)
local MAX_ITEM_COUNT = 10

-- coord is randomly made up
local VALID_TURNIN_COORD = vecor3(1888.0, 1254.1, 48.0)

local ITEM_NAME = 'log'

-- list of players with active jobs
local activeJobs = {}

AddEventHandler("playerDropped", function ()
    if not activeJobs[source] then return end
    activeJobs[source] = nil
end)

function isPedWithinRange(ped, tgtCoords)
    return #(GetEntityCoords(ped) - tgtCoords) < 15.0
end

-- handle incrementing the amount of items the ped would get server side
CreateThread(function()
    while true do
        for src, data in pairs(activeJobs) do
            local ped = GetPlayerPed(source)
            -- if they're not within range then we don't want to give them the item
            if isPedWithinRange(ped, VALID_JOB_COORD) then
                -- give them the item, but limit it to MAX_ITEM_COUNT
                data.itemCount = math.min(data.itemCount + 1, MAX_ITEM_COUNT)
            end
        end
        -- process job tick once per second
        Wait(1000)
    end
end)

RegisterNetEvent("job:startJob", function()
    local ped = GetPlayerPed(source)
    -- if they're within 15 units then they are doing the job
    if isPedWithinRange(ped, VALID_JOB_COORD) then
        activeJobs[source] = {
            itemCount = 0,
        }
    end
end)

RegisterNetEvent("job:givePlayerItem", function()
    local ply = FX.GetPlayerFromSource(source)
    -- if they don't have an active job then they shouldn't be hitting this!
    local jobData = activeJobs[source]
    if not jobData then return end

    -- they're not within range of the turn in coordinates, reject their changes
    if not isPedWithinRange(ped, VALID_TURNIN_COORD) then return end

    -- reset the item data so they can't trigger it multiple times
    activeJobs[source] = nil

    -- directly adding items to the user from their own input
    -- is always bad practice, you should always validate user input
    ply.addItem(ITEM_NAME, jobData.itemCount)
end)
```


## Server owner options
#### Please note that the following shouldn't be touched unless you know what you are doing.
Adhesive team is always working really hard to prevent cheaters to be able to use them. You will have most of those features enabled by default with FXServer `8450` build version and higher.

```
sv_kick_players_cnl_timeout_sec
```
This is the timeout at which the server will kick the player. (EX: if this is 600, kick them after 10 minutes of no CnL connection).

```
sv_kick_players_cnl_update_rate_sec
```
This is the frequency at which CnL is queried with the player list.

```
sv_pure_verify_client_settings
```
Replaces the periodic request to `info.json` in the client. Establishes a connection between `adhesive`<->`svadhesive` and verifies some of the `sv_settings` such as pureLevel, scripthook and other settings.

```
sv_kick_players_cnl_consecutive_failures
```
How many X's in a row do we need to see a player over the `timeout_sec` in order to Kick. The default is set to 2, indicating that if a player fails to check in for 10 minutes and then misses the next check-in update, they will be kicked. This serves as a failsafe mechanism.

```
sv_authMaxVariance
```
**Variance** is how likely the user's id will change for a given provider (i.e. 'steam', 'ip', or 'license'). You can learn about it [here](/docs/server-manual/server-commands/#sv_authmaxvariance-newvalue).

```
sv_authMinTrust
```
**Trust** is how unlikely it is for the user's identity to be spoofed by a malicious client. You can learn about it [here](/docs/server-manual/server-commands/#sv_authmintrust-newvalue).

```
sv_filterRequestControl
```
A console variable used to block `REQUEST_CONTROL_EVENT` routing based on a configurable policy. You can learn about the list [here](/docs/server-manual/server-commands/#sv_filterrequestcontrol-mode).

### Results on Player
Having those convars active will likely get the player kick with the following reason:
```
Connection to CNL timed out.
```

**Note:** some error *might occur* but it's unlikely.

User getting kicked doesn't mean is automatically Global Ban. However, it provides an indication of player reliability, which can be useful for assessing trustworthiness.

We also have some other options:

```
sv_disableClientReplays
```
Enabling this will aim to reduce chances of cheating options. Please note that this will disable Rockstar Editor.

## Important to know
The codes provided are not supposed to be working on a copy/paste method. This is just some tips to prevent some actions that might happen in the server. This require some knowledge, you are always free to join our [discord](https://discord.gg/fivem) to get additionnal help.
