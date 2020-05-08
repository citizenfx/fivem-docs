---
title: playerEnteredScope
weight: 551
---

This native is a server side native which requires [Onesync Big Mode/infinity](https://forum.cfx.re/t/onesync-infinity-how-to-use-it/996612) enabled to run it. It gets triggered once a player enters the focus zone (300 units around a player) of another player.


Parameters
----------

```
int data
```

- **data**: A table containing two strings:
```
string player, string for
```
- **player**: the player that has entered the scope
- **for**: the player whose scope has been entered by someone else.


Examples
--------
##### Lua Example:
This example prints the name of the player who has entered the scope of an another player.
```lua
AddEventHandler("playerEnteredScope",  function(data)
  print(GetPlayerName(data.player).." has entered the scope of "..GetPlayerName(data.for))
end)
```
