---
title: playerConnecting
weight: 550
---

Called when a player is connecting to the server.

Parameters
----------

```
string playerName, function setKickReason, object deferrals
```

- **playerName**: The player name of the player connecting.
- **setKickReason**: A function used to set a reason message for when the event is canceled.
- **deferrals**: An object used to 'defer' accepting connections to a later tick.
- **source**: The source object is a _temporary_ player ID, that can be used with a limited set of functions only.

Deferring connections
---------------------

Using deferrals allows you to make a connection request complete at a later time, for example when you have to wait for
an asynchronous task to complete beforehand, such as a database or web API query.

The `deferrals` object contains the following members to achieve such:

#### defer(): void

`deferrals.defer` will initialize deferrals for the current resource. It is required to wait for at least a tick after 
calling `defer` before calling `update`, `presentCard` or `done`.

#### update(message: string): void

`deferrals.update` will send a progress message to the connecting client.

#### presentCard(card: object | string, cb?: (data: object, rawData: string) => void): void

`deferrals.presentCard` will send an [Adaptive Card](https://adaptivecards.io/) to the client.

`card` can be an object containing card data, or a serialized JSON string with the card information.
`cb`, if present, will be invoked on an `Action.Submit` event from the Adaptive Card.

#### done(failureReason?: string): void

`deferrals.done` finalizes a deferral. It is required to wait for at least a tick before calling `done` after calling a
prior deferral method.

If `failureReason` is specified, the connection will be refused, and the user will see the specified message as a result.
If this is not specified, the user will be allowed to connect.

#### Dynamic handover

`deferrals.handover` will allow you to provide a set of endpoints for a specific player on connection.

This will look like this:
```lua
deferrals.handover({
    endpoints = { "127.0.0.1" }
})
```

Examples
--------
This example checks a connecting player's license identifier against a ban list. If the player is in the ban list, they get kicked, otherwise they are allowed to connect.

##### C\# example:
```csharp
// In class constructor
EventHandlers["playerConnecting"] += new Action<Player, string, dynamic, dynamic>(OnPlayerConnecting);

// Delegate method
private async void OnPlayerConnecting([FromSource]Player player, string playerName, dynamic setKickReason, dynamic deferrals)
{
    deferrals.defer();

    // mandatory wait!
    await Delay(0);

    var licenseIdentifier = player.Identifiers["license"];

    Debug.WriteLine($"A player with the name {playerName} (Identifier: [{licenseIdentifier}]) is connecting to the server.");

    deferrals.update($"Hello {playerName}, your license [{licenseIdentifier}] is being checked");

    // Checking ban list
    // - assuming you have a function called IsBanned of type Task<bool>
    // - normally you'd do a database query here, which might take some time
    if (await IsBanned(licenseIdentifier))
    {
        deferrals.done($"You have been kicked (Reason: [Banned])! Please contact the server administration (Identifier: [{licenseIdentifier}]).");
    }

    deferrals.done();
}
```

These examples check (badly) if Steam is present.

##### Lua example:
```lua
local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()

    -- mandatory wait!
    Wait(0)

    deferrals.update(string.format("Hello %s. Your Steam ID is being checked.", name))

    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

    -- mandatory wait!
    Wait(0)

    if not steamIdentifier then
        deferrals.done("You are not connected to Steam.")
    else
        deferrals.done()
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)
```

Non-deferral version (which *can't* wait):

```lua
local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)

    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

    if not steamIdentifier then
        CancelEvent()
        setKickReason("You are not connected to Steam.")
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)
```

##### JavaScript example:
```js

on('playerConnecting', (name, setKickReason, deferrals) => {
    deferrals.defer()

    const player = global.source;

    setTimeout(() => {
        deferrals.update(`Hello ${name}. Your steam ID is being checked.`)

        let steamIdentifier = null;

        for (let i = 0; i < GetNumPlayerIdentifiers(player); i++) {
            const identifier = GetPlayerIdentifier(player, i);

            if (identifier.includes('steam:')) {
                steamIdentifier = identifier;
            }
        }

        // pretend to be a wait
        setTimeout(() => {
            if (steamIdentifier === null) {
                deferrals.done("You are not connected to Steam.")
            } else {
                deferrals.done()
            }
        }, 0)
    }, 0)
})
```

