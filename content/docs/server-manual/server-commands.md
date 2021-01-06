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

Runs the commands specified in the filename. Commonly seen as `FXServer.exe +exec server.cfg`.

Example:

    exec server_nested.cfg

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

### `onesync [on/off/legacy]`

Defines which mode of state awareness to use.

* **Off**: No state awareness at all, clients will use the standard GTA/RAGE P2P networking model, and the server will only function as a relay.
* **On**: Full state awareness and server-determined entity routing.
* **Legacy**: Compatibility mode for scripts that expect all players to exist on each client. Not recommended due to performance issues and graphical glitches.

### `sv_maxClients [newValue]`

A console variable that specifies the maximum amount of clients that the server can normally have, as an integer from 1 to 1024.

Values starting at 32 will require `onesync` to be set to `on` or `legacy`, and values above 64 will require `onesync` to be set to `on`.

### `sv_endpointPrivacy [newValue]`

A boolean variable that, if true, hides player IP addresses from public reports output by the server.

### `sv_hostname [newValue]`

A string variable that contains the server host name.

### `sv_authMaxVariance [newValue]`

**Variance** is how likely the user's id will change for a given provider (i.e. 'steam', 'ip', or 'license').

A console variable as an integer from 1-5 (default 1); from least to most likely to change.

### `sv_authMinTrust [newValue]`

**Trust** is how _unlikely_ it is for the user's identity to be spoofed by a malicious client.

A console variable as an integer from 1-5 (default 5); from least to most trustworthy (5 being a method such as external three-way authentication).

### `load_server_icon [fileName.png]`

A console command which loads a specfied icon and sets it as the server icon. The icon needs to be a 96x96 PNG file.

Example:

```toml
load_server_icon "my-server.png"
```

### `rcon_password [password]`

Sets the RCon password. This being unset means RCon is disabled.

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
