---
title: Console commands
weight: 260
---

List of clientside commands which can be useful to develop your server or debug resource issues. Additional commands
may be added by resources; these are just the standard FiveM commands.

These commands can be used with the client console, which you can open by pressing F8. You can also install additional
tools if preferred, like [VConsole2][vconsole]. This allows you to use the client console outside of the game.

### cmdlist
The `cmdlist` command will list all the commands that are registered on the client (or server). It will also output the
variables that have been set by using the `set`, `sets` and `seta` commands.

### con_miniconChannels
You can use the `con_miniconChannels` to display console messages on screen without needing to open the client console.

A channel name is the text inside the colored box next to a console message.
The message filter performs a *full match* of the pattern against the channel name, meaning it must match without any extra characters at the beginning or the end.  
An asterisk (`*`) can be used to specify a partial channel name, as a placeholder for 0-or-more characters.  
Multiple patterns can be combined using either a space or a plus sign (`+`).  

Usage: `con_miniconChannels <pattern>`

Default: `minicon:*`

Example patterns:
- All messages: `*`
- Messages originating from any resource: `script:*`
- Messages originating from both `banking` and `racing` resources: `script:banking script:racing`


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
Used internally, to test some experimental features. Not of use to a regular user.

### invoke-levelload
An alias for `loadlevel`, see the [loadlevel](#loadlevel) command for details.

### list_aces
<!-- TODO: probably needs a reference to an explanation for ACL stuff -->
Lists all the aces (access control entries) in the console. It creates a list of the relationship between an principal
and object and if they're allowed or not allowed to use it. Example output:

```
builtin.everyone -> command.freecam = ALLOW
group.admin -> command.testbed = DENY
<rest of the aces...>
```

### list_principals
<!-- TODO: probably needs a reference to an explanation for ACL stuff -->
Lists all the principals in the system, it will print out a list of which principals are inherited by others. Example
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
A configuration flag to tell the client how many packets it should send at minimum per second.

The default value is 50, minimum is 1 and maximum is 200 per second.

Usage: `net_maxPackets <number_of_packets>`

### net_showCommands
Internal dev tool. Not of use to a regular user.

### neteventlog
The `neteventlog` is a command to show you all of the network event traffic.

This command will show any incoming / outgoing event traffic. It shows the direction of the event (ex. Server -> Client), the event name, and the size of the data sent (ex. 2 bytes).

Usage: `neteventlog <true|false>`

### net_statsFile
The `net_statsFile` is a command to store the metrics of the network usage/behaviour of the FiveM client.

It should keep track of metrics like ping, received packets and bytes, sent packets and bytes and the amount of
routing packages. All this information will be stored in a file, using a CSV format.

Usage: `net_statsFile <file_name>`

Example: `net_statsFile metrics.csv` - this will create a CSV file called `metrics.csv` in your
FiveM [application data directory][faq-data].

### cl_drawfps
The `cl_drawfps` command will show reliably the frames per second.

Usage: `cl_drawfps <true|false>`

### cl_drawperf
The `cl_drawperf` command will show the following performance metrics:

| Name (Units)  | Description                                                            |
|---------------|------------------------------------------------------------------------|
| FPS           | *Frames Per Second:* How many frames are drawn on screen each second.  |
| Ping (ms)     | How long it takes to get a response from the server (round trip time). |
| PL (%)        | *Packet Loss:* How many packets failed to reach their destination.     |
| CPU Usage (%) | How much of the CPU's computing power is being utilized.               |
| GPU Usage (%) | How much of the GPU Engine's computing power is being utilized.        |
| GPU Temp (°C) | The temperature of the GPU in Celsius.                                 |

Usage: `cl_drawperf <true|false>`

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
Shows a list of current nodes being synchronized over the network, when OneSync is enabled.

Usage: `netobjviewer <true|false>`

### quit
Running the `quit` command will force the FiveM client to close immediately.

### r_disableRendering
Internal dev tool. Not of use to a regular user, and can not be toggled at runtime.

### resmon
The resmon command will open the resource monitor. The resource monitor monitors the CPU usage and memory usage for each
resource and shows this in a nice overview. Comes in handy when you encounter performance issues during gameplay.

Usage: `resmon <true|false>`

### save_gta_cache
<!-- TODO: reference a guide on GTA cache and using it in a resource -->
Saves cache data for a specified resource to the CitizenFX directory in AppData. This is to be used for resources with a
significant amount of collision or map files, to speed up initial loading for players.

Usage: `save_gta_cache <resource name>`

### se_debug
The `se_debug` command enables verbose logging for security features (like the ACL).

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
Set an archived variable on the client.  
The variables are saved in `%AppData%\CitizenFX\fivem.cfg` and `%AppData%\CitizenFX\redm.cfg`.

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
`strdbg` can be used to see what is currently being loaded in the GTA streamer, to potentially spot any issues with
streaming certain items, for example when the world stops loading.

Usage: `strdbg <true|false>`

### strlist
`strlist` is a graphical interface showing the entries registered in the GTA streamer, and their current status.

Usage `strlist <true|false>`

### test_ace
Tests if a principal is allowed or denied access to a given object.

Usage: `test_ace <principal> <object>`

Example: `test_ace group.admin command.adminstuff`

[faq-data]: /docs/support/client-faq#where-is-fivem-installed
[vconsole]: https://forum.cfx.re/t/20005
