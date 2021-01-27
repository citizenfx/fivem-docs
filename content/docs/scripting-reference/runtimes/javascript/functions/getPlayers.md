---
title: getPlayers
---

Returns a table of all connected players (server ID’s).

Syntax
------

```js
getPlayers()
```

Examples
--------

```js
const players = getPlayers()
for(let i = 0; i < players.length; i++) {
	const playerId = players[i]
	console.log('Player ' + GetPlayerName(playerId) + ' with id ' + playerId + ' is in the server.')
}
```
