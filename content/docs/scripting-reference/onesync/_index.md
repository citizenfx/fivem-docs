---
title: OneSync
weight: 575
---

OneSync is a custom sync system that is built on top of GTA: Online's codebase, it increases server
slot count so more players can play on a server and at the same time it introduces better development 
standards including server-sided synchronization states for entities, which we'll cover in this article.

It's worth mentioning that OneSync is free up to 48 slots, after such, you should get one of the following tiers 
from the [Cfx.re Portal](https://portal.cfx.re/subscriptions) starting from `FiveM Element Club Argentum 💿`.

# What is OneSync: Infinity?
- A mode allowing (up to) 2048 players since the recent [commit](https://github.com/citizenfx/fivem/commit/a03eb34c80571ac37cf8d74ca87fa4e646f2e499). There are servers handling 1000+ concurrent players.
- To accomplish this, it uses the following technological changes:
    - Extension of object id length from 8192 (`1 << 13`) to 65535 (`(1 << 16) - 1`), from the following [commit](https://github.com/citizenfx/fivem/commit/e1b1d58dcb3e9147f2b95daf4518ea16593c5631).
    - Player ped/vehicle culling. No entities will be created on clients outside a ‘focus zone’, which currently is hardcoded to 424 units around a player.
    - Player culling. No players will be created/deleted locally outside of the focus zone too. This means that all player iteration will have to happen server-side.
- It also has a bit better performance than ‘plain’ OneSync at this time due to player ped culling, and works around the so-called ‘head blend bug’.

# How is synchronization handled?
Most of the sync data is handled through player `31`, game events are handled through this player as well, this is a player reserved for every individual client, and it's used to write sync data to the server to later on be analyzed through sync-nodes for parsing.

# What are sync nodes and how do I interpret them?
Sync nodes are synchronization data nodes, networked entities depend on these to transmit data to other clients/players on the server. The most simple one we can find is `CSectorPositionDataNode`. 

{{% alert theme="warning" %}}We'll have to warn you that what lies ahead is a little bit technical and is just presented as is for educational purposes on how to analyze game-code and create a PR (pull request) if you would like to contribute to the [code-base][fivem-codebase]. {{% /alert %}}

This synchronization data node is used to share sector position data to other clients about a specific entity, parsing is shown below. It's worth mentioning that the `Parse` code written down below is written by reverse-engineering game code (more or so by reading `NodeCommonDataOperations<class CSectorPositionDataNode, class IProximityMigrateableNodeDataAccessor>` first's VMT ([Virtual Method Table][vmturl]) method which is the `read` method, which would be offset 8 from the VMT).

*The game's VMT:*</br>
![Image](/scripting-reference/onesync/games-vmt.png)

*The read method:*</br>
![Image](/scripting-reference/onesync/asm-read-method.png)

*The game reading the position:*</br>
![Image](/scripting-reference/onesync/position-reading.png)

*The reversed code (from [SyncTrees_Five.h](https://github.com/citizenfx/fivem/blob/master/code/components/citizen-server-impl/include/state/SyncTrees_Five.h))*:

```cpp
struct CSectorPositionDataNode
{
	float m_posX;
	float m_posY;
	float m_posZ;

    // Parse/deserialize incoming data
	bool Parse(SyncParseState& state)
	{
		auto posX = state.buffer.ReadFloat(12, 54.0f);
		auto posY = state.buffer.ReadFloat(12, 54.0f);
		auto posZ = state.buffer.ReadFloat(12, 69.0f);

		m_posX = posX;
		m_posY = posY;
		m_posZ = posZ;

		state.entity->syncTree->CalculatePosition();

		return true;
	}

    // continues...
};
```

The `Parse` method up above deserializes all relevant data about that specific node, this is useful since it can later on be used to create server specific natives, take a look at the example down below (from [ServerGameState_Scripting.cpp](https://github.com/citizenfx/fivem/blob/master/code/components/citizen-server-impl/src/state/ServerGameState_Scripting.cpp)):

```cpp
fx::ScriptEngine::RegisterNativeHandler("GET_ENTITY_COORDS", makeEntityFunction([](fx::ScriptContext& context, const fx::sync::SyncEntityPtr& entity)
{
    float position[3];
    entity->syncTree->GetPosition(position);

    scrVector resultVec = { 0 };
    resultVec.x = position[0];
    resultVec.y = position[1];
    resultVec.z = position[2];

    return resultVec;
}));
```

As you can see `entity->syncTree->GetPosition(position)` directly accesses `CSectorPositionDataNode` to show information about its position via a native on the server, so all that work we would have done before is clearly in effect now (from [SyncTrees_Five.h](https://github.com/citizenfx/fivem/blob/master/code/components/citizen-server-impl/include/state/SyncTrees_Five.h)):
```cpp
virtual void GetPosition(float* posOut) override
{
    auto [hasSdn, secDataNode] = GetData<CSectorDataNode>();
    auto [hasSpdn, secPosDataNode] = GetData<CSectorPositionDataNode>();
    // continues...
}
```
# What's culling?
Culling is used by the server to avoid sending a lot of unneeded data to and from the server, as clients will only care what is going on in their immediate area.

This reduces server load and allows OneSync to handle a lot of clients.

Culling has a range for each specific player, and entities are culled to players within this radius. You could say that in a way, it 'conceals' entities.

{{% alert theme="warning" %}}Culling natives are deprecated and have known, unfixable [issues](https://forum.cfx.re/t/issue-with-culling-radius-and-server-side-entities/4900677/4). {{% /alert %}}

There's natives such as [SetEntityDistanceCullingRadius](https://docs.fivem.net/natives/?_0xD3A183A3) and [SetPlayerCullingRadius](https://docs.fivem.net/natives/?_0x8A2FBAD4) to change the default culling radius.

When an entity goes out of range, it's no longer controlled by their original owner. This means that any entity that would be out of scope will be culled and migrated/disowned. By default, the culling radius is set to `424 units` around the entity.

# Scopes
Players may enter/leave other players' scopes, this depends on the culling radius from each other, [server event][server-events] handlers such as `playerEnteredScope` and `playerLeftScope` can be used to track who entered/left someone else's scope.

An implementation example can be found down below.

## playerEnteredScope

{{% alert title="Performance Warning" color="warning" %}}
Using these events is frowned upon, these events have scaling performance costs. For every person within the scope of the player on every enter/leave scope this this will be called an additional time, so having 32 players within the scope of a player will lead to this being called 32 times. Whenever possible you should use state bags if you need to trigger scoped events, see {{% native_link "ADD_STATE_BAG_CHANGE_HANDLER" %}}.
{{% /alert %}}

This event handler is triggered when a player enters another player's scope.

```lua
AddEventHandler("playerEnteredScope", function(data)
    local playerEntered, player = data["player"], data["for"]
    print(("%s entered %s's scope"):format(playerEntered, player))
end)

```
## playerLeftScope

{{% alert title="Performance Warning" color="warning" %}}
Using these events is frowned upon, these events have scaling performance costs. For every person within the scope of the player on every enter/leave scope this this will be called an additional time, so having 32 players within the scope of a player will lead to this being called 32 times. Whenever possible you should use state bags if you need to trigger scoped events, see {{% native_link "ADD_STATE_BAG_CHANGE_HANDLER" %}}.
{{% /alert %}}

This event handler is triggered when a player leaves another player's scope.

```lua
AddEventHandler("playerLeftScope", function(data)
    local playerLeft, player = data["player"], data["for"]
    print(("%s left %s's scope"):format(playerLeft, player))
end)
```

The original examples can be found in the following forum [post][original-scope-post] by PichotM.

# Best practices

## Server-created entities, not client entities
OneSync allows you to create entities on the server such as Peds, Vehicles and Objects among others.

```lua
-- create a blista at the specified coordinates
local vehicle = CreateVehicleServerSetter(GetHashKey("blista"), "automobile", 2204.795, -887.9213, 1461.224, 90.0)
-- guarantee that the server created entity will be persistent for the server
SetEntityOrphanMode(vehicle, 2)

-- NOTE: Even though this says it is an RPC native, this call is done on the server
-- creates the ped at the same coords!
local ped = CreatePed(4, GetHashKey("a_m_y_acult_01"), 2204.795, -887.9213, 1461.224, 90.0, true, true)
-- guarantee that the server created entity will be persistent for the server
SetEntityOrphanMode(ped, 2)
```

## I want persistent entities, how do I do it?
If you want to guarantee an entity will not be removed by the server you should use {{% native_link "SET_ENTITY_ORPHAN_MODE" %}} with the 'KeepEntity' flag.
This will guarantee that the server will not delete the vehicle, but the client will still be able to request the deletion of the entity.


## RPC Natives
There are certain natives that are RPC (Remote Procedure call) natives, these natives will be called on client (typically on whichever client owns the entity), these calls are fallible and are not guaranteed to be called on the client.

```lua
-- This will call the `CreateVehicle` native on the client
local vehicle = CreateVehicle(GetHashKey("blista"), 2204.795, -887.9213, 1461.224, 90.0, true, true, true)
-- This ped will be created on the server, despite the native docs saying otherwise.
local ped = CreatePed(4, GetHashKey("a_m_y_acult_01"), 2204.795, -887.9213, 1461.224, 90.0, true, true)
-- perhaps teleport a ped into a vehicle?
TaskWarpPedIntoVehicle(ped, vehicle, 1)
-- Fly high!
SetEntityVelocity(vehicle, 0.0, 0.0, 99.0)
```

## Entity lockdown
Entities can be locked down from the server so they can only be authored by it, meaning the server has full control. This allows you to keep things in check and deter users from doing things they shouldn't be doing, such as spawning stuff client side, for... oh well... malicious purposes, i.e.

```lua
local vehicle = CreateVehicleServerSetter(GetHashKey("blista"), "automobile", 2204.795, -887.9213, 1461.224, 90.0)

local ped = CreatePed(4, GetHashKey("a_m_y_acult_01"), GetEntityCoords(GetPlayerPed(source)), GetEntityHeading(GetPlayerPed(source)), true, true)

-- Essentially, we set the routing bucket at id 1 to 'strict' and then we set other entities to this as well as the player bucket so they can't create entities client-side.
SetRoutingBucketEntityLockdownMode(1, "strict")
-- Now the given player (source) won't be able to create entities client-side
SetPlayerRoutingBucket(source, 1)
-- Set the routing bucket of this vehicle to the same bucket the player is in
SetEntityRoutingBucket(vehicle, 1)
-- Let's disable population for everything inside this bucket!
SetRoutingBucketPopulationEnabled(1, false)
```

## Buckets and why you should use them
Server versions from pipeline ID 3245 and above have added a ‘routing bucket’ functionality, which is similar in concept to the ‘dimension’ or ‘virtual world’ functionality seen in prior non-Rockstar GTA network implementations.

One can assign a player or entity to a routing bucket, and they will only see entities (and players) that belong to the same routing bucket. In addition to that, each routing bucket will have its own ‘world grid’ for determining population owners, so even if you have population enabled, you’ll notice nothing unusual at all when using routing buckets.

Example use cases include:

- Multi-mode servers where you want to have different games go on without affecting other games
- Session/party systems
- ‘Character screen’ being instanced differently from gameplay going on

Example use cases do explicitly not include interiors. Interiors should be using the traditional ‘conceal’ native functions, or the future support for 3D-scoped routing policy, which will also allow specifying any ‘instanced’ zone for MMO-style servers so a server can have a map area ‘dedicated’ to a player/party on a mission but still be able to see everything going on outside that zone. [[source]](https://cookbook.fivem.net/2020/11/27/routing-buckets-split-game-state/)

Each bucket can have different rules, these are named 'lockdown modes' and they are described down below:

| Mode       | Meaning                                                    |
| ---------- | ---------------------------------------------------------- |
| `strict`   | No entities can be created by clients at all.              |
| `relaxed`  | Only script-owned entities created by clients are blocked. |
| `inactive` | Clients can create any entity they want.                   |

**There are different kind of natives for routing buckets (you can click on them to read their docs):**

| Native     |
| ---------- |
| **[GET_ENTITY_ROUTING_BUCKET](https://docs.fivem.net/natives/?_0xED4B0486)** |
| **[GET_PLAYER_ROUTING_BUCKET](https://docs.fivem.net/natives/?_0x52441C34)** |
| **[SET_ENTITY_ROUTING_BUCKET](https://docs.fivem.net/natives/?_0x635E5289)** |
| **[SET_PLAYER_ROUTING_BUCKET](https://docs.fivem.net/natives/?_0x6504EB38)** |
| **[SET_ROUTING_BUCKET_ENTITY_LOCKDOWN_MODE](https://docs.fivem.net/natives/?_0xA0F2201F)** |
| **[SET_ROUTING_BUCKET_POPULATION_ENABLED](https://docs.fivem.net/natives/?_0xCE51AC2C)** |

**A rough example:**

```lua
SetRoutingBucketEntityLockdownMode(1, "strict") -- Set the lockdown mode to strict
SetRoutingBucketPopulationEnabled(1, false) -- Let's disable population for everything inside this bucket!
SetPlayerRoutingBucket(source, 1) -- Now the given player (source) won't be able to create entities client-side
```

## Use state bags
State bags allow you to set attributes to entities and allow other clients to access those, you can read more about state bags [here](/docs/scripting-manual/networking/state-bags).


[vmturl]: https://en.wikipedia.org/wiki/Virtual_method_table
[fivem-codebase]: https://github.com/citizenfx/fivem
[server-events]: https://docs.fivem.net/docs/scripting-reference/events/server-events
[original-scope-post]: https://forum.cfx.re/t/onesync-playerenteredscope-and-playerleftscope-events
