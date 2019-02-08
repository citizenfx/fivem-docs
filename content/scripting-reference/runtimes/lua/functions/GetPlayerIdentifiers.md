---
title: GetPlayerIdentifiers
---

Returns a table containing all of the player’s identifiers.

Syntax
------

```lua
GetPlayerIdentifiers(int playerID)
```

Examples
--------
An example return table of the GetPlayerIdentifiers currently looks like the following:
```
steam:110000132ca2xxx, license:cac6120ec931e564afae342956b9742d4d9aexxx, xbl:2535439919044xxx, live:985157396007xxx, ip:95.45.101.xxx
```
These can be used to identify a player based on either their steam account, hardware identifier, XBL/GFWL identifier and also IP address.

For example, to just get the players steam identifier you can do the following:
```lua
local playerID = 1 -- The player ID to return identifiers for

local steamID = GetPlayerIdentifiers(playerID)[1]

print(steamID)
```
