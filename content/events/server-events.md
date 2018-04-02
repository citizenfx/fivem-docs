---
title: "List of server events"
---

**A list of server side events you can use in your scripts.**

### Default events
These events are available without using any stock cfx-data resources.


- `rconCommand(string command, table commandArguments)`
    ##### **Parameters**
    - `command` - A string containing the command name that was executed.
    - `commandArguments` - A table/array containing all arguments passed to the command.

- `playerDropped(playerSource player, string disconnectReason)`
    ##### **Parameters**
    - `player` - The source/player that disconnected.
    - `disconnectReason` - The reason why the player has disconnected.

- `playerConnecting(string playerName, function setKickReason, source tempPlayer)`
    ##### **Parameters**
    - `playerName` - The player name of the player connecting.
    - `setKickReason` - A function used to defer connections and/or kick players with a custom message.
    - `tempPlayer` - A temporary player source which can be used to get things like Player Identifiers and much more.

