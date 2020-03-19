---
title: vector3
alias: vec3
---

Creates a new vector3 value.

In FiveM's Lua runtime, vectors are real data types, just like numbers, bools and strings are.
This means that `type(vector3(1, 2, 3))` will return `vector3`.
More about this in the [Lua runtime manual][lua-runtime].

Many existing natives such as `GetEntityCoords` and `SetEntityCoords` already have first class support for vector3
values. For example, `GetEntityCoords` returns a vector3, whereas `SetEntityCoords` accepts one, instead of using
individual `x, y, z` values. See the second example below for a real world use of vector3, or read more about them
in the [Lua runtime manual][lua-runtime] and [native functions manual][natives-manual].

Syntax
------

```lua
vector3 vector3(float x, float y, float z)
```

### Required arguments
- **x**: A floating point number representing the `x` value of your vector.
- **y**: A floating point number representing the `y` value of your vector.
- **z**: A floating point number representing the `z` value of your vector.

Examples
--------

Basic vector3 functionality:

```lua
-- Basic vector with zero length:
vector3(0, 0, 0)

-- Vectors are a real data type:
local v = vector3(1, 2, 3)
print(type(v)) -- prints `vector3`

-- Vectors support equality operators:
local v1 = vector3(1, 2, 3)
local v2 = vector3(1, 2, 3)
local v3 = vector3(4, 5, 6)
print(v1 == v2) -- prints `true`
print(v1 == v3) -- prints `false`
print(v1 ~= v3) -- prints `true`

-- Arithmetic operations between vectors are supported:
local v = vector3(1, 2, 3)
print(v + 2) -- prints `vector3(3, 4, 5)`
print(v - 2) -- prints `vector3(-1, 0, 1)`
print(v * 2) -- prints `vector3(1, 4, 6)`
print(v / 2) -- prints `vector3(0.5, 1, 1.5)`

-- Or even with another vector:
local v1 = vector3(1, 2, 3)
local v2 = vector3(4, 5, 6)
print(v1 + v2) -- prints `vector3(5, 7, 9)`
print(v1 - v2) -- prints `vector3(-3, -3, -3)`
print(v1 * v2) -- prints `vector3(4, 10, 18)`
print(v1 / v2) -- prints `vector3(0.25, 0.4, 0.5)`

-- Vectors can be inverted:
local v = vector3(1, 2, 3)
print(-v) -- prints `vector3(-1, -2, -3)`

-- The length of the vector can be retrieved (pythagoras):
local v = vector3(1, 2, 3)
print(#v) -- prints `3.742`

-- Vectors can be normalized:
local v = vector3(1, 2, 3)
print(norm(v)) -- prints `vector3(0.27, 0.53, 0.80)`

-- Unpacking works:
local v = vector3(1, 2, 3)
local x, y, z = table.unpack(v)

-- To get the individual values from a vector:
local v = vector3(1, 2, 3)
print(v.x) -- prints `1`
print(v.y) -- prints `2`
print(v.z) -- prints `3`

-- Vectors support arbitrary swizzling:
local v = vector3(1, 2, 3)
print(v.yx)   -- prints `vector2(2, 1)`
print(v.zx)   -- prints `vector2(3, 1)`
print(v.xyx)  -- prints `vector3(1, 2, 1)`
print(v.yxyx) -- prints `vector4(2, 1, 2, 1)`
print(v.zxxy) -- prints `vector4(3, 1, 1, 2)`
```

Since many native functions already return and support vectors in Lua, you can do the following to push your vehicle
forward 5 meters relative to its own axis:
```lua
-- Get your vehicle's current matrix.
local vehicle = GetVehiclePedIsIn(PlayerPedId())
local _, forwardVector, _, position = GetEntityMatrix(vehicle)

-- Multiply the vector by 5, and add it to the current position.
-- Since directional vectors should usually have a length of 1, this works great.
local newPosition = (forwardVector * 5) + position

-- Update the vehicle position.
SetEntityCoords(vehicle, newPosition)
```

[lua-runtime]: /docs/scripting-manual/runtimes/lua
[natives-manual]: /docs/scripting-manual/introduction/about-native-functions
