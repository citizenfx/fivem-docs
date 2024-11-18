---
title: msgpack
---

FiveM includes embedded support for [MessagePack](https://github.com/thers/msgpack-lite/), a highly efficient binary serialization format. This functionality is available across Lua, JavaScript, and C# runtimes, enabling compact and optimized data transmission between clients and servers.

## Key Features

| Feature                     | Description                                                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------|
| Compact Serialization       | Converts structured data into a compact binary format for efficient transmission.           |
| Cross-Language Support      | Ensures seamless compatibility between Lua, JavaScript, and C# MessagePack implementations. |
| Built-In Functions          | No external libraries are required; FiveM provides native MessagePack support.              |


## Reserved Extension Types

FiveM reserves specific extension types for internal use, ensuring compatibility across different runtimes.

Some of the reserved extension types such as `Vector2`, `Vector3`, `Vector4`, `Quaternion` where added to CFXLua and need conversion to be used in JavaScript or C#.

```ts
enum ReservedExtensionTypes {
    FunRef = 10,
    LocalFuncRef = 11,
    Vector2 = 20,
    Vector3 = 21,
    Vector4 = 22,
    Quaternion = 23,
    EntityState = 41,
    PlayerState = 42
}
```

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
    -- A number between 0 and 127 not in ReserverExtensionTypes enum
    __ext = 90, --[[number]]
    -- Pack function for serialization
    __pack = function(instance --[[myCustomType]], extensionType --[[number]])
        return json.encode({
            value1 = arg1,
            value2 = arg2,
            value3 = arg3
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

The JavaScript runtime includes embedded `msgpack.encode`, `msgpack.decode`, `msgpack_pack` and `msgpack_unpack` functions.
These methods allow you to serialize JavaScript objects into binary format for network transmission and deserialize binary data back into usable objects.
The API seamlessly integrates with other FiveM JavaScript utilities, making it straightforward to handle structured data.

### Internal [codec](https://github.com/thers/msgpack-lite/blob/master/lib/codec-base.js)

The JavaScript runtime includes a built-in codec for encoding and decoding data.
This codec powers functions like **[emit](/docs/scripting-reference/runtimes/javascript/functions/emit-server)**, **[emitNet](/docs/scripting-reference/runtimes/javascript/functions/emitNet-server)**, **[on](/docs/scripting-reference/runtimes/javascript/functions/on-server)**, **[onNet](/docs/scripting-reference/runtimes/javascript/functions/onNet-server)**.
To utilize this functionality directly, you can use the global functions `msgpack_pack` and `msgpack_unpack`.

### Structures
```ts
function msgpack_pack(data: any): string // Internal codec serialization function
function msgpack_unpack(data: string): any // Internal codec deserialization function
```

### Examples

Using internal codec
```ts
// Define a player object
const player = {
    source: 1,
    name: 'JohnDoe'
};

// Serialize the player object into a binary string using the internal codec
const serialized = msgpack_pack(player);

// Deserialize the binary string back into the original JavaScript object
const deserialized = msgpack_unpack(serialized);

// Access and log the 'source' property from the deserialized object
console.log(deserialized.source); // Output: 1
```

Using `msgpack.encode` and `msgpack.decode`
```ts
// Create a custom MessagePack codec
const codec = msgpack.createCodec();

// Serialize the player object into a binary string using the custom codec
const serialized = msgpack.encode(player, { codec });

// Deserialize the binary string back into the original JavaScript object
const deserialized = msgpack.decode(serialized, { codec });

// Log the 'source' property from the deserialized object
console.log(deserialized.source); // Output: 1
```

Adding custom types
```ts
// Use msgpack_codec for serializing and deserializing data (e.g., StateBag, events), or opt for a custom codec if needed
const codec = msgpack_codec;

// Define a custom type with name and value
class MyCustomType {
    constructor(name, value) {
        this.name = name;
        this.value = value;
    }
}

// Set up the serialization behavior for MyCustomType using the identifier (96)
msgpack_codec.addExtPacker(96, MyCustomType, (instance) => {
    // Serialize the MyCustomType instance to a binary string, including the name and value
    return msgpack.encode({ name: instance.name, value: instance.value });
});

// Set up the deserialization behavior for MyCustomType using the same identifier (96)
msgpack_codec.addExtUnpacker(96, (data) => {
    // Deserialize the binary string and reconstruct the MyCustomType instance
    const { name, value } = msgpack.decode(data);
    return new MyCustomType(name, value);
});

// Serialize an instance of MyCustomType to a binary string
const serialized = msgpack_pack(new MyCustomType('SomeRandomName', 'SomeRandomValue'));

// Deserialize the binary string back into a MyCustomType instance
const deserialized = msgpack_unpack(serialized);

// Output the deserialized object and check if it's an instance of MyCustomType
console.log(deserialized, deserialized instanceof MyCustomType); // Output: true, MyCustomType instance
```

## C# API
TODO

## Example Scenarios

- **Lua to JavaScript**: A Lua client serializes a player's state and sends it to a JavaScript server, where it is deserialized and processed.
- **JavaScript to C#**: A JavaScript client sends serialized configuration data to a C# server for persistent storage or advanced processing.
- **C# to Lua**: A C# server encodes and sends a player's inventory to a Lua client, which unpacks it for display or interaction.
