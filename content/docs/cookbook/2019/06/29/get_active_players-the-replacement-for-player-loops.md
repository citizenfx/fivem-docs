---
title: "GET_ACTIVE_PLAYERS: the replacement for player loops"
date: 2019-06-29T18:01:45.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **June 29, 2019**. Newer information may exist.
{{< /alert >}}

Just a quick hint: when writing new client-side scripts in Lua/JS (C# already has the `Players` list doing exactly this), you can loop through players by using the [GET\_ACTIVE\_PLAYERS](https://docs.fivem.net/natives/?_0xCF143FB9) native. See below for an example of before/after:

### Before...

```lua
for i = 0, 255 do
    if NetworkIsPlayerActive(i) then
        local ped = GetPlayerPed(i)
        -- do stuff
    end
end
```

### After...

```lua
for _, player in ipairs(GetActivePlayers()) do
    local ped = GetPlayerPed(player)
    -- do stuff
end
```

This should be a bit more performant than 256 native invocations, even if no player slot exists, and it also doesn't differ based on server-side sync technology slot count - all players with an active ped should be returned by this native.

---

*Original discussion thread: [https://forum.fivem.net/t/get-active-players-the-replacement-for-player-loops/613425](https://forum.fivem.net/t/get-active-players-the-replacement-for-player-loops/613425)*
