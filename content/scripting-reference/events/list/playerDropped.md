---
title: playerDropped
weight: 550
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
AddEventHandler('playerDropped', function (source, reason)
  print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. '')
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
