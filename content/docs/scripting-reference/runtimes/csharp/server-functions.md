---
title: Server-side functions in C#
weight: 20
---

There's a few ways to easily tell what functions exist in C# pending manual documentation:

1.  You can use Visual Studio's IntelliSense functionality to view most functions, or use the 'class browser' feature
    to view the public-exposed API.
2.  Natives exist in `CitizenFX.Core.Native.API`, check the [native reference](/natives/) to find out more.
    (do make sure to filter by server).

This page documents common **runtime-specific server functions** you are likely to use in day‑to‑day C# resources. It
is deliberately focused on practical examples rather than being an exhaustive reference.

## Runtime-specific functions

The following helpers are provided by the C# runtime and are not regular game natives.

- [TriggerClientEvent (server, C#)](/docs/scripting-reference/runtimes/csharp/functions/TriggerClientEvent/)

### Registering and handling server events

Use `EventHandlers` to subscribe to server events such as `playerConnecting`, `playerDropped`, or your own custom
network events.

```csharp
using System;
using System.Collections.Generic;
using CitizenFX.Core;

public class MyServerScript : BaseScript
{
    public MyServerScript()
    {
        // Built-in event fired when a player is connecting to the server
        EventHandlers["playerConnecting"] += new Action<Player, string, dynamic, dynamic>(OnPlayerConnecting);

        // Custom event you trigger from clients with TriggerServerEvent("myCustomEvent", ...)
        EventHandlers["myCustomEvent"] += new Action<Player, int>(OnMyCustomEvent);
    }

    private void OnPlayerConnecting([FromSource] Player player, string playerName, dynamic setKickReason, dynamic deferrals)
    {
        Debug.WriteLine($"[MyServerScript] {playerName} is connecting ({player?.Handle}).");
        // You can use deferrals here if needed to perform async checks before allowing the player in.
    }

    private void OnMyCustomEvent([FromSource] Player player, int someValue)
    {
        Debug.WriteLine($"Received myCustomEvent from {player?.Name} with value {someValue}.");
    }
}
```

> Note
> The `[FromSource]` attribute tells the runtime to bind the first argument to the player that triggered the event.

### Triggering client events from the server

To send events from the server to one or more clients, use `TriggerClientEvent`. You can
broadcast to everyone or target specific players.

```csharp
using CitizenFX.Core;

public class MyServerEvents : BaseScript
{
    public MyServerEvents()
    {
        EventHandlers["announceToEveryone"] += new Action<string>(OnAnnounceToEveryone);
    }

    private void OnAnnounceToEveryone(string message)
    {
        // Broadcast to all connected players
        TriggerClientEvent("chat:addMessage", new
        {
            args = new[] { "^2[Server]", message },
            color = new[] { 0, 255, 0 }
        });
    }

    public void SendPrivateMessage(Player target, string message)
    {
        // Send only to a specific player
        target.TriggerEvent("chat:addMessage", new
        {
            args = new[] { "^3[Server]", message },
            color = new[] { 255, 255, 0 }
        });
    }
}
```

### Triggering server events from the server

You can also trigger server events from other server code (for example from another resource or helper class).

```csharp
using CitizenFX.Core;

public class MyServerTriggers : BaseScript
{
    public void DoSomething()
    {
        // Will call any EventHandlers["myServerEvent"] subscribers on the server
        TriggerEvent("myServerEvent", 42, "hello");
    }
}
```

> Note
> For client → server events, use `TriggerServerEvent` on the client side. On the server you continue to use
> `EventHandlers[...]` to handle them.

### HTTP requests from the server

Although many integrations are better handled by dedicated services, you can perform simple HTTP requests directly from
a C# server script using `System.Net.Http.HttpClient`.

```csharp
using System.Net.Http;
using System.Threading.Tasks;
using CitizenFX.Core;

public class MyHttpExample : BaseScript
{
    private static readonly HttpClient Http = new HttpClient();

    public MyHttpExample()
    {
        EventHandlers["myHttpCheck"] += new Action(Player>(OnMyHttpCheck);
    }

    private async void OnMyHttpCheck([FromSource] Player player)
    {
        var url = "https://httpbin.org/get";
        Debug.WriteLine($"Requesting {url} for {player?.Name}...");

        var response = await Http.GetAsync(url);
        var body = await response.Content.ReadAsStringAsync();

        Debug.WriteLine($"HTTP { (int)response.StatusCode } from {url}");
        Debug.WriteLine(body);
    }
}
```

> Tip
> For more advanced scenarios you might want to move HTTP calls into a separate service class and reuse a single
> `HttpClient` instance for the whole resource.

### Working with players

You can use `Players` (on `BaseScript`) to iterate over connected players and read basic information.

```csharp
using System.Linq;
using CitizenFX.Core;

public class MyPlayerHelpers : BaseScript
{
    [Command("listplayers")]
    public void ListPlayersCommand(Player source, string[] args)
    {
        foreach (var player in Players)
        {
            Debug.WriteLine($"Player {player.Name} (id={player.ServerId})");
        }

        var count = Players.Count();
        Debug.WriteLine($"There are currently {count} players online.");
    }
}
```

## Native functions

Refer to the [FiveM Native Reference](/natives/) for game functions. Filter by **C#** and **server** in the
reference UI, or use `CitizenFX.Core.Native.API` directly from your code.
