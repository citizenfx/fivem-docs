---
title: Network and local IDs
weight: 426
---

There are various kinds of identifiers and handles used across FiveM. A few of them need special attention and are mentioned
below.

## Players

### Server ID

* _Client-side: Server ID_
* _Server-side: 'NetID', player source<span class="l-cs">, `Player`</span>_

The server ID, canonically known as the NetID, is a transient handle that is usually seen in server scripts as `source`.

To convert between a player index on the client and a server index, use {{% native_link "GET_PLAYER_FROM_SERVER_ID" %}} and {{% native_link "GET_PLAYER_SERVER_ID" %}} **on the client**.

### Player index

* _Client-side: Player_
* _Server-side: Non-existent. Use server IDs. Does not round-trip._

The player index is used on the _client_ to refer to a player. It is usually a number from 0 to 128 (inclusive), and is used for game natives as well as some `CFX` natives on the client.

With state awareness enabled, player indices are local to a specific client, as with entity handles.

Note that a player existent on the server does not necessarily exist on the client as well: GET_PLAYER_FROM_SERVER_ID can return `-1` if this is the case.

### Ped

* _Client-side: Ped_
* _Server-side: Ped_

A player will _usually_ have a ped representing the physical entity making up the player's character. This is a standard _network object_ with a network ID.

To get a player's ped, use {{% native_link "GET_PLAYER_PED" %}}, and to get the player belonging to a ped handle, use {{% native_link "NETWORK_GET_PLAYER_INDEX_FROM_PED" %}}.

## Entities

### Entity handle

* _Both sides: Entity, subclasses such as Ped, Object, Vehicle_
* _Server-side: Only available if state awareness is **not** disabled._

An entity handle (Entity, Ped, etc) refers to the internal game representation of the entity, and is _local_ to a specific client. This means you can _not_ expect the same entity to have the same handle on different clients.

Entity handles do not tend to be reused for different entities, however the same entity - if recreated locally or remotely - may get a different handle.

To convert from an entity handle to a network ID and back, use {{% native_link "NETWORK_GET_NETWORK_ID_FROM_ENTITY" %}} and {{% native_link "NETWORK_GET_ENTITY_FROM_NETWORK_ID" %}} (or the equivalent aliases such as PED_TO_NET, NET_TO_VEH, etc.).

### Network ID
* _Both sides: network ID_
* _Server-side: Can be round-tripped, but with state awareness disabled is meaningless on the server._

An entity network ID is a 16-bit integer representing a given entity existing at a point in time. These can and will be reused, but during the lifetime of an entity, the network ID will not change.

If you need to refer to an entity across machines (clients, or the server), you should use its network ID.

Note that just like with players, a network ID is not necessarily in scope on a client: verify its existence using {{% native_link "NETWORK_DOES_ENTITY_EXIST_WITH_NETWORK_ID" %}} before using it.

