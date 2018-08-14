---
title: Server functions
weight: 420
---

Here is a list of some of the functions that you can use specifically in **server** side lua scripts. This list does not contain [shared non-native functions]({{< ref "/scripting-reference/shared-functions" >}}). These functions are **not** documented in the [FiveM Native Reference List](https://runtime.fivem.net/doc/reference.html).


- **`RegisterServerEvent(eventName)`**

Use this just before `AddEventHandler` to register the event so it can be called from the client. Without this, you can only call the event from within a server script, when a client calls the event it will be ignored.

- **`TriggerClientEvent(eventName, <playerId | -1>, ...)`**

Triggers the `eventName` event on the specified client, and passes on the `...` arguments.

- **`RconPrint(message)`**

Is the exact same function as `Citizen.Trace(message)`, it will print `message` to the console.

- **`GetPlayerEP(playerId)`**

Returns the player's IP/endpoint (same function as `GetPlayerEndpoint(playerId)`).

- **`GetPlayerIdentifiers(playerId)`**

Returns a table containing all of the player's identifiers.

- **`GetPlayers()`**

Returns a table of all connected players (server ID's).

- **`PerformHttpRequest(url, callback, httpMethod, data, headers)`**

Performs a http request using the specified parameters and returns the http response in `callback`.

Example:
```lua
PerformHttpRequest("http://some-cool-url.here/some-important-document.txt", function(errorCode, resultData, resultHeaders)
        print("Returned error code:" .. tostring(errorCode))
        print("Returned data:" .. tostring(resultData))
        print("Returned result Headers:" .. tostring(resultHeaders))
    end, "GET", "", {})
```
