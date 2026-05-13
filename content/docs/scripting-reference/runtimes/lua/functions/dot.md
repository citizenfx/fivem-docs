---
title: dot
---

Calculates the [dot product][wiki-dot] of two values. The dot product returns a single number that tells you how
much two vectors or quaternions point in the same direction. It's useful for checking angles between vectors, checking
if vectors point in the same direction, and projecting one vector onto another.

Syntax
------

```lua
number dot(vector2 x, vector2 y)
number dot(vector3 x, vector3 y)
number dot(vector4 x, vector4 y)
number dot(quat x, quat y)
```

### Required arguments
- **x**: A [vector2][vec2], [vector3][vec3], [vector4][vec4], or [quat][quat].
- **y**: A value of the same type as `x`.

### Returns
A number representing the dot product of the two values.

Examples
--------

```lua
-- Dot product of two vector3 values:
local v1 = vector3(1, 0, 0)
local v2 = vector3(0, 1, 0)
print(dot(v1, v2)) -- prints `0` (perpendicular vectors)

-- Vectors pointing in the same direction return the product of their lengths:
local v1 = vector3(1, 0, 0)
local v2 = vector3(1, 0, 0)
print(dot(v1, v2)) -- prints `1`

-- Opposite vectors have a negative dot product:
local v1 = vector3(1, 0, 0)
local v2 = vector3(-1, 0, 0)
print(dot(v1, v2)) -- prints `-1`

-- Works with vector2:
local v1 = vector2(3, 4)
local v2 = vector2(1, 0)
print(dot(v1, v2)) -- prints `3`

-- Works with quaternions:
local q1 = quat(1, 0, 0, 0)
local q2 = quat(1, 0, 0, 0)
print(dot(q1, q2)) -- prints `1`
```

Check if an entity is roughly in front of the player:
```lua
local playerPed = PlayerPedId()
local forward, _, _, playerPos = GetEntityMatrix(playerPed)

local entityPos = GetEntityCoords(someEntity)
local toEntity = norm(entityPos - playerPos)

-- A positive dot product means the entity is in front:
if dot(forward, toEntity) > 0 then
    print("Entity is in front of the player")
end
```

[vec2]: /docs/scripting-reference/runtimes/lua/functions/vector2/
[vec3]: /docs/scripting-reference/runtimes/lua/functions/vector3/
[vec4]: /docs/scripting-reference/runtimes/lua/functions/vector4/
[quat]: /docs/scripting-reference/runtimes/lua/functions/quat/
[wiki-dot]: https://en.wikipedia.org/wiki/Dot_product
