---
title: playerDropped
weight: 551
---

Called when a player drops from the server.

Parameters
----------

```
string reason
```

- **source**: The player that has disconnected.
- **reason**: The reason why the player has disconnected.

Examples
--------
This example prints the name of the player and the reason why the player has disconnected to the server console.
##### Lua Example:
```lua
-- source is global here, don't add to function
AddEventHandler('playerDropped', function (reason)
  print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. ')')
end)
```

##### C\# Example:
```csharp
// In class constructor
EventHandlers["playerDropped"] += new Action<Player, string>(OnPlayerDropped);

// Delegate method
private void OnPlayerDropped([FromSource]Player player, string reason)
{
    Debug.WriteLine($"Player {player.Name} dropped (Reason: {reason}).");
}
```


##### JavaScript Example:
```js
on("playerDropped", (reason) => {
    console.log(`Player ${GetPlayerName(global.source)} dropped (Reason: ${reason}).`)
});
```
