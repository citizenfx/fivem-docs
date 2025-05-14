---
title: Console commands
weight: 260
---

List of clientside commands which can be useful to develop your server or debug resource issues. Additional commands
may be added by resources; these are just the standard FiveM commands.

These commands can be used with the client console, which you can open by pressing F8. You can also install additional
tools if preferred, like [VConsole2][vconsole]. This allows you to use the client console outside of the game.

## User commands

User commands can be used in the client console by anyone, and don't require additional developer mode settings to be enabled or usable.

### connect \<server\>
Connects to a server using a given IP address and port, or URL.

Example: `connect 127.0.0.1:30120`, `connect "https://fivem.net/"`, `connect cfx.re/join/y4lg95`


### disconnect
Disconnect you from the server you are connected to and returns to the main menu.

### bind
Lists all configured bindings.

### bind \<mapper> \<input> \<command>
Binds an [input](/docs/game-references/input-mapper-parameter-ids/) to execute the specified command when pressed in-game.

Example: `bind keyboard F9 "say hi; wait 250; say bye"`

### rbind \<resource> \<mapper> \<input> \<command>
Equal to `bind` above, but will only run if the specified resource is in use on a server.

### unbind \<mapper> \<input>
Unbinds all commands bound to the specified input.

Example: `unbind keyboard F9`

### cl_drawfps \<bool\>
Enables or disables the client frames-per-second counter in the screen corner.

Usage: `cl_drawfps <true|false>`

### cl_drawperf \<bool\>
Enables or disables showing performance metrics in the screen corner:

| Name (Units)  |                                Description                                 |
| ------------- | -------------------------------------------------------------------------- |
| FPS           | *Frames Per Second:* How many frames are drawn on screen each second.      |
| Ping (ms)     | How long it takes to get a response from the server (round trip time).     |
| PL (%)        | *Packet Loss:* How many packets failed to reach their destination in time. |
| CPU Usage (%) | How much of the CPU's computing power is being utilized.                   |
| GPU Usage (%) | How much of the GPU Engine's computing power is being utilized.            |
| GPU Temp (°C) | The temperature of the GPU in Celsius.                                     |

Usage: `cl_drawperf <true|false>`

### quit
Will force the client to close immediately.

### quit [reason]
Will force the client to close immediately, specifying a quit reason to the server.

### loadlevel \<level_name>
<!-- TODO: Needs an reference on how to use and/or setup the loadlevel command -->
Starts a local game loading a level (or commonly known as a map) from the name supplied.

Example: `loadlevel gta5`, `loadlevel rdr3`, `loadlevel blank-map`.

### storymode
Starts FiveM story mode.

### profile_sfxVolume \<0-10+>
Sets the SFX volume for the game. This value has no upper limit, however the lower limit is 0, and 100% volume maps to 10.

### profile_musicVolume \<0-10+>
Sets the music volume for the game when in single-player modes.

### profile_musicVolumeInMp \<0-10+>
Sets the music volume for the game when connected to a network game.

## Developer commands

Developer commands require the client to run in a developer mode, or they'll show an error like `Access denied for command resmon` or `Command strdbg is disabled in production mode`.

This type of developer mode can be enabled in a few ways:

1. On any update channel, by launching the FiveM/RedM client using the `+set moo 31337` argument,
   for example, by adding it to a shortcut.
2. Running the client on a non-production update channel (such as Beta or Latest). Note that other update channels may
   be unstable and lead to issues including the game being unable to launch.

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

### developer
Enables some additional logging for developers. Typically not of use to a regular user.

Usage: `developer <true|false>`

### devgui_cmd \<path> \<command>
Adds a command to the developer GUI shown above the console.

Example: `devgui_cmd "Launch/MP/Disconnect" "disconnect"`

### devgui_convar \<path> \<variable>
Adds a convar to the developer GUI shown above the console.

Example: `devgui_convar "Game/SFX Volume" profile_sfxVolume`

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

### localGame \<name>
Loads a local resource from `usermaps:/resources/[name]` in a single-player game. Running this command will stop any existing open game (including story-mode) and will start a new single player environment from the game's prologue mission.

In order for this to work, you will need to create a `usermaps\resources\[resource-name]` directory from your FiveM main folder, where `[resource-name]` can be `hello-world`, i.e. `path\to\fivem\FiveM.app\usermaps\resources\hello-world`.

You will also need an [fxmanifest.lua][manifest-reference] file for the resource to work.

### localRestart
Restarts the localGame resource.

### modelviewer
Allows you to load in TXDs and drawables via an graphical interface.

Usage: `modelviewer <true|false>`

### net_printOwner \<objectID>
Prints the owner of a network object ID.

### net_showCommands
Internal dev tool. Not of use to a regular user unless asked to run.

### net_showDrilldown
Internal dev tool. Not of use to a regular user unless asked to run.

### net_showTime
Internal dev tool. Not of use to a regular user unless logging state-awareness data.

### netEventLog
Enables a tool displaying all network event traffic.

This command will show any incoming/outgoing event traffic. It shows the direction of the event (e.g. Server -> Client), the event name, and the size of the data sent (e.g. 2 bytes).

Usage: `neteventlog <true|false>`

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

| Field Name  |                              Description                              |
| ----------- | --------------------------------------------------------------------- |
| ping        | How long it takes to get a response from the server (round trip time) |
| in          | How many packets we received per second.                              |
| in (bytes)  | How many bytes we received per second.                                |
| out         | How much packets we have sent per second.                             |
| out (bytes) | How much bytes we have sent per second.                               |
| rt          | Routing packets received/sent.                                        |
| rd          | Routing packet **delay**.                                             |

The graph represents how many packets have been sent or received of a certain kind.

Usage: `netgraph <true|false>`

### netobjviewer
Shows a list of current objects and nodes being synchronized over the network, when game state awareness is enabled.

Usage: `netobjviewer <true|false>`

### netobjviewer_syncLog
Used when diagnosing discrepancies in written game state. Not of use to a regular user.

### nui_devtools
Opens the NUI dev tools window from the game process.

### onesync_logFile \<filename>
Used to save client-side logs from the game state awareness subsystem. These files get large, so this command should be used sparingly.

Example: `onesync_logFile "1s_today.log"; wait 5000; onesync_logfile ""`

### r_disableRendering
Used for supporting internal tooling. Not of use to a regular user, and can not be toggled at runtime.

### resmon
The resmon command will open the resource monitor. The resource monitor monitors the CPU usage and memory usage for each
resource and shows this in a nice overview. Comes in handy when you encounter performance issues during gameplay.

Usage: `resmon <true|false>`

### save_gta_cache
Saves cache data for a specified resource to the CitizenFX directory in AppData (`%AppData%\CitizenFX`). This is to be used for resources with a
significant amount of collision or map files, to speed up initial loading for players.

In order for players to load this file, it needs to be stored in the server's root folder of the resource you decided to save the map's cache for (not in a subdirectory) and added to your resource manifest.

In your resource manifest, `fxmanifest.lua`:

```
files {
  'your_resource_name_cache_y.dat'
}
```

*Make sure the cache file name matches the one you saved and copied to your root resource directory, don't copy/paste the example as is.*

If you followed the steps correctly, you should see something like the following in your game log:

```
MainThrd/ loading CFX_PSEUDO_CACHE your_resource_name.
MainThrd/ done loading your_resource_name in data file mounter class CfxCacheMounter.
```

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

### strmem
Shows a listing of streaming memory used by specific streaming assets, as well as a global overview.

Usage: `strmem <true|false>`

### game_enableScaleformDebugLog
The `game_enableScaleformDebugLog` command will show all debug log messages related to scaleform (which is used by the game's main UI components), there's different types that are displayed, but the most commonly shown type is `HUD_TYPE`. This is a **FiveM** only command at this time, it's **not supported** on **RedM**.

Below you can find an example log and all related types:

Example Log:

```
[HUD_TYPE] Removing Stream Component: 0,6
[HUD_TYPE] SHOW_NEXT_STATIC_LOADINGSCREEN()
[HUD_TYPE] fadeInBlackOverlay(): 1
[HUD_TYPE] Creating Stream Component: 0,~BLIP_INFO_ICON~ If you're strapped for cash, why not visit one of the many gas stations, liquor stores or 24/7 supermarkets around Los Santos?,false,6
[HUD_TYPE] SET_STREAM_COMPONENT creation time: 0
```

Types:

- GENERIC_TYPE
- SCRIPT_TYPE
- HUD_TYPE
- MINIMAP_TYPE
- WEB_TYPE
- CUTSCENE_TYPE
- PAUSE_TYPE
- STORE
- GAMESTREAM
- SF_BASE_CLASS_VIDEO_EDITOR
- SF_BASE_CLASS_MOUSE
- SF_BASE_CLASS_TEXT_INPUT

Usage: `game_enableScaleformDebugLog <true|false>`

### game_enableFlyThroughWindscreen
The `game_enableFlyThroughWindscreen` command will toggle a boolean variable to determine whether the ped should fly through the windscreen upon a crash.

Usage: `game_enableFlyThroughWindscreen <true|false>`  
Note: This variable can be replicated from the server via `setr` usage.

### game_enablePlayerJumpRagdollControl
The `game_enablePlayerJumpRagdollControl` command will toggle a boolean variable to determine whether the ped should activate ragdoll on jump like in single player (Jump Key + R).

Usage: `game_enablePlayerJumpRagdollControl <true|false>`  
Note: This variable can be replicated from the server via `setr` usage.

### game_enablePlayerRagdollOnCollision
The `game_enablePlayerRagdollOnCollision` command will toggle a boolean variable to determine whether the ped should activate native ragdoll on collision game logic.

Usage: `game_enablePlayerRagdollOnCollision <true|false>`  
Note: This variable can be replicated from the server via `setr` usage.

### test_ace
Tests if a principal is allowed or denied access to a given object.

Usage: `test_ace <principal> <object>`

Example: `test_ace group.admin command.adminstuff`

[faq-data]: https://support.cfx.re/hc/en-us/articles/8016397932444-Client-FAQ#where-is-fivem-installed
[vconsole]: https://forum.cfx.re/t/20005
[manifest-reference]: /docs/scripting-reference/resource-manifest/resource-manifest/
