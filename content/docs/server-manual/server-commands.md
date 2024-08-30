---
title: Server Commands
weight: 330
description: >
  A list of commands to run in the server console.
---

<!-- TODO: format this like client commands? -->

Console commands can be executed either using an RCon tool, directly from the server console interface, a server configuration
file, the server command line, or (if a resource is allowed by the ACL) the [ExecuteCommand]({{% native "EXECUTE_COMMAND" %}}) function.

Adding a custom RCon command can be done using the [RegisterCommand]({{% native "REGISTER_COMMAND" %}}) function on the
server, or the (legacy) `rconCommand` event.

## Resource commands

### `start [resourceName]`

Starts the resource specified in the argument, if it was stopped. It is also possible to specify a category name, such as `start [cars]`.

Example:

    start lambda-menu
    start [cars]

### `stop [resourceName]`

Stops the resource specified in the argument, if it was started. As with `start`, one can also specify a category name.

Example:

    stop mymode

### `ensure [resourceName]`

Restarts the resource specified in the argument, if it was started. If it wasn't, starts the resource specified in the argument.

As with `start` and `stop`, one can also specify a category name.

Example:

    ensure my-testing-resource

### `restart [resourceName]`

Restarts the resource specified in the argument, if it was started. Also supports category names.

Example:

    restart lambda-menu

### `refresh`

Rescans the *resources* folder and loads all resource manifests in them, also making new resources available to start using [start](#start-resourcename "wikilink").

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

{{% alert theme="info" %}}This is provided by the **rconlog** resource. {{% /alert %}}

Shows a list of players with their primary identifier, server ID, name, endpoint, and ping.

Example:

    status

### `clientkick [id] [reason]`

{{% alert theme="info" %}}This is provided by the **rconlog** resource. {{% /alert %}}

Kicks the client with the specified server ID (as seen in [status](#status "wikilink")) from the server, for the stated reason.

Example:

    clientkick 43 You're a superstitious idiot!

### `say [message]`

{{% alert theme="info" %}}This is provided by the **chat** resource. {{% /alert %}}

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
| gta4 | LibertyM for GTA:NY |
| gta5 | FiveM for GTA:Five  |
| rdr3 | RedM for RDR3       |

### `onesync [on/off/legacy]`

Defines which mode of state awareness to use.

* **Off**: No state awareness at all, clients will use the standard GTA/RAGE P2P networking model, and the server will only function as a relay.
* **On**: Full state awareness and server-determined entity routing.
* **Legacy**: Compatibility mode for scripts that expect all players to exist on each client. Not recommended due to performance issues and graphical glitches.

### `sv_enforceGameBuild [build]`

Selects a game build for clients to use. This can only be specified at startup, and can not be changed at runtime.

Example:

    sv_enforceGameBuild h4
    sv_enforceGameBuild mptuner
    sv_enforceGameBuild 1355

Every build includes all content and changes from the builds before.

**FiveM builds**

| Number |               Aliases                |       Marketing name        |
| ------ | ------------------------------------ | --------------------------- |
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

**RedM builds**

| Number |                               Notes                               |
| ------ | ----------------------------------------------------------------- |
| 1311   | Mid 2020 update, not compatible with Red Dead Online licenses.    |
| 1355   | December 2020 update, works with newer game editions such as RDO. |
| 1436   | July 2021 update, includes new content from Blood Money DLC.      |
| 1491   | September 2022 update, limited content/changes.                   |

### `sv_maxClients [newValue]`

A variable that specifies the maximum amount of clients that the server can normally have, as an integer from 1 to 2048.

Values starting at 32 will require `onesync` to be set to `on` or `legacy`, and values above 64 will require `onesync` to be set to `on`.

### `sv_endpointPrivacy [newValue]`

A boolean variable that, if true, hides player IP addresses from public reports output by the server.

### `sets sv_projectName "project name"`

A string variable containing the name of your 'project', which would for example be the server's community. This should
be a name, not a list, nor should it contain tags.

Any non-compliant name will be cut off in the server list. <!-- Use our tool to check your name. -->

Example:

```bash
sets sv_projectName "Citizen Gaming"

# or if you are using a premium key, it can contain one color
sets sv_projectName "^6Citizen Gaming"
```

### `sets sv_projectDesc "project description"`

A string variable containing the description of your project. This should be written as a sentence.

Example:

```bash
sets sv_projectDesc "Your favorite drug deal simulation community!"
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
| noprint | Will stop anything from being printed at a trace listener level. |
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

This is set to false by default

### `sv_experimentalOnesyncPopulation [true|false]`

A boolean console variable introduced in server version 8823 that fix an oversight in older server version that incorrectly limited the amount of entity ids to `8192` instead of the proper `65535` when both `set onesync on` and `set onesync_population false`.

This ConVar doesn't change if population spawns on the server, you still need to use the `onesync_population` ConVar for this.

NOTE: Using this ConVar also opts you into using `sv_experimentalStateBagsHandler`

This is set to false by default

### `sv_experimentalNetEventHandler [true|false]`

A boolean console variable introduced in server version 9149 that uses the new serialization API to improve the speed of packing/unpacking GTA game events, adds checks for if entities sent with the game events are relevant to target client, along side improving backwards compatibility with future title updates.

NOTE: Using this ConVar also opts you into using `sv_experimentalStateBagsHandler` and `sv_experimentalOneSyncPopulation`

This is set to false by default

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

[servercfg]: /docs/server-manual/setting-up-a-server-vanilla/#servercfg