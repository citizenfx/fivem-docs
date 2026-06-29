---
title: onPlayerBucketChange
---

Called when a player changes routing bucket on the server.

Parameters
----------

```
string player, int bucket, int oldBucket
```

- **player**: The id of the player that changed routing bucket.
- **bucket**: The new routing bucket the player was moved into.
- **oldBucket**: The routing bucket the player was previously in.

Examples
--------
This example prints the player's name, the new routing bucket, and the old routing bucket to the server console.

##### Lua Example:
```lua
AddEventHandler('onPlayerBucketChange', function(player, bucket, oldBucket)
    print('Player ' .. GetPlayerName(player) .. ' changed routing bucket from ' .. oldBucket .. ' to ' .. bucket)
end)
```

##### C\# Example:
```csharp
// In class constructor
EventHandlers["onPlayerBucketChange"] += new Action<Player, int, int>(OnPlayerBucketChange);

// Delegate method
private void OnPlayerBucketChange([FromSource]Player player, int bucket, int oldBucket)
{
    Debug.WriteLine($"Player {player.Name} changed routing bucket from {oldBucket} to {bucket}.");
}
```

##### JavaScript Example:
```js
on("onPlayerBucketChange", (player, bucket, oldBucket) => {
    console.log(`Player ${GetPlayerName(player)} changed routing bucket from ${oldBucket} to ${bucket}.`);
});
```
