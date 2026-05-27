---
title: Migrating from other GTAV multiplayer platforms
weight: 95
---

This page covers the most common topics and differences when migrating from other GTAV multiplayer modification platforms to FiveM.

## Server setter and Server RPC entity creation

The easiest way to create an entity in a server script is to use server-side RPC natives like [CreateVehicle](https://docs.fivem.net/natives/?_0xAF35D0D2583051B0). Note that server RPC natives for creating entities only work if there is a nearby player within the [OneSync focus distance](/docs/scripting-reference/onesync/#what-is-onesync-infinity) and that the creation can fail for various reasons, such as the chosen player disconnecting.

```lua
-- server.lua
local vehicle = CreateVehicle(`adder`, pos.x, pos.y, pos.z, pos.heading, true)
if vehicle == 0 then
    print("Error: No player nearby!")
    return
end

local timeout = GetGameTimer() + 10000
while not DoesEntityExist(vehicle) and GetGameTimer() < timeout do
    Wait(50)
end

if not DoesEntityExist(vehicle) then
    print("Error: Failed to spawn vehicle after 10 seconds")
    return
end

-- Use the server RPC native to set the vehicle's colors
SetVehicleColours(vehicle, 4, 3)
```

If you do want to create entities server-side, or entites for which no players are nearby, you have to use a server setter native:
- CREATE_AUTOMOBILE (deprecated)
- [CREATE_VEHICLE_SERVER_SETTER](https://docs.fivem.net/natives/?_0x6AE51D4B)
- [CREATE_PED](https://docs.fivem.net/natives/?_0x389EF71)
- [CREATE_OBJECT_NO_OFFSET](https://docs.fivem.net/natives/?_0x58040420)

Each of these natives immediately and guaranteed registers an entity with the server, but the entity is initially "orphaned" - it will not be simulated nor exist in the game world until a suitable client is within scope. When entities are orphaned, [NETWORK_GET_ENTITY_OWNER](https://docs.fivem.net/natives/?_0x526FEE31) will return -1. While an entity is orphaned, server RPC natives like [SET_VEHICLE_COLOURS](https://docs.fivem.net/natives/?_0x57F24253) **will not** work, but simple server-side getters like [GET_VEHICLE_COLOURS](https://docs.fivem.net/natives/?_0x40D82D88) will.

A common pattern is to create the vehicle with a server setter, and set an initialization statebag, which is then handled client-side when a client takes ownership of the entity.

```lua
-- server.lua
local heli = CreateVehicleServerSetter(`seasparrow`, 'heli', coords, 0.0)
local state = Entity(heli).state

-- You can also pass initialization date (color, licensePlate, etc) instead of just true
state:set("initVehicle", true, true)

-- client.lua
AddStateBagChangeHandler("initVehicle", nil, function(bagName, key, value) 
  local isDone = false

  -- The owner can rapidly change if multiple clients are nearby when the entity is created. 
  -- To combat this, loop until one owner manages to set the state bag to nil
  while not isDone do
    Wait(0)

    local state = GetStateBagValue(bagName, key)
    if not state then 
      isDone = true
      goto continue 
    end

    local entity = GetEntityFromStateBagName(bagName)
    if entity == 0 then goto continue end
    if NetworkGetEntityOwner(entity) ~= PlayerId() then goto continue end

    -- Do whatever initialization you need here
    SetVehicleOnGroundProperly(entity)

    state:set('initVehicle', nil, true)
    ::continue::
  end
end)
```

{{% alert color="warning" title="Server Setters Reliablity Issues" %} Currently, in rare cases it's possible that the ownership of the entity changes after the state bag handler is done executing but before the CVehicleAppearanceDataNode is synced to the server. In these cases, the changes made in the state bag handler will not apply. It is highly recommended that you have a mechanism to check if the changes applied server-side (for example checking [GET_VEHICLE_COLOURS](https://docs.fivem.net/natives/?_0x40D82D88)) and to recreate the vehicle if they fail to apply after a certain amount of time. {{% /alert %}}

## No colshape system

FiveM does not have a "colshape" system to trigger interactions when a player enters a specific polygon, square, or sphere.

You must implement similar logic yourself (for example, by checking player positions within regions) or use an existing resource like [PolyZone](https://github.com/mkafrin/PolyZone) or [ox_lib's Zones system](https://overextended.dev/ox_lib/Modules/Zones/Shared).

## No dynamic entities

FiveM does not support non-game, script-level "dynamic entities" that are detected and acted upon when they come into range. You must implement any dynamic behavior using native game entities and streaming logic.

## No specific entity types (e.g., checkpoints)

FiveM does not expose specific high-level entity types as distinct objects. You will typically work directly with game natives and handles rather than specialized wrapper types.

## OneSync

OneSync is the network synchronization engine in FiveM, allowing servers to reach up to 2048 players on a single server. See the [OneSync documentation](/docs/scripting-reference/onesync/) for full details.

An Element Club subscription is required to go beyond 48 players. Details are available on the [Cfx Portal](https://portal.cfx.re/).

## No fixed entity limit (server-side streaming behavior)

If there are more entities in range than the game supports, the server may overload and clients in range can time out. This is especially relevant for very large servers (for example, > 500 players).

As a workaround, you can reduce the streaming distance using `SetEntityDistanceCullingRadius` and tune streaming parameters in your [OneSync configuration](/docs/scripting-reference/onesync/).

## No server-based entity ownership (behavior differences)

Server-based authoritative ownership models used by some other multiplayer platforms do not exist in the same way in FiveM. Instead, ownership is handled through client forwarding and ownership events, so resources need to be designed around that behavior.

### sv_filterRequestControl

This server setting limits how clients can request control of entities. Values:

- `0`: No filtering (default).
- `1`: Blocks control requests for vehicles already owned by a player after the settle timer (`sv_filterRequestControlSettleTimer`). Clients might forward ownership naturally after creation, so this setting allows early requests until settled.
- `2`: Same as `1`, but does not allow requests even while entities are not settled yet.
- `3`: Blocks any control requests for controlled or settled entities.
- `4`: Disallows all control requests.

## Dimensions (routing buckets)

FiveM uses routing buckets as its dimension system. They are broadly comparable to the dimension or instance systems found on other platforms, but each routing bucket carries a memory cost and the underlying behavior differs in some important ways. See the [routing buckets article](/docs/scripting-manual/networking/routing-buckets/) for more information.

## C# (Mono)

FiveM's C# runtime uses Mono. Because of that, only older versions of some libraries, including certain Entity Framework versions, are compatible with the runtime. In practice, some servers that previously relied heavily on C# chose to rewrite parts of their server code in JavaScript when migrating.

## Node.js

FiveM uses a modern Node.js runtime which behaves similarly to the embedded Node.js on other platforms.

Filesystem access is sandboxed for security reasons. Check the [Sandbox documentation](/docs/developers/sandbox/) when using multiple resources.

The sandbox can cause issues with some libraries (for example, certain MongoDB drivers). A common workaround is to patch `fs.promises.access` at runtime to hide container files like `./.dockerenv`:

```js
import * as fs from 'fs';

// Keep original
const originalAccess = fs.promises.access;
fs.promises.access = async function (path, mode) {
    if (typeof path === 'string' && (path === './.dockerenv' || path.endsWith('.dockerenv'))) {
        // Pretend file does not exist
        const err = new Error('ENOENT');
        err.code = 'ENOENT';
        throw err;
    }
    return originalAccess.call(this, path, mode);
};
```

## JS Server and Client

JavaScript resources usually run in CommonJS mode. If you need ES6 modules, use a bundler that outputs CommonJS or configure your resource appropriately.

## Reconnect

FiveM only supports reconnect by performing a full disconnect from the server and resetting the game state.

For local development, rely on resource restarts instead of reconnects:

```
ensure resourcename
```

## ACE permission system

FiveM's ACE permission system is its own permission model and does not have a direct one-to-one equivalent on some other multiplayer platforms.

## Pool sizes

Pool sizes are controlled by the server; the client adjusts pool sizes on connect. If the client's pool sizes do not match the server's startup configuration, the client may auto-restart.

Pool sizes are [configured via server startup arguments ](docs/server-manual/server-commands/#increase_pool_size-poolname-increase) and cannot be changed at runtime.

## Identifiers (Social Club, Cloud Auth, Hardware Serial, etc.)

FiveM uses a license identifier verified by Rockstar Online Services, and when both `license` and `license2` are available, `license2` should be preferred.

Identifiers are accessible through `GetNumPlayerIdentifiers` and `GetPlayerIdentifier`, and hardware-related identifiers are available through `GetNumPlayerTokens` and `GetPlayerToken`.

## Documentation

Much of the FiveM documentation and many examples are written in Lua, but the same native method names are also available in JavaScript and C# as globally accessible functions.

## Server-side APIs

Many client-side APIs are not available server-side. To bridge that gap, you can forward calls through network events. To avoid issues caused by calling functionality too early on the client, it is also good practice to check whether an entity exists with `DoesEntityExist` before using it.

## Entity APIs

Most entity APIs are exposed as native functions. Custom helper functions can exist on both client and server, but they ultimately operate on entity handles in the same way as the underlying game natives.

## Entity identifiers

There are three common [entity identifier types](docs/scripting-manual/networking/ids/) to keep in mind:

- **Handles**: local identifiers that are not synchronized between client and server.
- **PlayerIds**: unique identifiers for connected players. Players also have ped entity IDs that are synchronized between client and server.
- **NetIDs**: network identifiers that are synchronized between client and server.

## Synchronized metadata (StateBags)

StateBags are used to synchronize entity metadata between client and server. They support both replicated and non-replicated values. See the [State Bags documentation](/docs/scripting-manual/networking/state-bags/) for more detail on how to use them effectively.

## txAdmin

txAdmin is optional but commonly used for administration and automation. See the [txAdmin documentation](/docs/resources/txAdmin/) for more information.

## Persistent storage (KVP)

FiveM provides persistent storage through KVP natives. This key-value store supports floats, strings, and integers, and is available on both the client and the server.

Search the [Native Reference](https://docs.fivem.net/natives/) for `kvp` natives.

## Networked entities and lockdown mode

Entities marked as networked in their creation parameters are synchronized by the client by default.

To prevent clients from creating synchronized entities, you can enable the strict [entity lockdown mode](https://docs.fivem.net/docs/scripting-reference/onesync/#entity-lockdown).

The server can also intercept entity creation by canceling the `entityCreating` event, and if you need to prevent an entity from being deleted on the client, you can use [SET_ENTITY_ORPHAN_MODE](https://docs.fivem.net/natives/?_0x489E9162).

## disableOutgoingSync

There is no direct equivalent API in FiveM to disable outgoing synchronization of entity data. A common alternative is to use camera spectating techniques instead of teleporting or fully transferring entity positions.

## Voice

FiveM uses the Mumble VoIP system, and the related functions are exposed as natives. Many servers use [pma-voice](https://github.com/AvarianKnight/pma-voice) as a wrapper around FiveM's built-in Mumble functionality. For very large servers, an external Mumble server like [Zumble](https://github.com/AvarianKnight/rust-mumble) or a dedicated FXServer instance may be a better fit.

See the [Voice documentation](/docs/scripting-manual/voice/) for more details.

## RPC system

FiveM does not provide a built-in RPC system, so any RPC-like behavior needs to be implemented with [network events](/docs/scripting-manual/working-with-events/) and your own request-and-response conventions.

## Player name

The player's name is defined in the FiveM main menu settings and cannot be changed without user interaction. If a different display name is required, you will need to implement your own logic to store and use an alternative name, since the built-in value is intentionally read-only.

## References (FiveM community)

Below are useful community pages for FiveM. Use these to ask questions, find resources, and connect with other developers.

- FiveM Forum: [Cfx.re Community](https://forum.cfx.re/)
- FiveM Discord Community: [https://discord.com/invite/fivem](https://discord.com/invite/fivem)
- FiveM GitHub: [citizenfx/fivem](https://github.com/citizenfx/fivem)

## References (FiveM documentation)

Below are useful documentation pages on the official Cfx.re / FiveM docs. Use these to look up natives, server variables, events and feature-specific guides mentioned in this document.

- State bags: [State Bags documentation](/docs/scripting-manual/networking/state-bags/)
- Native reference (search for natives like `SetEntityOrphanMode`, `GetPlayerIdentifiers`, `SetEntityDistanceCullingRadius`, etc.): [Native Reference](https://docs.fivem.net/natives/)
- Sandbox (resource filesystem sandboxing): [Sandbox documentation](/docs/developers/sandbox/)
- Server commands: [Server Commands](/docs/server-manual/server-commands/)
- Server variables (`sv_*` settings, e.g. `sv_filterRequestControl`): [Convars](/docs/scripting-reference/convars/)
- Events and event lifecycle (includes `entityCreating`): [Events](/docs/scripting-reference/events/)
- KVP / persistent storage: [Native Reference](https://docs.fivem.net/natives/) (search for `kvp`)
- Voice / Mumble integration: [Voice documentation](/docs/scripting-manual/voice/)
- txAdmin (administration tool): [txAdmin documentation](/docs/resources/txAdmin/)
- [AvarianKnight/Zumble](https://github.com/AvarianKnight/rust-mumble)
- [AvarianKnight/pma-voice](https://github.com/AvarianKnight/pma-voice): An easy drag n' drop resource that gives you a wrapper to use FiveM's built-in mumble voice.
