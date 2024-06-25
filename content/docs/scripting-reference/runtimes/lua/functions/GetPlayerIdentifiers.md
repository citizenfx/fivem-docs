---
title: GetPlayerIdentifiers
---

Returns a table containing all of the player’s identifiers.

Syntax
------

```lua
GetPlayerIdentifiers(Player player)
```

### Required arguments
- **player**: The ID of the player to get the identifiers from.

License Types
--------

| Type ID    | Provider                 | Type                                                                      | Data Type |
|------------|--------------------------|---------------------------------------------------------------------------|-----------|
| `steam`    | Steam                    | [Steam Id](https://partner.steamgames.com/doc/webapi/isteamuserauth)      | hex       |
| `discord`  | Discord                  | [User Id](https://discord.com/developers/docs/resources/user#user-object) | int       |
| `xbl`      | Xbox Live                |                                                                           | int       |
| `live`     | Microsoft PUID           | Passport Unique Identifier                                                | int       |
| `license`  | Rockstar Online Services | Hash                                                                      | hex       |
| `license2` | Rockstar Online Services | Hash                                                                      | hex       |
| `fivem`    | CFX.re                   | User Id                                                                   | int       |
| `ip`       | IP Address               | IPv4                                                                      | string    |

\* `licence2` - This identifier is present if the user has switched Social Club accounts

** `license2` - This can be the same value as `license`


Examples
--------

Check for commonly used identifiers with this method;  works well when triggered by the `playerConnecting` event.

```lua
    local steamid  = false
    local license  = false
    local discord  = false
    local xbl      = false
    local liveid   = false
    local ip       = false

  for k,v in pairs(GetPlayerIdentifiers(source))do
    print(v)
        
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steamid = v
      elseif string.sub(v, 1, string.len("license:")) == "license:" then
        license = v
      elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
        xbl  = v
      elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
        ip = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("live:")) == "live:" then
        liveid = v
      end
    
  end
```
