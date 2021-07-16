---
title: getPlayerIdentifiers
---

Returns a table containing all of the player’s identifiers.

Syntax
------

```js
getPlayerIdentifiers(serverId: string)
```

### Required arguments
- **serverId**: The ID of the player to get the identifiers from.

Examples
--------

Check for all possible identifiers using this method;  works well when triggered by playerConnecting event.

```js
const playerIdentifiers = getPlayerIdentifiers(source)
let steamid, license, license2, fivem, discord, xbl, liveid, ip;

for(let i = 0; i < playerIdentifiers.length; i++) {
	const identifier = playerIdentifiers[i]
	switch(identifier.substring(0, identifier.indexOf(':'))) {
		case 'steam':
			steamid = identifier
			break;
		case 'license':
			license = identifier
			break;
		case 'license2':
			license2 = identifier
			break;
		case 'fivem':
			fivem = identifier
			break;
		case 'xbl':
			xbl = identifier
			break;
		case 'ip':
			ip = identifier
			break;
		case 'discord':
			discord = identifier
			break;
		case 'live':
			live = identifier
			break;
	}
}
```
