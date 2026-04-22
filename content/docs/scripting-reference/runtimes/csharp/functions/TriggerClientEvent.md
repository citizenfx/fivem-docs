---
title: TriggerClientEvent (server, C#)
weight: 20
---

Sends an event from the **server** to one or more clients.

This is commonly used to:

- send chat messages or notifications,
- update UI state on specific players,
- broadcast information to everyone on the server.

> Note
> This page describes the C# server usage. Make sure your client script is listening for the event name you use.

## Syntax

```csharp
// Broadcast to all players
TriggerClientEvent(string eventName, params object[] args);

// Send only to one player
player.TriggerEvent(string eventName, params object[] args);
```

- `eventName`: the name of the client event to trigger (for example `"chat:addMessage"` or your own custom name).
- `args`: values that will be passed to the client event handler.

## Basic broadcast example

Sends a green chat message to all players when a server event is triggered.

```csharp
using System;
using CitizenFX.Core;

public class AnnounceServerScript : BaseScript
{
    public AnnounceServerScript()
    {
        EventHandlers["server:announce"] += new Action<string>(OnServerAnnounce);
    }

    private void OnServerAnnounce(string message)
    {
        TriggerClientEvent("chat:addMessage", new
        {
            args = new[] { "^2[Server]", message },
            color = new[] { 0, 255, 0 }
        });
    }
}
```

Client-side (Lua example) listening for the event:

```lua
RegisterNetEvent("chat:addMessage")
AddEventHandler("chat:addMessage", function(data)
    TriggerEvent("chat:addMessage", data)
end)
```

In many setups the chat resource already handles `chat:addMessage` for you, so you only need to trigger it from C#.

## Targeting a specific player

To send an event only to one player, use the `Player` instance:

```csharp
using CitizenFX.Core;

public class PrivateMessageScript : BaseScript
{
    public void SendPrivateMessage(Player target, string message)
    {
        if (target == null)
        {
            Debug.WriteLine("[PrivateMessageScript] Target player is null.");
            return;
        }

        target.TriggerEvent("chat:addMessage", new
        {
            args = new[] { "^3[Server]", message },
            color = new[] { 255, 255, 0 }
        });
    }
}
```

On the client, your handler just needs to accept the payload you send (in this example, an anonymous object with
`args` and `color` fields).

## Sending custom data

You can send simple values (strings, numbers, booleans) or small objects/arrays. Keep payloads compact so they are
cheap to send and easy to reason about.

```csharp
using System;
using CitizenFX.Core;

public class CustomDataScript : BaseScript
{
    public CustomDataScript()
    {
        EventHandlers["server:notifyStatus"] += new Action<int, string>(OnNotifyStatus);
    }

    private void OnNotifyStatus(int health, string status)
    {
        TriggerClientEvent("client:updateStatus", new
        {
            health,
            status
        });
    }
}
```

Client-side (Lua) handler for the custom event might look like this:

```lua
RegisterNetEvent("client:updateStatus")
AddEventHandler("client:updateStatus", function(data)
    print(("Health: %s, Status: %s"):format(data.health, data.status))
end)
```

## Common pitfalls

- The client must **register and handle** the event name you use, otherwise nothing visible will happen.
- Make sure you use the correct runtime on the client (Lua/JS/C#) and that the parameter order matches what you send.
- Avoid sending very large objects or big JSON blobs on every tick; design your events around small, meaningful updates.
