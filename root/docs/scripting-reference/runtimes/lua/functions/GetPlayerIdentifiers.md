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

Examples
--------

Check for all possible identifiers using this method;  works well when triggered by playerConnecting event.

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
