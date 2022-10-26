---
title: mapmanager
---

Mapmanager
------
Mapmanager is an included citizenfx resource that handles map changes, game types, and compatibility between gametypes and maps.





Resource Structure
------

### Client Scripts

- mapmanager_client.lua

### Server Scripts

- mapmanager_server.lua

## Shared Scripts

- mapmanager_shared.lua

Exports
------

Exports are called using exports["mapmanger"]:exportname(args)


### getCurrentGameType

Returns the current game type.

Arguments :
None

```lua
-- mapmanager_server.lua

function getCurrentGameType()
    return currentGameType
end
```

### getCurrentMap

Returns the current map.

Arguments :
None


```lua
-- mapmanager_server.lua

function getCurrentMap()
    return currentMap
end
```

### changeGameType

Changes the current game type.

Arguments :
gameType

```lua
-- mapmanager_server.lua

function changeGameType(gameType)
    if currentMap and not doesMapSupportGameType(gameType, currentMap) then
        StopResource(currentMap)
    end

    if currentGameType then
        StopResource(currentGameType)
    end

    StartResource(gameType)
end
```

### changeMap

Changes the current map

Arguments :
map

```lua
-- mapmanager_server.lua


function changeMap(map)
    if currentMap then
        StopResource(currentMap)
    end

    StartResource(map)
end
```

### doesMapSupportGameType

Returns a bool variables as to whether or not a map supports a game type.

Arguments :
gameType
map

```lua
-- mapmanager_server.lua

function doesMapSupportGameType(gameType, map)
    if not gametypes[gameType] then
        return false
    end

    if not maps[map] then
        return false
    end

    if not maps[map].gameTypes then
        return true
    end

    return maps[map].gameTypes[gameType]
end
```

### getMaps

Returns a table of all available maps.

Arguments :
None

```lua
-- mapmanager_server.lua

function getMaps()
    return maps
end
```

### roundEnded

Will end a round.

Arguments :
None


```lua
-- mapmanager_server.lua

function roundEnded()
    SetTimeout(50, handleRoundEnd)
end
```
