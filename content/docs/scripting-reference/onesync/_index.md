---
title: OneSync
weight: 575
---

OneSync is a custom sync system that is built on top of GTA: Online's codebase, it increases server
slot count so more players can play on a server and at the same time it introduces better development 
standards including server-sided synchronization states for entities, which we'll cover in this article.

It's worth mentioning that OneSync is free up to 48 slots, after such, you should get one of the following tiers 
from [Patreon](https://www.patreon.com/join/fivem) starting from `FiveM Element Club Argentum 💿`.

# What is OneSync: Infinity?
- A mode allowing (up to) 2048 players since the recent [commit](https://github.com/citizenfx/fivem/commit/a03eb34c80571ac37cf8d74ca87fa4e646f2e499). We have only tested 600-ish in load tests since we couldn’t get any more players, but it held up quite well in the end (on a server with minimal resources)
- To accomplish this, it uses the following technological changes:
    - Removal of population to save object ID pool space. You can still create (some) synced/networked peds using script, however.
    - Player ped/vehicle culling. No entities will be created on clients outside a ‘focus zone’, which currently is hardcoded to 300 units around a player. We’re still looking for a better algorithm.
    - Player culling. No players will be created/deleted locally outside of the focus zone too. This means that all player iteration will have to happen server-side.
- It also has a bit better performance than ‘plain’ OneSync at this time due to player ped culling, and works around the so-called ‘head blend bug’.

# How is synchronization handled?
Most of the sync data is handled through player `31`, game events are handled through this player as well, this is a player reserved for every individual client, and it's used to write sync data to the server to later on be analyzed through sync-nodes for parsing.

# What are sync nodes and how do I interpret them?
Sync nodes are synchronization data nodes, networked entities depend on these to transmit data to other clients/players on the server. The most simple one we can find is `CSectorPositionDataNode`.

This synchronization data node is used to share sector position data to other clients about a specific entity, parsing is shown below. It's worth mentioning that the `Parse` code written down below is written by reverse-engineering game code (more or so by reading `NodeCommonDataOperations<class CSectorPositionDataNode, class IProximityMigrateableNodeDataAccessor>` first's VMT method which is the `read` method, which would be offset 8 from the VMT) so it requires a bit of know-how if one were to attempt to contribute to the repo and create a PR.

*The game's VMT:*</br>
![Image](https://i.imgur.com/9Til977.png)

*The read method:*</br>
![Image](https://i.imgur.com/tPIzQMg.png)

*The game reading the position:*</br>
![Image](https://i.imgur.com/5BX8krM.png)

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
Culling is used to avoid sending a lot of synchronization data to the server (such as population among others), thus reducing server load, it's what allows OneSync to handle a lot of clients. Culling has a range for each specific player, and entities are culled to players within this radius. You could say that in a way, it 'conceals' entities. There's natives such as `SetEntityDistanceCullingRadius` and `SetPlayerCullingRadius` to change the default culling radius.

When an entity goes out of range, it's no longer controlled by their original owner. This means that any entity that would be out of scope will be culled and migrated/disowned.

# Best practices

## Server-created entities, not client entities
OneSync allows you to create entities on the server such as Peds, Vehicles and Objects among others.
One of the advantages about this, is that the server allows you to call natives via RPC (Remote Procedure Call) to perform actions on the client without having to request control of an entity from the client.

For example:
```lua
local vehicle = CreateVehicle(GetHashKey("blista"), 2204.795, -887.9213, 1461.224, 90.0, true, true, true)
local ped = CreatePed(4, GetHashKey("a_m_y_acult_01"), GetEntityCoords(GetPlayerPed(source)), GetEntityHeading(GetPlayerPed(source)), true, true)
TaskWarpPedIntoVehicle(ped, vehicle, 1) -- perhaps teleport a ped into a vehicle?
SetEntityVelocity(vehicle, 0.0, 0.0, 99.0) -- Fly high!
```

## I want persistent entities, how do I do it?
Create them server-side as shown up above. If you want to stop this entity from 'despawning' when far away, you could always set the entity culling radius to a very large number by using the following native: `SetEntityDistanceCullingRadius`. You should use this sparingly though, and you should rather do manual lower-level sync such as latent events for blips if you have large amounts of entities. Make sure to make use of network id's since they remain valid as long as the entity is alive.

## Entity lockdown
Entities can be locked down from the server so they can only be authored by it, meaning the server has full control. This allows you to keep things in check and deter users from doing things they shouldn't be doing, such as spawning stuff client side, for... oh well... malicious purposes, i.e.

```lua
local vehicle = CreateVehicle(GetHashKey("blista"), 2204.795, -887.9213, 1461.224, 90.0, true, true, true)

-- Essentially, we set the routing bucket at id 1 to 'strict' and then we set other entities to this as well as the player bucket so they can't create entities client-side.
SetRoutingBucketEntityLockdownMode(1, "strict")
SetPlayerRoutingBucket(source, 1)
SetEntityRoutingBucket(vehicle, 1)
```

## What's a bucket?
Think of a bucket as a container, but you have multiple of them, if you put objects inside these containers (say you have bucket 1 and bucket 2), you separate them and they don't have access to each other, but they are still population-aware. Each container can have different rules, these are named 'lockdown modes' and they are described down below:

| Mode       | Meaning                                                    |
| ---------- | ---------------------------------------------------------- |
| `strict`   | No entities can be created by clients at all.              |
| `relaxed`  | Only script-owned entities created by clients are blocked. |
| `inactive` | Clients can create any entity they want.                   |

## Use state bags
State bags allow you to set attributes to entities and allow other clients to access those, you can read more about state bags [here](/docs/scripting-manual/networking/state-bags).