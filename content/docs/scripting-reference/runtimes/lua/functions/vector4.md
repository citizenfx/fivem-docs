---
title: vector4
alias: vec4
---

Creates a new vector4 value.

In FiveM's Lua runtime, vectors are real data types, just like numbers, bools and strings are.
This means that `type(vector4(1, 2, 3, 4))` will return `vector4`.
More about this in the [Lua runtime manual][lua-runtime].

Syntax
------

```lua
vector4 vector4(float x, float y, float z, float w)
```

### Required arguments
- **x**: A floating point number representing the `x` value of your vector.
- **y**: A floating point number representing the `y` value of your vector.
- **z**: A floating point number representing the `z` value of your vector.
- **w**: A floating point number representing the `w` value of your vector.

Examples
--------

```lua
-- Basic vector with zero length:
vector4(0, 0, 0, 0)

-- Vectors are a real data type:
local v = vector4(1, 2, 3, 4)
print(type(v)) -- prints `vector4`

-- Vectors support equality operators:
local v1 = vector4(1, 2, 3, 4)
local v2 = vector4(1, 2, 3, 4)
local v3 = vector4(5, 6, 7, 8)
print(v1 == v2) -- prints `true`
print(v1 == v3) -- prints `false`
print(v1 ~= v3) -- prints `true`

-- Arithmetic operations between vectors are supported:
local v = vector4(1, 2, 3, 4)
print(v + 2) -- prints `vector4(3, 4, 5, 6)`
print(v - 2) -- prints `vector4(-1, 0, 1, 2)`
print(v * 2) -- prints `vector4(1, 4, 6, 8)`
print(v / 2) -- prints `vector4(0.5, 1, 1.5, 2)`

-- Or even with another vector:
local v1 = vector4(1, 2, 3, 4)
local v2 = vector4(5, 6, 7, 8)
print(v1 + v2) -- prints `vector4(6, 8, 9, 12)`
print(v1 - v2) -- prints `vector4(-4, -4, -4)`
print(v1 * v2) -- prints `vector4(5, 12, 21, 32)`
print(v1 / v2) -- prints `vector4(0.2, 0.33, 0.43, 0.5)`

-- Vectors can be inverted:
local v = vector4(1, 2, 3, 4)
print(-v) -- prints `vector4(-1, -2, -3, -4)`

-- The length of the vector can be retrieved (pythagoras):
local v = vector4(1, 2, 3, 4)
print(#v) -- prints `5.477`

-- Vectors can be normalized:
local v = vector4(1, 2, 3, 4)
print(norm(v)) -- prints `vector4(0.1825742, 0.3651484, 0.5477225, 0.7302967)`

-- Unpacking works:
local v = vector4(1, 2, 3, 4)
local x, y, z, w = table.unpack(v)

-- To get the individual values from a vector:
local v = vector4(1, 2, 3, 4)
print(v.x) -- prints `1`
print(v.y) -- prints `2`
print(v.z) -- prints `3`
print(v.w) -- prints `4`

-- Vectors support arbitrary swizzling:
local v = vector4(1, 2, 3, 4)
print(v.yx)   -- prints `vector2(2, 1)`
print(v.wz)   -- prints `vector2(4, 3)`
print(v.xyx)  -- prints `vector3(1, 2, 1)`
print(v.ywz)  -- prints `vector3(2, 4, 3)`
print(v.yxyx) -- prints `vector4(2, 1, 2, 1)`
print(v.zxwy) -- prints `vector4(3, 1, 4, 2)`
```

[lua-runtime]: /docs/scripting-manual/runtimes/lua
