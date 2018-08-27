---
title: Console commands
draft: true
---

List of clientside commands which can be useful to develop your server or debug resource issues. Additional commands
may be added by resources; these are just the standard FiveM commands.

These commands can be used with the client console, which you can open by pressing F8. You can also install additional
tools if preferred, like [VConsole2][vconsole]. This allows you to use the client console outside of the game.

### cmdlist
The `cmdlist` command will list all the commands that are registered on the client (or server). It will also output the
variables that have been set by using the `set`, `sets` and `seta` commands.

### connect
You can use the `connect` to connect to a server using a given IP address and port.

Usage: `connect <ip:port>`

Example: `connect 127.0.0.1:30120`

### developer
Enables some additional logging for developers. Typically not of use to a regular user.

Usage: `developer <true|false>`

### disconnect
`disconnect` will disconnect you from the current server you are connected to and return to the main menu.

### doshit
Used interally, to test some experimental features. Not of use to a regular user.

### invoke-levelload
An alias for `loadlevel`, see the [loadlevel](#loadlevel) command for details.

### list_aces
<!-- TODO: probably needs a reference to an explanation for ACL stuff -->
Lists all the aces (access control entries) in the console. It creates a list of the relationship between an principal
and identifier and if it's allowed or not allowed to use it. Example output:

```
builtin.everyone -> command.freecam = ALLOW
groups.admin -> command.testbed = DENY
<rest of the aces...>
```

### list_principals
<!-- TODO: probably needs a reference to an explanation for ACL stuff -->
Lists all the principals in the system, it will print out a list of which principals belong into which ace. Example
output:

```
identifier.steam:110000111111111 <- group.admin
identifier.steam:110000111111112 <- group.moderator
<child> <- <parent>
```

On the left is the child node that belongs to the parent node on the right side.

### loadlevel
<!-- TODO: Needs an reference on how to use and/or setup the loadlevel command -->
Loads a level (or commonly known as a map) from the name supplied.

Usage: `loadlevel <level_name>`

### modelviewer
Allows you to load in TXDs and drawables via an graphical interface.

Usage: `modelviewer <true|false>`

### net_maxPackets
A configuration flag to tell the client how many packets it can receive per second.

The default value is 50, minimum is 1 and maximum is 200 per second.

Usage: `net_maxPackets <number_of_packets>`

### net_statsFile
The `net_statsFile` is a command to store the metrics of the network usage/behaviour of the FiveM client.

It should keep track of metrics like ping, received packets and bytes, sent packets and bytes and the amount of
routing packages. All this information will be stored in a file, using a CSV format.

Usage: `net_statsFile <file_name>`

Example: `net_statsFile metrics.csv` - this will create a CSV file called `metrics.csv` in your
FiveM [application data directory][faq-data].

### netgraph
The `netgraph` command will give you real time metrics about the FiveM client network usage.
The netgraph consists of a graph and basic information about the network:

| Field Name  | Description                                                           |
|-------------|-----------------------------------------------------------------------|
| ping        | How long it takes to get a response from the server (round trip time) |
| in          | How many packets we received per second.                              |
| in (bytes)  | How many bytes we received per second.                                |
| out         | How much packets we have sent per second.                             |
| out (bytes) | How much bytes we have sent per second.                               |
| rt          | How many routing packets we have received.                            |
| rd          | How many routing packets we have sent.                                |

The graph represents how many packets have been sent or received.

Usage: `netgraph <true|false>`

### netobjviewer
Shows a list of current nodes being synchronized over the network.

Usage: `netobjviewer <true|false>`

### quit
Running the `quit` command will force the FiveM client to close immediately.

### r_disableRendering
Used internally. Not of use to a regular user.

### resmon
The resmon command will open the resource monitor. The resource monitor monitors the CPU usage and memory usage for each
resource and shows this in a nice overview. Comes in handy when you encounter performance issues during gameplay.

Usage: `resmon <true|false>`

### save_gta_cache
Used internally. Not of use to a regular user.

### se_debug
The `se_debug` command enable verbose logging for security features (like the ACL).

Usage: `se_debug <true|false>`

Useful to see why some people do or don't have access to certain commands, example output:
```
TEST ACL [system.console -> command.resmon] ACE [system.console command] -> ALLOW
TEST ACL [system.console -> command.resmon] -> ALLOW
```

### set
Set a variable on the client.

Usage: `set <key> <value>`

Example:
```
set animal snail

animal
  "animal" is "snail"
  default: ""
  type: string
```

### seta
Set a archived variable on the client.

Usage: `seta <key> <value>`

Example:
```
seta food escargot

food
  "food" is "escargot"
  default: ""
  type: string
```

### strdbg
`strdbg` can be used to see what is currently being streamed to the client, to potentially spot any issues with
streaming certain items.

Usage: `strdbg <true|false>`

### strlist
`strlist` is a graphical interface showing what is streamed to the client and additional information about those
streamed items.

Usage `strlist <true|false>`

### test_ace
Tests if a principal is allowed or denied for a given identifier.

Usage: `test_ace <principal> <identifier>`

Example: `test_ace group.admin command.adminstuff`

[faq-data]: /support/client-faq#where-is-fivem-installed
[vconsole]: https://forum.fivem.net/t/fivem-update-may-16th-2017/20005
