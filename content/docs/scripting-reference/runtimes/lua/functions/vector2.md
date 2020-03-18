---
title: vector2
alias: vec2
---

Creates a new vector2 value.

In FiveM's Lua runtime, vectors are real data types, just like numbers, bools and strings are.
This means that `type(vector2(1, 2))` will return `vector2`.
More about this in the [Lua runtime manual][lua-runtime].

Syntax
------

```lua
vector2 vector2(float x, float y)
```

### Required arguments
- **x**: A floating point number representing the `x` value of your vector.
- **y**: A floating point number representing the `y` value of your vector.

Examples
--------
Basic vector2 functionality:

```lua
-- Basic vector with zero length:
vector2(0, 0)

-- Vectors are a real data type:
local v = vector2(1, 2)
print(type(v)) -- prints `vector2`

-- Vectors support equality operators:
local v1 = vector2(1, 2)
local v2 = vector2(1, 2)
local v3 = vector2(3, 4)
print(v1 == v2) -- prints `true`
print(v1 == v3) -- prints `false`
print(v1 ~= v3) -- prints `true`

-- Arithmetic operations between vectors are supported:
local v = vector2(1, 2)
print(v + 2) -- prints `vector2(3, 4)`
print(v - 2) -- prints `vector2(-1, 0)`
print(v * 2) -- prints `vector2(1, 4)`
print(v / 2) -- prints `vector2(0.5, 1)`

-- Or even with another vector:
local v1 = vector2(1, 2)
local v2 = vector2(3, 4)
print(v1 + v2) -- prints `vector2(4, 6)`
print(v1 - v2) -- prints `vector2(-2, -2)`
print(v1 * v2) -- prints `vector2(3, 8)`
print(v1 / v2) -- prints `vector2(0.33, 0.5)`

-- Vectors can be inverted:
local v = vector2(1, 2)
print(-v) -- prints `vector2(-1, -2)`

-- The length of the vector can be retrieved (pythagoras):
local v = vector2(1, 2)
print(#v) -- prints `2.236`

-- Vectors can be normalized:
local v = vector2(1, 2)
print(norm(v)) -- prints `vector2(0.45, 0.89)`

-- Unpacking works:
local v = vector2(1, 2)
local x, y = table.unpack(v)

-- To get the individual values from a vector:
local v = vector2(1, 2)
print(v.x) -- prints `1`
print(v.y) -- prints `2`

-- Vectors support arbitrary swizzling:
local v = vector2(1, 2)
print(v.yx)   -- prints `vector2(2, 1)`
print(v.xyx)  -- prints `vector3(1, 2, 1)`
print(v.yxyx) -- prints `vector4(2, 1, 2, 1)`
```

[lua-runtime]: /docs/scripting-manual/runtimes/lua
