---
title: HTTP endpoints
weight: 10
description: >
  Read the live OneSync and voice state of a running server over HTTP, for debugging and tooling.
---

A server running OneSync keeps track of a lot of things. For example: which entities exist, who owns them, which routing bucket they sit in, and which part of the world each player is responsible for. FXServer can hand all of that out over plain HTTP, as a small set of read only pages you can see by sending HTTP requests to it.

All of these endpoints are part of the /onesync/ path, except for one that reports the state of voice chat, because it shares the same credentials it is covered here too.

This is meant for you, the person running the server or making development tools, when you want to see what is actually going on.

{{% alert color="info" title="Community documented" %}}
While these endpoints are cool, this documentation only covers what they are in the basic sense. Since the source code is not public for FXServer, the actual usage of these endpoints may differ from what's documented here.
{{% /alert %}}

## Turning them on

The endpoints are switched off until you give them a username and a password. Add these two lines to your `server.cfg`, pick your own values, and restart the server.

```cfg
set sv_onesyncBasicAuthUser "user"
set sv_onesyncBasicAuthPassword "a-long-random-password"
```

These work exactly like the credentials for the Prometheus `/perf` endpoint. If either one is left empty, every request is refused, including the voice one despite its name having nothing to do with OneSync.

Two of them want a little more than credentials. The `/onesync/` endpoints need OneSync itself enabled, because without it there is no state to hand out in the first place. The voice endpoint needs voice chat running, which is covered in its own section further down.

{{% alert color="warning" title="Security and performance" %}}
Treat these credentials with care. Anyone who can reach the endpoints gets a live list of every player and vehicle on your server, including their exact world coordinates, refreshed as fast as they care to ask. A cheater could use that for their own advantage to see where players are. Also there is no rate limiting on these endpoints, spamming them will have impact on your servers performance.
{{% /alert %}}

## The endpoints

There are eight, and that is the whole list.

| Endpoint                                     | What it gives you                                  |
| -------------------------------------------- | -------------------------------------------------- |
| `/onesync/entities.json`                     | Every networked entity the server is tracking.     |
| `/onesync/entities/{id}/stateBag.json`       | One entity's state bag.                            |
| `/onesync/clients.json`                      | Connected clients, and the entities each one owns. |
| `/onesync/clients/{id}/stateBag.json`        | One client's state bag.                            |
| `/onesync/routingBuckets.json`               | Which routing buckets are currently in use.        |
| `/onesync/routingBuckets/{id}/worldGrid.bmp` | A picture of who owns which patch of the world.    |
| `/onesync/time.json`                         | The server's own clock.                            |
| `/voicechannels.json`                        | Voice channels, and who is in them.                |

Notice that the last one sits at the root of the server rather than under `/onesync/`, because voice chat has nothing to do with OneSync. Asking for `/onesync/voicechannels.json` gets you a `404`. It is listed here because it uses the very same credentials and is useful in the same situations.

Every one of them is a `GET`, and every one of them needs HTTP Basic authentication using the username and password you set above. A quick check that it all works:

```bash
curl -u user:pass http://localhost:30120/onesync/time.json
```

```json
{ "serverTime": 9130283 }
```

## entities.json

The big one. You get a flat array with one object per networked entity, covering everything the server knows about across all routing buckets at once. Players, their vehicles, traffic, pedestrians walking around, props, all of it.

```json
[
  {
    "id": 35,
    "netId": 34,
    "routingBucket": 0,
    "ownerClientID": 1,
    "firstOwningClientID": 1,
    "firstOwnerDropped": false,
    "type": 0,
    "uniquer": 33889,
    "scriptHash": 0,
    "relevant": true,
    "createdAt": 9101805,
    "lastFrameIndex": 519979,
    "timestamp": 9114101,
    "lastMigratedAt": 0,
    "position": [-2349.3757, 1899.3099, 183.2535]
  }
]
```

### Fields you will always get

| Field                 | Meaning                                                                                                                                                                     |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                  | The server's own handle for the entity. This is the number the state bag endpoint wants.                                                                                    |
| `netId`               | The network id, which is the number your scripts see from {{% native_link "NETWORK_GET_NETWORK_ID_FROM_ENTITY" %}}.                                                         |
| `routingBucket`       | Which routing bucket the entity lives in.                                                                                                                                   |
| `ownerClientID`       | The server id of the client that currently owns the entity. `65535` means nobody does.                                                                                      |
| `firstOwningClientID` | The server id of the client that owned it first, which is usually whoever created it.                                                                                       |
| `firstOwnerDropped`   | Whether that first owner has since left the server.                                                                                                                         |
| `type`                | What kind of entity it is, as a number. See the table further down.                                                                                                         |
| `uniquer`             | A random value handed out when the entity was created. Net ids get recycled, so this lets you tell a brand new entity apart from the one that used to hold the same net id. |
| `scriptHash`          | The hash of the script that created the entity, or `0` when no script did, such as for traffic the game spawned by itself.                                                  |
| `relevant`            | Whether at least one client currently needs to know about this entity.                                                                                                      |
| `createdAt`           | The server clock reading from the moment the entity was created.                                                                                                            |
| `lastFrameIndex`      | The last sync frame the entity was included in.                                                                                                                             |
| `timestamp`           | The last sync timestamp the server got from the entity's owner.                                                                                                             |
| `lastMigratedAt`      | The server clock reading of the last time the entity changed owner, or `0` if it never has.                                                                                 |
| `position`            | Where it is, as `[x, y, z]`.                                                                                                                                                |

{{% alert color="warning" title="id and netId are not the same number" %}}
This could be confusing, because on a freshly started server the first few entities might happen to have matching values. They drift apart quickly.

The state bag endpoints take `id`. Your scripts, on the other hand, deal in `netId`. If you are matching data from this endpoint against something a script told you, `netId` is the field you want.
{{% /alert %}}

### Fields that only turn up sometimes

The server leaves a field out entirely rather than sending it as `null`, `false` or `0`. So the set of keys differs from one entity to the next, and code that reads this needs to cope with a missing key rather than assume every object looks the same.

| Field                    | When you get it                                                                                                                                                                                    |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ownedByScript`          | Some script created the entity, meaning `scriptHash` is not `0`.                                                                                                                                   |
| `ownedByClientScript`    | A client side script created it.                                                                                                                                                                   |
| `ownedByServerScript`    | A server side script created it.                                                                                                                                                                   |
| `shouldServerKeepEntity` | The server has been told to hang on to this entity, either because a server script owns it or because its orphan mode is set to keep it. See {{% native_link "SET_ENTITY_ORPHAN_MODE" %}}.         |
| `creationToken`          | The entity was created by a server script. This is the value that separates a server created entity from a client created one, and it is stamped from the server clock, so it matches `createdAt`. |
| `stateBag`               | The entity has a state bag. The value is the bag's name, such as `entity:26`. Careful here, that number is the `netId`, not the `id`.                                                              |
| `deleting`               | The entity is on its way out and is being cleaned up. You will only catch this if you happen to ask at the right moment.                                                                           |
| `vehicleID`              | The entity is a ped or player sitting in a vehicle. The value is the vehicle's `netId`, not its `id`.                                                                                              |
| `vehicleSeat`            | Comes along with `vehicleID`. It is the raw seat number out of the sync data, where a driver shows up as `1`.                                                                                      |

A vehicle created by a server script, with a state bag set on it and its orphan mode set to keep, collects most of them at once. Compare this against the plain traffic vehicle further up to see the difference:

```json
{
  "id": 4,
  "netId": 26,
  "routingBucket": 0,
  "ownerClientID": 65535,
  "firstOwningClientID": 65535,
  "firstOwnerDropped": false,
  "type": 0,
  "uniquer": 40663,
  "scriptHash": 2032929404,
  "ownedByScript": true,
  "ownedByServerScript": true,
  "shouldServerKeepEntity": true,
  "relevant": false,
  "createdAt": 401568,
  "lastFrameIndex": 0,
  "timestamp": 0,
  "creationToken": 401568,
  "lastMigratedAt": 0,
  "stateBag": "entity:26",
  "position": [-1900.0, 2080.0, 150.0]
}
```

There is a fair bit to read out of that one. The `ownerClientID` of `65535` says no client owns it, which is normal for something the server made and no player has come near yet. `relevant` is `false` for the same reason, nobody needs to know about it. And `lastFrameIndex` and `timestamp` are both `0` because it has never actually been synchronised to anyone.

### Entity types

The `type` number comes from the game's own list of network object types. Be careful here, because FiveM and RedM could number them differently.

For FiveM:

| Type | Entity          |
| ---- | --------------- |
| `0`  | Automobile      |
| `1`  | Bike            |
| `2`  | Boat            |
| `3`  | Door            |
| `4`  | Heli            |
| `5`  | Object          |
| `6`  | Ped             |
| `7`  | Pickup          |
| `8`  | PickupPlacement |
| `9`  | Plane           |
| `10` | Submarine       |
| `11` | Player          |
| `12` | Trailer         |
| `13` | Train           |

## clients.json

One object per connected client, listing every entity that client currently owns.

```json
[{ "id": 1, "netIds": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }]
```

The `id` is the client's server id, the same number your scripts know as `source`. The `netIds` array holds the network ids of the entities it owns, which will include its own player ped along with any traffic and pedestrians nearby that the server handed to it.

That list is usually longer than you expect. A single player wandering around an empty map can easily own ninety entities, because somebody has to be responsible for all the ambient traffic in view.

## State bags

State bags are the arbitrary key and value data attached to entities and players, described over on the [state bags page](/docs/scripting-manual/networking/state-bags/). These two endpoints dump one bag as a JSON object.

```bash
curl -u user:pass http://localhost:30120/onesync/clients/1/stateBag.json
curl -u user:pass http://localhost:30120/onesync/entities/35/stateBag.json
```

```json
{ "playerTest": "123" }
```

The two behave slightly differently when there is nothing to show, which is worth knowing before you go debugging your own tool:

- A client with an empty bag answers `200` with `{}`.
- An entity with no bag at all answers `404`. Most entities are in this situation, since the game's own traffic never gets one. If an entity does have a bag, `entities.json` says so with the `stateBag` field.

{{% alert color="warning" title="The bag's name is not the number in the URL" %}}
This one is a bit confusing. An entity's state bag is named after its `netId`, but the endpoint that hands you the bag wants its `id`.

Take a server created vehicle with `id` 4 and `netId` 26. Its `stateBag` field reads `entity:26`, and yet:

```bash
curl -u user:pass http://localhost:30120/onesync/entities/4/stateBag.json   # {"docsTest":"hello"}
curl -u user:pass http://localhost:30120/onesync/entities/26/stateBag.json  # 404 Not Found.
```

So take the number from the `id` field and ignore the one in the bag's name.
{{% /alert %}}

## routingBuckets.json

A plain array of the routing bucket ids currently in use. A server that never touches buckets only ever reports the default one.

```json
[0]
```

## worldGrid.bmp

This is a picture rather than JSON. Each routing bucket has its own world grid, which is how the server decides which client is responsible for population in which part of the map. This endpoint draws that grid out as a bitmap.

```bash
curl -u user:pass -o worldGrid.bmp \
  http://localhost:30120/onesync/routingBuckets/0/worldGrid.bmp
```

Asking for a bucket that is not in use gives you a `404`.

### Reading the picture

What you get is an uncompressed 24 bit BMP, 512 by 512 pixels, which works out to roughly 768 KB every time you ask. Any image viewer will open it.

Underneath, the world is divided into a grid of 256 by 256 sectors, and each sector is drawn as a solid block of 2 by 2 pixels. So the picture is really a 256 by 256 grid at double size.

A sector covers 150 game units in each direction, and the grid starts at `-8192`. To work out which sector a position falls into:

```
sectorX = floor((x + 8192) / 150)
sectorY = floor((y + 8192) / 150)
```

The pixel column is `sectorX`, and the pixel row counted from the top of the image is `sectorY`. Because `sectorY` grows as the world's Y coordinate grows, and Y grows towards the north, the picture comes out upside down compared to the map you see in game. Flip it vertically if you want it to look familiar.

The colours are simple. Dark grey, `#202020`, means nobody owns that sector. Any other colour means a client does, and the colour is worked out from which client it is, so two players will not look the same. That is the whole point of the picture, since it lets you see at a glance how the map is carved up between everyone online.

As a sanity check on all of the above, a server with one player standing at `-1900.5, 2080.2` produced exactly 25 coloured blocks, sitting at sector X 39 through 43 and sector Y 66 through 70. That is the five by five patch of sectors around the player, which is what the server hands out, and it lines up with the formula above.

## time.json

The server's clock, in milliseconds.

```json
{ "serverTime": 9130283 }
```

This is not a date. It counts up from the moment the server started, so the value above means the server had been up for a little over two and a half hours.

It matters because `createdAt`, `timestamp` and `lastMigratedAt` over in `entities.json` are all on this same clock. Subtract one from the other and you get an age. An entity with `createdAt` of `9101805` was created about 28 seconds before the reading above.

## voicechannels.json

The odd one out in two ways. It is not under `/onesync/`, and it needs voice chat switched on before it has anything to say. You want `sv_voiceChat` enabled, plus either `voice_internal` or `voice_external_connect`, all of which are covered on the [voice page](/docs/scripting-manual/voice/). Without a voice server running there are simply no channels to list.

```json
[
  {
    "id": 0,
    "mode": 1,
    "maxDistance": 512.0,
    "clients": [{ "clientID": 1, "state": 1 }]
  }
]
```

One object per voice channel. The fields line up exactly with `CreateVoiceChannel(mode, maxDistance)` from the server side voice API, so this endpoint is really a live view of the channels your scripts have created.

| Field         | Meaning                                                                          |
| ------------- | -------------------------------------------------------------------------------- |
| `id`          | The channel id, the number `CreateVoiceChannel` handed back. These start at `0`. |
| `mode`        | How the channel carries voice. See the table below.                              |
| `maxDistance` | For a spatial channel, how far away someone can still be heard, in game units.   |
| `clients`     | Who is currently in the channel.                                                 |

The `mode` values are the same ones you pass when creating a channel:

| Mode | Name        | What it does                                                                                |
| ---- | ----------- | ------------------------------------------------------------------------------------------- |
| `0`  | Non-spatial | Flat 2D voice. Everyone in the channel hears everyone else, no matter where they are.       |
| `1`  | Spatial     | 3D voice. You hear people within `maxDistance` of you, positioned around you.               |
| `2`  | Custom      | Neither of the above. The channel does nothing on its own and expects a script to drive it. |
| `3`  | Temporary   | Behaves like spatial, but the server throws the channel away once the last person leaves.   |

### Client state

Each entry under `clients` has a `clientID`, which is the client's server id, the same number your scripts call `source`. Alongside it is `state`, and that one needs unpacking, because it is a bitmask rather than a plain number. In other words, each bit is its own yes or no answer, and the number you see is all of them added together.

| Bit | Value | Meaning                                                     |
| --- | ----- | ----------------------------------------------------------- |
| 0   | `1`   | The client is in the channel. Always set for anyone listed. |
| 1   | `2`   | The client is muted, so they can hear but cannot speak.     |
| 2   | `4`   | The client is deaf, so they can speak but cannot hear.      |

Add them up to read a value:

| `state` | What it means                                   |
| ------- | ----------------------------------------------- |
| `1`     | In the channel, talking and listening normally. |
| `3`     | In the channel, muted.                          |
| `5`     | In the channel, deaf.                           |
| `7`     | In the channel, both muted and deaf.            |

Those are the four values you can actually produce with `SetPlayerMutedInVoiceChannel` and `SetPlayerDeafInVoiceChannel`, and stepping a client through all four combinations gives exactly `1`, `3`, `5` and `7` in that order.

A channel with nobody in it reports an empty `clients` array rather than disappearing, unless it is a temporary channel, which the server deletes outright.

## Examples

All three of these do the same thing, so you can compare them. They fetch every entity and print a count per type.

### curl

Just fetching the raw JSON:

```bash
curl -u user:pass http://localhost:30120/onesync/entities.json
```

If you have [jq](https://jqlang.github.io/jq/) around, you can get the same summary in one line:

```bash
curl -s -u user:pass http://localhost:30120/onesync/entities.json \
  | jq 'group_by(.type) | map({type: .[0].type, count: length})'
```

### Node

No dependencies, this uses the `fetch` that is built into Node 18 and up.

```js
const base = "http://localhost:30120";
const auth = "Basic " + Buffer.from("user:pass").toString("base64");

const TYPES = [
  "Automobile",
  "Bike",
  "Boat",
  "Door",
  "Heli",
  "Object",
  "Ped",
  "Pickup",
  "PickupPlacement",
  "Plane",
  "Submarine",
  "Player",
  "Trailer",
  "Train",
];

async function get(path) {
  const res = await fetch(base + path, {
    headers: { Authorization: auth, "Cache-Control": "no-cache" },
  });

  if (!res.ok) {
    throw new Error(`${path} returned ${res.status}`);
  }

  return res.json();
}

const entities = await get("/onesync/entities.json");
const counts = new Map();

for (const entity of entities) {
  counts.set(entity.type, (counts.get(entity.type) ?? 0) + 1);
}

console.log(`${entities.length} entities`);

for (const [type, count] of [...counts].sort((a, b) => b[1] - a[1])) {
  console.log(`  ${TYPES[type] ?? `type ${type}`}: ${count}`);
}
```

### Python

Nothing to install, `urllib` comes with Python.

```python
import base64
import json
import urllib.request
from collections import Counter

BASE = "http://localhost:30120"
AUTH = base64.b64encode(b"user:pass").decode()

TYPES = ["Automobile", "Bike", "Boat", "Door", "Heli", "Object", "Ped",
         "Pickup", "PickupPlacement", "Plane", "Submarine", "Player", "Trailer", "Train"]


def get(path):
    request = urllib.request.Request(BASE + path, headers={
        "Authorization": "Basic " + AUTH,
        "Cache-Control": "no-cache",
    })

    with urllib.request.urlopen(request) as response:
        return json.load(response)


entities = get("/onesync/entities.json")
counts = Counter(entity["type"] for entity in entities)

print(f"{len(entities)} entities")

for entity_type, count in counts.most_common():
    name = TYPES[entity_type] if entity_type < len(TYPES) else f"type {entity_type}"
    print(f"  {name}: {count}")
```

Running any of them against a quiet server looks about like this:

```
71 entities
  Ped: 42
  Automobile: 27
  Player: 1
  Bike: 1
```

## A ready made browser

If you would rather look at all of this in a browser than read raw JSON, there is a small example tool at [OneSyncBrowser](https://github.com/TomGrobbe/OneSyncBrowser). It fetches these endpoints for you and lays them out as tables and cards, with the entity list searchable and sortable, one card per connected client, and the world grid drawn as a picture you can zoom into.

## See also

- [OneSync](/docs/scripting-reference/onesync/), for what routing buckets, culling and scopes actually are.
- [State bags](/docs/scripting-manual/networking/state-bags/), for the data behind the two state bag endpoints.
- [Voice](/docs/scripting-manual/voice/), for the voice API behind `/voicechannels.json`, including how to switch voice chat on and what the channel modes mean.
- [Server commands](/docs/server-manual/server-commands/), for the convars and everything else you can set in `server.cfg`.
- [OneSyncBrowser](https://github.com/TomGrobbe/OneSyncBrowser), a small example tool that browses these endpoints for you.
