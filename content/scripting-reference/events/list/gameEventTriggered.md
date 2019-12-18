---
title: gameEventTriggered
weight: 544
---

This event is fired after low-level game events take place, such as `CEventNetworkEntityDamage`. A full list of
available game events can be found [here][game-events].

Parameters
----------

```
string name, int args[]
```

- **name**: The game event name that was triggered. A full list can be found [here][game-events].
- **args**: An array of integers that were passed along with the event.

Examples
--------

This example outputs all event triggers to the console, making it easier to discover what you need:

##### Lua Example:
```lua
AddEventHandler('gameEventTriggered', function (name, args)
  print('game event ' .. name .. ' (' .. json.encode(args) .. ')')
end)
```

##### C\# Example:
```csharp
// In class constructor
EventHandlers["gameEventTriggered"] += new Action<string, List<dynamic>>(OnGameEventTriggered);

// Delegate method
private void OnGameEventTriggered(string name, List<dynamic> args)
{
  Debug.WriteLine($"game event {name} ({String.Join(", ", args.ToArray())})");
}
``` 

##### JavaScript Example:
```js
on("gameEventTriggered", (name, args) => {
    console.log(`Game event ${name} ${args.join(', ')}`)
});
```

[game-events]: /docs/game-references/game-events
