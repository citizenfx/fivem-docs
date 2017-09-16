---
title: "Console Commands"
---
Console commands
-----------------------

Console commands can be executed either using an RCon tool, directly from the server console GUI, or (if a resource is allowed by ACE) the [ExecuteCommand]({{<native "EXECUTE_COMMAND">}}) function.

Adding a custom RCon command can be done using the [RegisterCommand]({{<native "REGISTER_COMMAND">}}) function on the server, or the (legacy) `rconCommand` event.

### start

Starts the resource specified in the argument, if it was stopped.

Example:

    start lambda-menu

### stop

Stops the resource specified in the argument, if it was started.

Example:

    stop mymode

### restart

Restarts the resource specified in the argument, if it was started.

Example:

    restart lambda-menu

### refresh

Rescans the *resources* folder and loads all \_\_resource.lua files in them, making new resources available to start using [start](#start "wikilink").

Example:

    refresh


### status

{{% alert theme="info" %}}This is provided by the **rconlog** resource. {{% /alert %}}

Shows a list of players with their primary identifier, server ID, name, endpoint, and ping.

Example:

    status

### sv_maxClients

A console variable that specifies the maximum amount of clients that the server can normally have, as an integer from 1 to 32.

### sv_endpointPrivacy

A boolean variable that, if true, hides player IP addresses from public reports output by the server.

### sv_hostname

A string variable that contains the server host name.

### clientkick

Kicks the client with the specified server ID (as seen in [status](#status "wikilink")) from the server, for the stated reason.

Example:

    clientkick 43 You're a superstitious idiot!

### say

Sends a message in the chat as *console*.

Example:

    say Hi, everybody!

### tell

Sends a message in the chat to player with the specified server ID.

Example:

    tell 4 Hi, Dr. Nick!

### load\_server\_icon

Loads a specfied icon and sets it as the server icon. The icon needs to be a 96x96 PNG file.

Example:

```toml
load_server_icon "my-server.png"
```

### add_ace

Adds an access control entry to the server's access control list.

Example:

```
add_ace group.admin command.potato allow
add_ace identifier.steam:110000112345678 command.apple deny
```

### add_principal

Sets a principal to inherit from another principal.

Example:
```toml
# makes identifier.steam:110000112345678 inherit from group.admin
add_principal identifier.steam:110000112345678 group.admin
```

### remove_ace

Removes a specified ACE from the server's access control list.

Example:

```
remove_ace identifier.steam:110000112345678 command.apple deny
```

### remove_principal

Removes a specified principal inheritance entry.

Example:
```
remove_principal identifier.steam:110000112345678 group.admin
```