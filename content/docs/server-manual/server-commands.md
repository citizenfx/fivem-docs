---
title: Server Commands
weight: 50
description: >
  A list of commands to run in the server console.
---

Console commands can be executed either using an RCon tool, directly from the server console interface, a server configuration
file, the server command line, or (if a resource is permitted by the ACL) the {{% native_link "EXECUTE_COMMAND" %}} function.

Adding a custom RCon command can be done using the {{% native_link "REGISTER_COMMAND" %}} function on the
server, or the (legacy) `rconCommand` event.

## Resource commands

### `start [resourceName]`

Starts the resource specified in the argument, if it was stopped. It is also possible to specify a category name, such as `start [cars]`.

Example:

    start lambda-menu
    start [cars]

### `stop [resourceName]`

Stops the resource specified in the argument, if it was started. As with `start`, you can also specify a category name.

Example:

    stop mymode

### `ensure [resourceName]`

Restarts the resource specified in the argument, if it was started. If it wasn't, starts the resource specified in the argument.

As with `start` and `stop`, you can also specify a category name.

Example:

    ensure my-testing-resource

### `restart [resourceName]`

Restarts the resource specified in the argument, if it was started. Also supports category names.

Example:

    restart lambda-menu

### `refresh`

Rescans the *resources* folder and loads all resource manifests in them, also making new resources available to start using [start](#start-resourcename).

Example:

    refresh

## Global commands

### `exec [filename]`

Runs the commands specified in the filename, relative to the server data directory, or any resource name specified with `@`.

Commonly seen as `FXServer.exe +exec server.cfg`.

Example:

    exec server_nested.cfg
    exec @vMenu/config/permissions.cfg

### `quit`

Exits the server, sending a default quit message to all connected players.

### `quit [reason]`

Exits the server, also sending the specified reason to all connected players.

Example:

    quit "Restarting - will be back soon!"

## Management commands

### `status`

{{% alert color="info" %}}This is provided by the **rconlog** resource. {{% /alert %}}

Shows a list of players with their primary identifier, server ID, name, endpoint, and ping.

Example:

    status

### `clientkick [id] [reason]`

{{% alert color="info" %}}This is provided by the **rconlog** resource. {{% /alert %}}

Kicks the client with the specified server ID (as seen in [status](#status)) from the server, for the stated reason.

Example:

    clientkick 43 You're a superstitious idiot!

### `say [message]`

{{% alert color="info" %}}This is provided by the **chat** resource. {{% /alert %}}

Sends a message in the chat as *console*.

Example:

    say Hi, everybody!

### `svgui`

Opens or closes the server debug GUI.

## Configuration variables

### `gamename [game]`

Defines the game to run the server for.

Example:

    FXServer.exe +set gamename rdr3

#### Supported games

| Name |   Marketing name    |
| ---- | ------------------- |
| gta5 | FiveM for GTA:Five  |
| rdr3 | RedM for RDR3       |

### `onesync [on/off/legacy]`

Defines which mode of state awareness to use.

* **Off**: No state awareness at all, clients will use the standard GTA/RAGE P2P networking model, and the server will only function as a relay.
* **On**: Full state awareness and server-determined entity routing.
* **Legacy**: Compatibility mode for scripts that expect all players to exist on each client. Not recommended due to performance issues and graphical glitches.

### `onesync_enableInfinity [true|false]`

A boolean variable (default `true`) that enables the Infinity system for large-scale entity synchronization. Required for large player counts. Can only be set at startup.

### `onesync_population [true|false]`

A boolean variable (default `true`) that enables population spawning and management. Required for NPCs to spawn.

### `onesync_forceMigration [true|false]`

A boolean variable (default `true`) that forces entity migration when the current owner becomes irrelevant or disconnects. Disabling may improve performance but can leave entities without an owner.

### `onesync_distanceCulling [true|false]`

A boolean variable (default `true`) that removes entities from sync if they are beyond a certain distance and outside the view matrix. Improves performance.

### `onesync_distanceCullVehicles [true|false]`

A boolean variable (default `false`) that applies distance and view-matrix culling to vehicles, similar to other entities. Can improve performance by reducing vehicle sync frequency.

### `onesync_radiusFrequency [true|false]`

A boolean variable (default `true`) that adjusts entity state update frequency based on distance. Closer entities update more frequently. Disabling may improve performance at the cost of distant entity accuracy.

### `sv_useAccurateSends [true|false]`

A boolean variable (default `true`) that sends entity state updates based on actual relevance and distance. Disabling may improve performance but reduces sync accuracy.

### `sv_entityLockdown [mode]`

A string variable (default `inactive`) controlling how strict the server is about client-created entities.

| Mode | Description |
| ---- | ----------- |
| `full` | Disables dummy object creation. Only usable on FiveM for GTAV Enhanced. |
| `strict` | No entities can be created by clients. |
| `relaxed` | Only script-owned entities created by clients are blocked. |
| `inactive` | Clients can create any entity. |

### `sv_enforceGameBuild [build]`

Selects a game build for clients to use. This can only be specified at startup, and can not be changed at runtime.

Example:

    sv_enforceGameBuild h4
    sv_enforceGameBuild mptuner
    sv_enforceGameBuild 3407

Every build includes all content and changes from the builds before.

**FiveM builds**

| Number |               Aliases                |       Marketing name        |
| ------ | ------------------------------------ | --------------------------- |
| 1      |                                      | Base game without any DLCs  |
| 1604   | xm18, christmas2018, mpchristmas2018 | Arena War                   |
| -      | -                                    | The Diamond Casino & Resort |
| -      | -                                    | Diamond Casino Heist        |
| 2060   | sum, mpsum                           | Los Santos Summer Special   |
| 2189   | h4, heist4, mpheist4                 | Cayo Perico Heist           |
| 2372   | tuner, mptuner                       | Los Santos Tuners           |
| 2545   | security, mpsecurity                 | The Contract                |
| 2612   | mpg9ec                               | -                           |
| 2699   | mpsum2                               | The Criminal Enterprises    |
| 2802   | mpchristmas3                         | Los Santos Drug Wars        |
| 2944   | mp2023_01                            | San Andreas Mercenaries     |
| 3095   | mp2023_02                            | The Chop Shop               |
| 3258   | mp2024_01                            | Bottom Dollar Bounties      |
| 3407   | mp2024_02                            | Agents of Sabotage          |
| 3570   | mp2025_01                            | Money Fronts                |
| 3751   | mp2025_02                            | A Safehouse in the Hills    |

**RedM builds**

| Number |                               Notes                               |
| ------ | --------------------------------------------------------------
| 1491   | September 2022 update, limited content/changes.                   |

### `sv_replaceExeToSwitchBuilds [newValue]`

An experimental flag that determines how the client will run older game builds when requested with `sv_enforceGameBuild`. Either true or false.

- true: the default value for builds below 12872. This will keep the original client behavior, the client will download all the files for the specific game build and run old game build executable.
- false: the default value for server builds above 12871. The client will run executable for the latest stable game build, regardless of which game build is enforced. Instead the client will only load the specific DLCs related to the game build specified in `sv_enforceGameBuild`. From the user perspective the game will look the same way as under `sv_replaceExeToSwitchBuilds = true`.

    When using `set sv_enforceGameBuild 1` the client will run as if `sv_replaceExeToSwitchBuilds = false` regardless of whether it was set to `true` before. That's the only way how base game without DLCs behavior can be achieved.

NOTE: The difference in `sv_replaceExeToSwitchBuilds` should be **invisible** to players and server owners. If you notice a disparity please [report it as a bug](https://github.com/citizenfx/fivem/issues/new?assignees=&labels=bug%2Ctriage&projects=&template=bug_report.yml).

**Context**

The `sv_replaceExeToSwitchBuilds` is intended to eliminate the need in supporting executables for older game builds. It will speed up the development and improve stability of the game in long term.

At some point the default value will be changed to `false` and, eventually, `false` will be left as the only option. We will only do that after we are certain that it doesn't affect the users.

### `sv_maxClients [newValue]`

A variable that specifies the maximum amount of clients that the server can normally have, as an integer from 1 to 2048.

Values starting at 32 will require `onesync` to be set to `on` or `legacy`, and values above 64 will require `onesync` to be set to `on`.

### `sv_endpointPrivacy [newValue]`

A boolean variable that, if true, hides player IP addresses from public reports output by the server.

### `gametype [type]`

A string variable that sets the game type of the server, displayed in the server browser.

### `mapname [name]`

A string variable that sets the map name of the server, displayed in the server browser.

### `sv_lan [true|false]`

A boolean variable (default `false`). When set to `true`, makes the server LAN-only. It will not appear in the public server list and license key checks are skipped.

### `sv_licenseKey [key]`

A string variable that sets the license key for this server. Get one at [portal.cfx.re](https://portal.cfx.re/login).

### `sv_scriptHookAllowed [true|false]`

A boolean variable (default `false`). Set to `true` to allow clients with Script Hook V to connect.

{{% alert color="warning" %}}
Not recommended — makes the server vulnerable to security issues.
{{% /alert %}}

### `sv_endpoints [endpoints]`

A string variable containing a space-separated list of IP addresses clients can use to connect via UDP. When multiple are specified, the client selects randomly. If empty, the auto-detected public IP is used.

### `sv_tcpConnectionTimeoutSeconds [seconds]`

An integer variable (default `5`) that defines the time in seconds a TCP connection can be idle before it is closed.

### `sv_proxyIPRanges [ranges]`

A string variable (default `10.0.0.0/8 127.0.0.0/8 192.168.0.0/16 172.16.0.0/12`) containing a space-separated list of IP ranges in CIDR notation considered to be proxy servers.

### `sv_enableNetEventReassembly [true|false]`

A boolean variable (default `true`) that enables reassembly of large network events split into multiple packets.

### `sv_netEventReassemblyMaxPendingEvents [count]`

An integer variable (default `100`) defining the maximum pending reassembled network events per client (0–254). Increase to allow more concurrent large events, or decrease to limit memory usage.

### `sv_netEventReassemblyUnlimitedPendingEvents [true|false]`

A boolean variable (default `false`). Set to `true` to allow unlimited pending reassembled events per client. Overrides `sv_netEventReassemblyMaxPendingEvents`.

### `sv_forceIndirectListing [true|false]`

A boolean variable (default `false`) that prevents the server from being advertised using its real IP address. Uses proxy or override settings instead.

### `sv_listingIpOverride [ip]`

A string variable that overrides the IP address sent to the master server. Useful behind a NAT or proxy.

### `sv_listingHostOverride [host]`

A string variable that overrides the hostname sent to the master server. Useful behind a proxy that changes the hostname.

### `sv_registerMulticastDns [true|false]`

A boolean variable (default `true`) that registers the server via mDNS for LAN discovery.

### `sets sv_projectName "project name"`

A string variable containing the name of your 'project', which would for example be the server's community. This should
be a name, not a list, nor should it contain tags.

Any non-compliant name will be cut off in the server list. <!-- Use our tool to check your name. -->

Example:

```bash
sets sv_projectName "Citizen Gaming"
```

### `sets sv_projectDesc "project description"`

A string variable containing the description of your project. This should be written as a sentence.

Example:

```bash
sets sv_projectDesc "My amazing community!"
```

### `sv_hostname [newValue]`

A string variable that contains the server-specific host name. In addition to this, you may want to set `sv_projectName`
and `sv_projectDesc`.

### `sv_master1 [newValue]`

A string variable that can be used to set the server as "private", making it not possible to join by using the server browser UI (the server connect button will be disabled). In the past, this specific string variable dictated where heartbeats were sent and servers weren't listed if the address didn't point to FiveM's ingress address, this is no longer the case, the server will always post to the default server ingress on startup. In other words, this string variable **cannot be used to de-list a server from the master list.**

Example:

```toml
sv_master1 ""
```

### `sets sv_appearAllowlisted [true|false]`

A boolean variable that, when set to true, makes the server appear allowlisted in the server browser, showing a lock icon.

### `sets sv_allowlistInstructions [newValue]`

A string variable that contains instructions for players on how to get allowlisted on the server. This is shown in the server browser when the server is set to appear allowlisted.
For this to work, `sv_appearAllowlisted` needs to be set to `true`.

### `sv_authMaxVariance [newValue]`

**Variance** is how likely the user's id will change for a given provider (i.e. 'steam', 'ip', or 'license').

A console variable as an integer from 1-5 (default 5); from least to most likely to change.

### `sv_authMinTrust [newValue]`

**Trust** is how _unlikely_ it is for the user's identity to be spoofed by a malicious client.

A console variable as an integer from 1-5 (default 1); from least to most trustworthy (5 being a method such as external three-way authentication).

### `sv_requestParanoia [newValue]`

This helps counter proxy-based HTTP floods.
Levels:

  - 0: Off. Default behavior.
  - 1: Block any IPs sending requests containing a 'Via' header.
  - 2: Block any IPs sending requests containing a 'Upgrade-Insecure-Requests' header. This includes all browser-based attempts at requesting .json endpoints, so use          with care.
  - 3: Also close the socket the requests have been submitted on.

If set to level 2 greater, all requests made to [info.json](https://github.com/citizenfx/fivem/blob/65bf224097b1107c10f84f5dfc25ee8e4bddc95d/code/components/citizen-server-impl/src/InfoHttpHandler.cpp#L276), [dynamic.json](https://github.com/citizenfx/fivem/blob/65bf224097b1107c10f84f5dfc25ee8e4bddc95d/code/components/citizen-server-impl/src/InfoHttpHandler.cpp#L317) and [players.json](https://github.com/citizenfx/fivem/blob/65bf224097b1107c10f84f5dfc25ee8e4bddc95d/code/components/citizen-server-impl/src/InfoHttpHandler.cpp#L331) related endpoints will return "Nope."

A console variable as an integer from 0-3 (default 0);

### `sv_filterRequestControl [mode]`

A console variable used to block `REQUEST_CONTROL_EVENT` routing based on a configurable policy.<br>
Supported modes for this variable are as follows:

- -1: Equivalent to 2 at this time, but will also warn in console.
- 0: Off (Default). Also disables the routing bucket/entity lockdown-based policy.
- 1: Blocks control requests to entities controlled by players (currently, occupied vehicles only) that have existed for more than `sv_filterRequestControlSettleTimer` milliseconds (default `30000`) - hereafter referred to as 'settled'.
- 2: Blocks control requests to all entities controlled by players.
- 3: Blocks control requests to all entities controlled by players, and any 'settled' non-player entities.
- 4: Does not route `REQUEST_CONTROL_EVENT` whatsoever.

In addition, any mode but 'off' will have some additional checks as well:

- Control request events can't be routed across routing buckets.
- Control request events will always be blocked if the sender is in 'strict' entity lockdown mode, either by the global mode setting, or their routing bucket being set to such.

### `con_channelFilters`

The `con_channelFilters` command will list any active channel filters set to the end user.

A channel is the prefix of a console message, for example: `citizen-server-impl`, this channel will be displayed in brackets in the console followed by a message, i.e.

```
[citizen-server-impl] Found 44 resources.
```

Filters can be used to alter console output behavior.

Different actions exist to alter this behavior:

| Action  | Description |
| ------  | ---------------------------------------------------------- |
| noprint | Will stop anything from being printed at the trace listener level. |
| drop    | Will cause the output to be dropped at `Printfv`, so it won't reach any print listeners. |
| devonly | Will apply `drop` action behavior and will only drop the output if the [developer](/docs/client-manual/console-commands/#developer) command is set to `false`. |

Example output:
```
[cmd] forward:*/*: noprint
```

### `con_addChannelFilter [filter] [action]`

The `con_addChannelFilter` command will add a channel filter which can be used to filter console channel output.

[Regex](https://en.wikipedia.org/wiki/Regular_expression) can be used for channel filters, this can be set through the `filter` command parameter.

Available actions are explained up [above](#con_channelFilters) (con_channelFilters command).

The example down below would stop any channel output coming from script names matching the given pattern.

So the following wouldn't show on the console:

```
[script:gamemodePrefix-turfs]: Hello world!
[script:gamemodePrefix-derby]: This is a test.
```

Example: `con_addChannelFilter script:gamemodePrefix-* noprint`

### `con_removeChannelFilter [filter] [action]`

The `con_removeChannelFilter` command can be used to remove a channel filter, thus removing any previously applied actions (those applied via [con_addChannelFilter](#con_addChannelFilter)).

You can use [con_channelFilters](#con_channelFilters) to check for any active filters.

Example: `con_removeChannelFilter script:gamemodePrefix-* noprint`

### `sv_filterRequestControlSettleTimer [time]`

A console variable (default `30000` milliseconds) that allows you to set after how long (based on entity creation time in milliseconds) an entity should be blocked from a `REQUEST_CONTROL_EVENT`. This will only apply to filter request control modes [1 and 3](#svfilterrequestcontrol-mode), which are detailed under `sv_filterRequestControl` in this page.<br>

{{% alert color="warning" %}}
The **time** argument must be provided in milliseconds for this to work correctly.
{{% /alert %}}

### `sv_pureLevel [level]`

A console variable used to prevent users from using modified client files. There currently are two pure mode levels (1 and 2), an explanation for these levels can be found below:

- 1: Will block all modified client files except audio files and known graphics mods.
- 2: Will block all modified client files.

If modified files are installed in the FiveM folder, they will be ignored - if users however modified base game files, they will receive an error message telling them what file is modified.

### `sv_enableNetworkedSounds [true|false]`

A boolean console variable that can be used to prevent users from routing `NETWORK_PLAY_SOUND_EVENT` through the server, which is commonly used by malicious actors.

This is set to true by default (allow routing)

### `sv_enableNetworkedPhoneExplosions [true|false]`

A boolean console variable introduced in server version 6831, that is disabled (set to `false`) by default.  

Enabling it (by setting it to `true`), will allow users to route `REQUEST_PHONE_EXPLOSION_EVENT` through the server. The main drawback behind enabling this, is that it can also be used by malicious actors.

### `sv_enableNetworkedScriptEntityStates [true|false]`

A boolean console variable introduced in server version 8540 that can be used to prevent users from routing `SCRIPT_ENTITY_STATE_CHANGE_EVENT` through the server, which is commonly used by malicious actors.

This is set to true by default (allow routing)

### `sv_experimentalStateBagsHandler [true|false]`

A boolean console variable introduced in server version 8510 that uses the new serialization API to improve the speed of packing/unpacking state bag changes.

This is set to true by default

### `sv_experimentalOnesyncPopulation [true|false]`

A boolean console variable introduced in server version 8823 that fixes an oversight in older server versions that incorrectly limited the amount of entity ids to `8192` instead of the proper `65535` when both `set onesync on` and `set onesync_population false`.

This convar does not affect whether population spawns on the server, you still need to use the `onesync_population` convar for this.

NOTE: Using this convar also opts you into using `sv_experimentalStateBagsHandler`

This is set to true by default

### `sv_experimentalNetGameEventHandler [true|false]`

A boolean console variable introduced in server version 9149 that uses the new serialization API to improve the speed of packing/unpacking GTA game events. It adds checks to ensure that entities sent with the game events are relevant to the target client, and also improves backward compatibility with future title updates.

NOTE: Using this convar also opts you into using `sv_experimentalStateBagsHandler` and `sv_experimentalOneSyncPopulation`

This is set to true by default.

### `sv_httpFileServerProxyOnly [true|false]`

A boolean console variable introduced in server version 10543 that restricts access to the file server based on IP address ranges. When enabled, only requests from IP addresses within the ranges specified by `sv_proxyIPRanges` will be allowed to access the file server.

This is particularly useful when using custom proxy servers with `fileserver_add` to ensure clients only access files through the designated proxy.

This is set to false by default.

### `setr sv_stateBagStrictMode [true|false]`

A console variable, introduced in server version 12739, used to enable or disable client-side modification of state bags by the network owner of a replicated entity.

- false (Default): The network owner can modify the state of entities they own and the player state.
- true: Only the server can modify the state of networked entities and the player state.

Client-side (non-replicated) entities are not affected by this variable. If a client-side script attempts to modify a state bag on a replicated entity in strict mode, the following error will be displayed in the client console `StateBags can't be modified from the client, because the StateBag strict mode is enabled. Disable it using setr sv_stateBagStrictMode false`.

### `load_server_icon [fileName.png]`

A console command which loads a specified icon and sets it as the server icon. The icon needs to be a 96x96 PNG file.

Example:

```toml
load_server_icon "my-server.png"
```

### `rcon_password [password]`

Sets the RCon password, if unset then RCon will be disabled. FXServer RCon uses UDP.

### `steam_webApiKey [key]`

Sets a [Steam Web API key](https://steamcommunity.com/dev/apikey), which is required to allow for Steam identifiers to be returned by the server.

### `steam_webApiDomain [domain]`

A string variable (default `api.steampowered.com`) defining the domain registered with the Steam Web API key. Change if `api.steampowered.com` is not reachable.

### `sv_prometheusBasicAuthUser [user]`

A string variable that sets the username for Prometheus basic auth on the `/perf` endpoint. Leave empty to disable. Also sent to txAdmin.

### `sv_prometheusBasicAuthPassword [password]`

A string variable that sets the password for Prometheus basic auth on the `/perf` endpoint. Leave empty to disable. Also sent to txAdmin.

### `sv_kvsName [name]`

A string variable (default `default`) defining the name of the KVP database file, stored in the `serverdata:/` folder. Can only be set at startup.

### `increase_pool_size [poolName] [increase]`

Increases size of the given pool. May be used more than once to increase size of multiple pools.

- `poolName` - a string indicating which pool should be increased in size.
- `increase` - positive integer indicating by how much the pool size should be increased.

Example:
```
increase_pool_size "TxdStore" 6000
increase_pool_size "CMoveObject" 15
```

This can only be specified at startup, and cannot be changed at runtime. To join servers with different pools sizes client would have to restart the game - similarly to how it works with `sv_enforceGameBuild` and `sv_pureLevel`. If the client connects to the servers with the same pool size settings - restart will only happen during the first connection.

Pool size increase requests are validated on the server and client side. On the server side, if the pool is not allowed to be resized or the size increase exceeds the allowed limit - the command will have no effect and warning message will be displayed in the logs. On the client side - the client will not be able to connect to a server that requests invalid pool sizes (this should only happen if the server bypassed the server side check somehow).

Set of allowed pools and the maximum size increase per pool are set in `content.cfx.re`. Both server and client fetch the limits on startup for updates. The currently allowed pools and limits are the following (this documentation may be slightly behind the actual state, if not sure - try to set the increase and see if it works):

| Pool name  | FiveM max increase | RedM max increase |
| ---------- | ------------------ | ----------------- |
| AnimStore | 20480 | - |
| AttachmentExtension | 430 | 430 |
| Building | 20000 | - |
| CAvoidanceComponent | - | 1300 |
| CDoorExtension (also known as MaxDoorExtensions) | - | 160 |
| CLightEntity | - | 2000 |
| CMoveObject | 600 | 100 |
| CompEntity | - | 50 |
| CPropSetObjectExtension | - | 950 |
| CWeaponComponentInfo | 2048 | - |
| DrawableStore | - | 50000 |
| EntityDescPool | 20480 | - |
| fragInstGta | 2000 | - |
| FragmentStore | 14000 | 4000 |
| GrassBatch | - | 2000 |
| InteriorProxy | 450 | 450 |
| LightEntity | 1000 | - |
| netGameEvent | 400 | 400 |
| Object | 2000 | 2000 |
| ObjectIntelligence | 512 | - |
| OcclusionInteriorInfo | 20 | 10 |
| OcclusionPathNode | 5000 | 1500 |
| OcclusionPortalEntity | 750 | 140 |
| OcclusionPortalInfo | 750 | 140 |
| PortalInst | 225 | 150 |
| ScaleformStore | 200 | 100 |
| StaticBounds | 5000 | 6500 |
| TxdStore | 26000 | 26000 |
| CNetObjDoor | - | 20 |
| CDoorSyncData | - | 20 |

You can explore most of the current pools and their sizes using  `F8 > Tools > Streaming > Pool Monitor` tool.

#### Local experiments

It is possible to bypass the pool size limitations for development purposes. In this case the pool size validation will be skipped. In order to do so you need to set `moo` [convar](/docs/scripting-reference/convars/#standard-convars) to `31337` independently on server and client side:

- Add `set moo 31337` to your server config.
- Add the `+set moo 31337` flag when running your client. Similarly to how it's done to turn on [the developer mode](/docs/client-manual/console-commands/#developer-commands).

{{% alert color="warning" %}}
This is for development and debugging purposes only. Never use it to bypass limitations for your production environment. If you set pool sizes outside of supported limits - you are on your own. If you believe that the limits should be adjusted - reach out to the Cfx team by opening a GitHub issue requesting the limit increased with a reason why.
{{% /alert %}}

### sv_tebexSecret

The sv_tebexSecret is a unique secret key that is used to authenticate your FiveM server with the Tebex platform.

Example:

```
sv_tebexSecret c4f1300bda0ab123976449d27c160185bc31e175
```


## Access control commands

### `add_ace [principal] [object] [allow|deny]`

Adds an access control entry to the server's access control list.

Example:

```
add_ace group.admin command.potato allow
add_ace identifier.steam:110000112345678 command.apple deny
```

### `add_principal [child_principal] [parent_principal]`

Sets a principal to inherit from another principal.

Example:
```toml
# makes identifier.steam:110000112345678 inherit from group.admin
add_principal identifier.steam:110000112345678 group.admin
```

### `remove_ace [principal] [object] [allow|deny]`

Removes a specified ACE from the server's access control list.

Example:

```
remove_ace identifier.steam:110000112345678 command.apple deny
```

### `remove_principal [child_principal] [parent_principal]`

Removes a specified principal inheritance entry.

Example:
```
remove_principal identifier.steam:110000112345678 group.admin
```

### `test_ace [principal] [object]`

Tests if a principal is allowed or denied access to a given object.

Example: `test_ace group.admin command.adminstuff`

### `endpoint_add_udp [endpoint]`

Creates a UDP host instance, the address and port both need to be valid and not already in use in order to bind the provided endpoint.

Example:
```
endpoint_add_udp "0.0.0.0:30120"
```

A real use-case example of this can be found in the [default server.cfg example][servercfg].

### `endpoint_add_tcp [endpoint]`

Adds and binds the provided endpoint. This will create a multiplexable TCP server instance and bind it, the new instance will then be added to the multiplex server instance list. If a primary port isn't set (see [`netPort`](#netport-port)), the one sent by the command parameter will be used.

Example:
```
endpoint_add_tcp "0.0.0.0:30120"
```

A real use-case example of this can be found in the [default server.cfg example][servercfg].

### `netPort [port]`

The primary port, this is initialized to zero by `TcpListenManager's` default class constructor method. Used by nucleus and heartbeat methods for master list authoring.

This port may also be used when registering DNS (if `sv_registerMulticastDns` isn't set to `false`) on server startup. A Windows API method named [DnsServiceConstructInstance](https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsserviceconstructinstance) will be invoked by the server's internals (Windows Only [pre-processor macro](https://github.com/citizenfx/fivem/blob/01fb9af858badef688f93a1584fc41485c3e0e05/code/components/citizen-server-net/src/TcpListenManager.cpp#L176) compiled code, meaning this will only execute on Windows builds).

Example:
```
netPort 30120
```

### `net_tcpConnLimit [limit]`

Can be used to tune the concurrent connection limit per IP, its default value is `16`.

Example:
```
net_tcpConnLimit 32
```

### `block_net_game_event [eventName]`

Adds the hash of a net game event to the list blocked by the server.

This is used to prevent exploits, for example `BLOCK_WEAPON_SELECTION` is an event used by the game when invoking {{% native_link "SET_CURRENT_PED_VEHICLE_WEAPON" %}} native,
if you are not using this native, you could block the event to prevent cheaters from blocking the selection of weapon in vehicles.

A list of events can be found [here](/docs/game-references/net-game-events/)

Example:
```
block_net_game_event "FIRE_EVENT"
```

### `unblock_net_game_event [eventName]`

Do the opposite of block_net_game_event, unblocking a net game event.

NOTE: This doesn't unblock net game events blocked by other means like convars.

Example:
```
unblock_net_game_event "FIRE_EVENT"
```

## Console commands exclusive to FiveM for GTAV Enhanced

{{% alert theme="primary" %}}
The following variables are only available in **FiveM for GTAV Enhanced**.
{{% /alert %}}

### Networking

#### `sv_ioThreads [count]`

An integer variable (default `0`) specifying the number of IO threads for network operations. Defaults to CPU core count, capped between 2 and 4. Can only be set at startup.

#### `sv_clientConnectingTimeoutMilliseconds [ms]`

An integer variable (default `60000`) that defines the time in milliseconds a client has to finish connecting before it is dropped.

#### `sv_clientConnectedTimeoutMilliseconds [ms]`

An integer variable (default `120000`) that defines the time in milliseconds a connected client can stop sending packets before it is dropped.

#### `sv_pingIntervalMilliseconds [ms]`

An integer variable (default `5000`) that defines how often (in milliseconds) the client sends a ping to keep the connection alive. Lower values detect lost connections faster but increase bandwidth.

### Voice

#### `sv_voiceChat [true|false]`

A boolean variable (default `false`) that controls whether voice chat is enabled on the server.

#### `sv_mumble [true|false]`

A boolean variable (default `false`) that enables the legacy Mumble compatibility API.

{{% alert color="warning" %}}
**Deprecated** — less secure than the new server Voice API. See the [Voice Server](/docs/scripting-manual/voice/) documentation.
{{% /alert %}}

### OneSync

#### `onesync_migrateDataTimeout [ms]`

An integer variable (default `10000`) that defines the time in milliseconds before an entity is forcefully migrated if its owner stops sending sync updates.

#### `onesync_compressionDictionarySamples [true|false]`

A boolean variable (default `false`) that enables generating sample data for the compression dictionary. Internal usage only.

#### `onesync_mapBoundsMinX [value]`

An integer variable (default `-10000`) defining the minimum X coordinate of the map bounds. Can only be set at startup.

#### `onesync_mapBoundsMinY [value]`

An integer variable (default `-10000`) defining the minimum Y coordinate of the map bounds. Can only be set at startup.

#### `onesync_mapBoundsMaxX [value]`

An integer variable (default `65536`) defining the maximum X coordinate of the map bounds. Can only be set at startup.

#### `onesync_mapBoundsMaxY [value]`

An integer variable (default `65536`) defining the maximum Y coordinate of the map bounds. Can only be set at startup.

#### `onesync_mapCellAreaSize [size]`

An integer variable (default `100`) defining the size of each cell in the world grid. Smaller values use more RAM but less CPU. Best value depends on average entity range; `100` is usually optimal. Can only be set at startup.

### Development & game build

#### `sv_devMode [true|false]`

A boolean variable (default `false`) that enables development mode. Automatically enables dev mode for joining clients and limits max clients to 8.

{{% alert color="warning" %}}
**Do not enable in production.**
{{% /alert %}}

### Rate limiters

Rate limiters use a token bucket algorithm. Each limiter has a **rate** (tokens replenished per second) and a **burst** (maximum token count). A request consumes one token; if the bucket is empty, the request is rate-limited.
Buckets are considered empty if no tokens are available.

| Limiter | Rate (tokens/s) | Burst (max tokens) |
| ------- | --------------- | ------------------ |
| `challenge` | 4 | 10 |
| `handshake` | 4 | 10 |
| `handshakeUDP` | 1 | 5 |
| `http_dynamic` | 4 | 10 |
| `http_info` | 4 | 10 |
| `http_perf` | 2 | 5 |
| `http_players` | 4 | 10 |
| `netCommand` | 7 | 14 |
| `netCommandFlood` | 25 | 45 |
| `netCommandSize` | 1024 | 8192 |
| `netEvent` | 50 | 200 |
| `netEventFlood` | 75 | 300 |
| `rcon` | 2 | 5 |
| `res_http_handler` | 10 | 25 |
| `resourceList` | 10 | 25 |
| `stateBag` | 75 | 125 |
| `stateBagFlood` | 150 | 175 |
| `stateBagSize` | 131072 | 262144 |

Each limiter can be configured with two ConVars:

```cfg
set rateLimiter_<name>_rate <value>
set rateLimiter_<name>_burst <value>
```

For example, to adjust the netEvent rate limiter:

```cfg
set rateLimiter_netEvent_rate 100
set rateLimiter_netEvent_burst 400
```

### Recording & replay

These commands record the network sync of an entity to a file and replay it back.

#### `sync_start_recording [netId] [compressed]`

Starts recording the network sync of the entity with the given network ID to a file. `compressed` is an optional boolean that enables compression of the recording.

#### `sync_stop_recording [netId]`

Stops the recording in progress for the entity with the given network ID.

#### `replay_start [fileName] [mode]`

Starts replaying a previously recorded file. `mode` controls playback behavior:

- `0`: Once. Play the recording a single time.
- `1`: Loop. Repeat the recording continuously.
- `2`: Perfect loop. Repeat the recording seamlessly.

Prints a replay id that can be passed to `replay_stop`.

#### `replay_stop [replayId]`

Stops the replay with the given replay ID (as returned by `replay_start`).

### Deprecated & compatibility variables

The following variables exist only for backward compatibility and have no effect:

| Variable | Type | Default | Notes |
| -------- | ---- | ------- | ----- |
| `onesync_enableBeyond` | bool | `false` | Not necessary anymore. |
| `sv_enhancedHostSupport` | bool | `false` | Not used anymore (P2P). |
| `sv_protectServerEntities` | bool | `false` | Not implemented. Use `sv_entityLockdown` instead. |

[servercfg]: /docs/server-manual/setting-up-a-server-vanilla/#servercfg
