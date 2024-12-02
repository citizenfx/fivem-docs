---
title: GetPlayerIdentifiers
---

Returns a table containing all of the player’s identifiers.

### Syntax

```lua
GetPlayerIdentifiers(Player player)
```

#### Required arguments
* **player**: The ID of the player to get the identifiers from.

### Identifier Types

| Type ID    | Provider                 | Type                                                                      | Data Type |
|------------|--------------------------|---------------------------------------------------------------------------|-----------|
| `steam`    | Steam                    | [Steam Id](https://partner.steamgames.com/doc/webapi/isteamuserauth)      | hex       |
| `discord`  | Discord                  | [User Id](https://discord.com/developers/docs/resources/user#user-object) | int       |
| `xbl`      | Xbox Live                |                                                                           | int       |
| `live`     | Microsoft PUID           | Passport Unique Identifier                                                | int       |
| `license`  | Rockstar Online Services | Hash                                                                      | hex       |
| `license2` | Rockstar Online Services | Hash                                                                      | hex       |
| `fivem`    | Cfx.re                   | User Id                                                                   | int       |
| `ip`       | IP Address               | IPv4                                                                      | string    |

* `license2` - This identifier is the ROS license for people who use Steam, this identifier can be the same value as `license`


### Examples

Check for commonly used identifiers with this method;  works well when triggered by the `playerConnecting` event.

{{% alert color="info" %}}
If you only need to get a single identifier you can use {{% native_link "GET_PLAYER_IDENTIFIER_BY_TYPE" %}}, if you need to get multiple you should use the below example.
{{% /alert %}}

```lua
local identifiers = {}
local playerIdents = GetPlayerIdentifiers(source)

for i = 1, #playerIdents do
  local ident = playerIdentifiers[i]
  local colonPosition = string.find(ident, ":") - 1
  local identifierType = string.sub(ident, 1, colonPosition)
  identifiers[identifierType] = ident
end

-- if you want the fivem identifier you would do this:
print(identifiers["fivem"]) -- returns fivem:123456789
```
