---
title: playerDropped
weight: 551
---

Called when a player drops from the server.

Parameters
----------

```
string reason, string resourceName, uint clientDropReason
```

- **source**: The player that has disconnected.
- **reason**: The reason why the player has disconnected.
- **resourceName**: The resource this event was dispatched from.
- **clientDropReason**: An unsigned integer representing the internal reason for the event dispatch (see [ClientDropReasons.h](https://github.com/citizenfx/fivem/blob/master/code/components/citizen-server-impl/include/ClientDropReasons.h) for the enum, originally declared as `uint32_t`).

Examples
--------
This example prints the name of the player, the reason why the player has disconnected, the resource from which the event was dispatched, and the internal client drop reason to the server console.

##### Lua Example:
```lua
-- source is global here, don't add to function
AddEventHandler('playerDropped', function (reason, resourceName, clientDropReason)
    print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. ', Resource: ' .. resourceName .. ', Client Drop Reason: ' .. clientDropReason .. ')')
end)
```

##### C\# Example:
```csharp
// In class constructor
EventHandlers["playerDropped"] += new Action<Player, string, string, uint>(OnPlayerDropped);

// Delegate method
private void OnPlayerDropped([FromSource]Player player, string reason, string resourceName, uint clientDropReason)
{
    Debug.WriteLine($"Player {player.Name} dropped (Reason: {reason}, Resource: {resourceName}, Client Drop Reason: {clientDropReason}).");
}
```


##### JavaScript Example:
```js
on("playerDropped", (reason, resourceName, clientDropReason) => {
    console.log(`Player ${GetPlayerName(global.source)} dropped (Reason: ${reason}, Resource: ${resourceName}, Client Drop Reason: ${clientDropReason}).`);
});
```
