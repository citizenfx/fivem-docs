---
title: playerConnecting
weight: 549
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

TODO

Examples
--------
This example checks a connecting player's license identifier against a ban list. If the player is in the ban list, they get kicked, otherwise they are allowed to connect.

##### C\# Example:
```csharp
// In class constructor
Eventhandlers["playerConnecting"] += new Action<Player, string, dynamic, dynamic>(OnPlayerConnecting);

// Delegate method
private void OnPlayerConnecting([FromSource]Player player, string playerName, dynamic setKickReason, dynamic deferrals)
{
    deferrals.defer();
    var licenseIdentifier = player.Identifiers["license"];

    Debug.WriteLine($"A player with the name {playerName} (Identifier: [{licenseIdentifier}]) is connecting to the server.");

    deferrals.update($"Hello {playerName}, your license [{licenseIdentifier}] is being checked");

    // Checking ban list
    // - assuming you have a List<string> that contains banned license identifiers
    if (myBanList.Contains(licenseIdentifier))
    {
        deferrals.done($"You have been kicked (Reason: [Banned])! Please contact the server administration (Identifier: [{licenseIdentifier}]).");
    }

    deferrals.done();
}
```

##### Lua Example:
```lua
local function OnPlayerConnecting(name, setKickReason, deferrals)
    local identifiers = GetPlayerIdentifiers(source)
    deferrals.defer()

    deferrals.update(string.format("Hello %s. Your steam id is being checked.", name))
    Citizen.Wait(1000) -- not needed, we fake a loading

    local steam = identifiers[1] -- The steam identifier is always the first identifier (if steam is enabled)
    if not steam or string.sub(steam, 0, 5) ~= "steam" then
        deferrals.done("You are not connected to steam.")
    else
        deferrals.done()
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)
```
