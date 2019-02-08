---
title: Server Commands
weight: 330
---

<!-- TODO: format this like client commands? -->

Console commands can be executed either using an RCon tool, directly from the server console GUI, a server configuration
file, or (if a resource is allowed by ACE) the [ExecuteCommand](https://runtime.fivem.net/doc/natives/#_0x561C060B) function.

Adding a custom RCon command can be done using the [RegisterCommand](https://runtime.fivem.net/doc/natives/#_0x5FA79B0F) function on the
server, or the (legacy) `rconCommand` event.

### `start <resourceName>`

Starts the resource specified in the argument, if it was stopped.

Example:

    start lambda-menu

### `stop <resourceName>`

Stops the resource specified in the argument, if it was started.

Example:

    stop mymode

### `restart <resourceName>`

Restarts the resource specified in the argument, if it was started.

Example:

    restart lambda-menu

### `refresh`

Rescans the *resources* folder and loads all \_\_resource.lua files in them, making new resources available to start using [start](#start "wikilink").

Example:

    refresh


### `status`

{{% alert theme="info" %}}This is provided by the **rconlog** resource. {{% /alert %}}

Shows a list of players with their primary identifier, server ID, name, endpoint, and ping.

Example:

    status

### `sv_maxClients [newValue]`

A console variable that specifies the maximum amount of clients that the server can normally have, as an integer from 1 to 32.

### `sv_endpointPrivacy [newValue]`

A boolean variable that, if true, hides player IP addresses from public reports output by the server.

### `sv_hostname [newValue]`

A string variable that contains the server host name.

### `clientkick <id> <reason>`

Kicks the client with the specified server ID (as seen in [status](#status "wikilink")) from the server, for the stated reason.

Example:

    clientkick 43 You're a superstitious idiot!

### `say <message>`

Sends a message in the chat as *console*.

Example:

    say Hi, everybody!


### `load_server_icon <fileName.png>`

Loads a specfied icon and sets it as the server icon. The icon needs to be a 96x96 PNG file.

Example:

```toml
load_server_icon "my-server.png"
```

### `add_ace <principal> <object> <allow|deny>`

Adds an access control entry to the server's access control list.

Example:

```
add_ace group.admin command.potato allow
add_ace identifier.steam:110000112345678 command.apple deny
```

### `add_principal <child_principal> <parent_principal>`

Sets a principal to inherit from another principal.

Example:
```toml
# makes identifier.steam:110000112345678 inherit from group.admin
add_principal identifier.steam:110000112345678 group.admin
```

### `remove_ace <principal> <object> <allow|deny>`

Removes a specified ACE from the server's access control list.

Example:

```
remove_ace identifier.steam:110000112345678 command.apple deny
```

### `remove_principal <child_principal> <parent_principal>`

Removes a specified principal inheritance entry.

Example:
```
remove_principal identifier.steam:110000112345678 group.admin
```

### `test_ace <principal> <object>`
Tests if a principal is allowed or denied access to a given object.

Example: `test_ace group.admin command.adminstuff`
