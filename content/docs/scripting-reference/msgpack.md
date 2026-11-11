---
title: MessagePack
weight: 55
---

FiveM includes embedded support for MessagePack, a highly efficient binary serialization format, across Lua, JavaScript, and C# runtimes. The Lua runtime uses the [msgpack](https://github.com/citizenfx/lua-cmsgpack) library to serialize and deserialize data, enabling compact and optimized data transmission between clients and servers.

## Reserved Extension Types

FiveM reserves specific extension types for internal use. Support differs by runtime.

| ID | Name | Runtimes |
|----|------|----------|
| 10 | FuncRef | Lua, JavaScript, C# |
| 11 | LocalFuncRef | Lua, JavaScript, C# |
| 20 | Vector2 | Lua, C# |
| 21 | Vector3 | Lua, C# |
| 22 | Vector4 | Lua, C# |
| 23 | Quaternion | Lua, C# |
| 41 | Entity | Lua, JavaScript |
| 42 | Player | Lua, JavaScript |

JavaScript cannot unpack vectors or quaternions (20-23); they arrive as raw extension buffers.

Lua reserves only 20-23. Calling `msgpack.extend` on 10, 11, 41, or 42 is allowed, but it silently replaces function references or `Entity()`/`Player()` handling. Do not use those IDs for custom types.

## Lua API

### Encoding and Decoding

In the Lua runtime, you can use the built-in `msgpack.pack`, `msgpack.pack_args` and `msgpack.unpack` functions for serialization and deserialization.
This allows you to convert Lua tables into a MessagePack-encoded binary string and vice versa.
It is particularly useful for handling large or complex data structures in multiplayer interactions.

### Examples

Using `msgpack.pack`
```lua
-- Define the player data
local player = {
    source = 1,
    name = 'JohnDoe'
}

-- Serialize the player data into a binary string
local serialized = msgpack.pack(player)

-- Deserialize the binary string back into the original Lua data structure
local deserialized = msgpack.unpack(serialized)

-- Output the player's source
print(deserialized.source) -- Output: 1
```

Using `msgpack.pack_args`
```lua
-- Define player data
local player = {
    source = 1,
    name = 'JohnDoe'
}

-- Define player items
local playerItems = {
    { name = "bread", count = 1 }
}

-- Serialize player and item data into a binary string
local serializedData = msgpack.pack_args(player, playerItems)

-- Deserialize the binary data back into Lua data structures
local deserialized = msgpack.unpack(serializedData)

-- Extract player and items data from the deserialized result
local playerData = deserialized[1]
local itemsData = deserialized[2]

-- Print the player's source and the items in JSON format
print(playerData.source, json.encode(itemsData)) -- Output: 1, [{"name":"bread","count":1}]
```

Adding custom types
```lua
-- Define a custom type
local myCustomType = {}

-- Set the custom type metatable
setmetatable(myCustomType, {
    -- Constructor function
    __call = function(self --[[myCustomType]], arg1, arg2, arg3)
        return setmetatable({
            value1 = arg1,
            value2 = arg2,
            value3 = arg3
        }, getmetatable(self))
    end,

    -- Extension type used for serialization and deserialization reference
    -- A number between 0 and 127 other than the reserved IDs 20-23
    __ext = 90, --[[number]]

    -- Pack function for serialization
    __pack = function(instance --[[myCustomType]], extensionType --[[number]])
        return json.encode({
            value1 = instance.value1,
            value2 = instance.value2,
            value3 = instance.value3
        })
    end,

    __unpack = function(encodedData --[[string]], extensionType --[[number]])
        local data = json.decode(encodedData)
        return myCustomType(data.value1, data.value2, data.value3)
    end
})

-- Register the custom type with MessagePack
msgpack.extend(getmetatable(myCustomType))

-- Define an instance of the custom type
local customInstance = myCustomType(1, 2, 3)

-- Serialize the custom instance into a binary string
local serializedCustom = msgpack.pack(customInstance)

-- Deserialize the binary string back into the original custom instance
local deserializedCustom = msgpack.unpack(serializedCustom)

-- Output the custom instance values
print(deserializedCustom.value1, deserializedCustom.value2, deserializedCustom.value3) -- Output: 1, 2, 3

-- Output the custom instance type
local metatable = getmetatable(deserializedCustom)
print(metatable == getmetatable(myCustomType)) -- Output: true
```

## JavaScript API

### Encoding and Decoding

The JavaScript runtime exposes `msgpack_pack` and `msgpack_unpack`. `msgpack_pack` serializes a value into a `Uint8Array`, and `msgpack_unpack` deserializes a `Uint8Array` back into a value.

### Examples

Using `msgpack_pack` and `msgpack_unpack`
```ts
// Define a player object
const player = {
    source: 1,
    name: 'JohnDoe'
};

// Serialize the player object into a Uint8Array
const serialized = msgpack_pack(player);

// Deserialize the Uint8Array back into the original object
const deserialized = msgpack_unpack(serialized);

// Log the player's source
console.log(deserialized.source); // Output: 1
```

## C# API

C# has no public MessagePack API. Vectors and quaternions are serialized automatically as extension types 20-23 when passed through events or exports.
