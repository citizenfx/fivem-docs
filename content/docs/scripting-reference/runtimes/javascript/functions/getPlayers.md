---
title: getPlayers
---

Returns an array of all connected players (server ID's). Equivalent to [GetPlayers()](https://docs.fivem.net/docs/scripting-reference/runtimes/lua/functions/GetPlayers/) in Lua.

Syntax
------

```js
getPlayers()
```

Examples
--------

```js
const players = getPlayers();
for (const playerId of players) {
  console.log(playerId)
}
```
