---
title: Gamer tags
weight: 760
---

![All flags enabled](/HeadDisplayExample2.png "All flags enabled")

**Gamer tag** (also known as **head display**) - is an UI element above player character, which can display text and various icons. The control is carried out by enabling components. Usually used to display player's name.

For each component you can: show/hide, change opacity, change colour.

Components list
---------------

| ID  | Name                      |
|-----|---------------------------|
| 0   | GAMER\_NAME               |
| 1   | CREW\_TAG                 |
| 2   | healthArmour              |
| 3   | BIG\_TEXT                 |
| 4   | AUDIO\_ICON               |
| 5   | MP\_USING\_MENU           |
| 6   | MP\_PASSIVE\_MODE         |
| 7   | WANTED\_STARS             |
| 8   | MP\_DRIVER                |
| 9   | MP\_CO\_DRIVER            |
| 10  | MP\_TAGGED                |
| 11  | GAMER\_NAME\_NEARBY       |
| 12  | ARROW                     |
| 13  | MP\_PACKAGES              |
| 14  | INV\_IF\_PED\_FOLLOWING   |
| 15  | RANK\_TEXT                |
| 16  | MP\_TYPING                |
| 17  | MP\_BAG\_LARGE            |
| 18  | MP\_TAG\_ARROW            |
| 19  | MP\_GANG\_CEO             |
| 20  | MP\_GANG\_BIKER           |
| 21  | BIKER\_ARROW              |
| 22  | MC\_ROLE\_PRESIDENT       |
| 23  | MC\_ROLE\_VICE\_PRESIDENT |
| 24  | MC\_ROLE\_ROAD\_CAPTAIN   |
| 25  | MC\_ROLE\_SARGEANT        |
| 26  | MC\_ROLE\_ENFORCER        |
| 27  | MC\_ROLE\_PROSPECT        |
| 28  | MP\_TRANSMITTER           |
| 29  | MP\_BOMB                  |

Simple usage
------------
### Lua
For a more complete example, see the stock `playernames` resource included in the server package, or the documentation for the resource.

``` lua
local mpGamerTags = {}

for i = 0, 255 do
  if NetworkIsPlayerActive(i) and i ~= PlayerId() then
    local ped = GetPlayerPed(i)

    -- change the ped, because changing player models may recreate the ped
    if not mpGamerTags[i] or mpGamerTags[i].ped ~= ped then
      local nameTag = ('%s [%d]'):format(GetPlayerName(i), GetPlayerServerId(i))

      if mpGamerTags[i] then
        RemoveMpGamerTag(mpGamerTags[i].tag)
      end

      mpGamerTags[i] = {
        tag = CreateMpGamerTagForNetPlayer(i, nameTag, false, false, '', 0, 0, 0, 0),
        ped = ped
      }
    end

    SetMpGamerTagVisibility(mpGamerTags[i].tag, 4, NetworkIsPlayerTalking(i))
  elseif mpGamerTags[i] then
    RemoveMpGamerTag(mpGamerTags[i].tag)

    mpGamerTags[i] = nil
  end
end
```

Example
-------

### Lua

``` lua
-- Create gamer info
local gamerTagId = CreateMpGamerTagForNetPlayer(
  ped, -- Ped to which gamer info will be assigned
  "User name", -- String to display for flag ""
  false, -- pointedClanTag
  false, -- Is R* clan
  "", -- Clantag
  0, -- Clantag flags
  0, -- red
  0, -- green
  0 -- blue
)
```

### C\#

``` csharp
// Create gamer info
// assuming using static CitizenFX.Core.API;
int gamerTagId = CreateMpGamerTagForNetPlayer(
  ped.Handle, // Ped to which gamer info will be assigned
  "User name", // String to display for flag ""
  false, // pointedClanTag
  false, // Is R* clan
  clanTag,
  0, // Clantag flags
  0, // red
  0, // green
  0  // blue
);
```



Toggling flags
--------------

### Lua

``` lua
-- Toggle components
SetMpGamerTagVisibility(
  gamerTagId,
  component,
  bool -- Toggle
)
```

### C\#

``` csharp
// Toggle flags
SetMpGamerTagVisibility(
  gamerTagId,
  component,
  toggle
);
```



Changing flags colour
---------------------

### Lua

``` lua
-- Change component colour
SetMpGamerTagColour(
  gamerTagId,
  component,
  colour -- 0 - 255
)
```

### C\#

``` csharp
// Change component colour
Function.Call(
  (Hash)0x613ED644950626AE,
  (int)gamerTagId,
  (int)component,
  (int)colour // 0 - 255
);
```



Changing flags opacity
----------------------

### Lua

``` lua
-- Change component opacity
SetMpGamerTagAlpha(
  gamerTagId,
  component,
  opacity -- 0 - 255
)
```

### C\#

``` csharp
// Changes flag opacity
Function.Call(
  (Hash)0xD48FE545CD46F857,
  (int)gamerTagId,
  (int)component,
  (int)opacity // 0 - 255
);
```


Special flags controls
----------------------

### Wanted level

For the **WantedStar** flag you can set number that will be shown inside of star icon: ### Lua

``` lua
-- Set the number that will be set inside the wanted star icon
SetMpGamerTagWantedLevel(
  gamerTagId,
  wantedLevel -- 0 - 5
)
```

### C\#

``` csharp
// Set the number that will be set inside the wanted star icon
Function.Call(
  Hash._SET_HEAD_DISPLAY_WANTED,
  (int)gamerTagId,
  (int)wantedLevel // 0 - 5
);
```

### Health bar colour

Health bar has 0 opacity by default. Colour of health bar changes using it's own native: ### Lua

### Lua

``` lua
-- Change health bar colour
SetMpGamerTagHealthBarColor(
  gamerTagId,
  colour -- 0 - 255
)
```

### C\#

``` csharp
// Change health bar colour
Function.Call(
  (Hash)0x3158C77A7E888AB4,
  (int)gamerTagId,
  (int)colour // 0 - 255
);
```
