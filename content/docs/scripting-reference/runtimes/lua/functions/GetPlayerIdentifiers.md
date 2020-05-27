---
title: GetPlayerIdentifiers
---

Returns a table containing all of the player’s identifiers.

**Never try to get identifiers based on their index. Identifier positions WILL vary!!!!**

Table structure & all possible identifiers
------
```
{
    'fivem:<id>',
    'license:<license>',
    'steam:<hex steam id>',
    'ip:<ip>',
    'live:<id>',
    'xbl:<id>',
    'discord:<id>',
}
```

Syntax
------

```lua
GetPlayerIdentifiers(Player player)
```

### Required arguments
- **player**: The ID of the player to get the identifiers from.

Examples
--------

Function that iterates user's current identifiers from GetPlayerIdentifiers() and return's them in usable table.
If an identifier is not present it will not be in the returned table. You can also check if user is missing any identifier by doing
`if  not GetAllIdentifiers(source).discord then`

```lua
function GetAllIdentifiers(player)
    local identifiers = {}
    for i = 0, GetNumPlayerIdentifiers(player) - 1 do
        local raw = GetPlayerIdentifier(player, i)
        local source, value = raw:match("^([^:]+):(.+)$")
        if source and value then
            identifiers[source] = value
        end
    end
    return identifiers
end

local identifiers = GetAllIdentifiers(player)
print(identifiers.discord) -- Will print the discord id for example (511108466056626188), if player doesn't have the discord identifier it will print nil
```
