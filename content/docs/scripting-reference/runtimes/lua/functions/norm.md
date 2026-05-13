---
title: norm
---

Normalizes a vector or quaternion. The result keeps the same direction but has a length of 1. This is useful when
you only care about the direction, not the distance. For quaternions, normalizing ensures the rotation stays accurate.

Syntax
------

```lua
vector2 norm(vector2 v)
vector3 norm(vector3 v)
vector4 norm(vector4 v)
quat    norm(quat q)
```

### Required arguments
- **v** / **q**: A [vector2][vec2], [vector3][vec3], [vector4][vec4], or [quat][quat] to normalize.

### Returns
A value of the same type as the input, with a length of 1.

Examples
--------

```lua
-- Normalize a vector3:
local v = vector3(3, 0, 0)
print(norm(v)) -- prints `vector3(1, 0, 0)`

-- The length of a normalized vector is always 1:
local v = vector3(1, 2, 3)
local n = norm(v)
print(#n) -- prints `1.0`

-- Direction is preserved:
local v = vector3(5, 5, 0)
print(norm(v)) -- prints `vector3(0.707, 0.707, 0)`

-- Works with vector2:
local v = vector2(3, 4)
print(norm(v)) -- prints `vector2(0.6, 0.8)`

-- Works with vector4:
local v = vector4(1, 2, 3, 4)
print(norm(v)) -- prints `vector4(0.18, 0.37, 0.55, 0.73)`

-- Works with quaternions:
local q = quat(1, 1, 1, 1)
print(norm(q))
```

Normalize a direction vector before scaling it to a specific distance:
```lua
local playerPed = PlayerPedId()
local forward, _, _, position = GetEntityMatrix(playerPed)

-- `forward` is already normalized, but if you calculate a direction
-- between two points, you should normalize it first:
local target = GetEntityCoords(someEntity)
local direction = norm(target - position)

-- Place a marker 10 units in that direction:
local markerPos = position + direction * 10.0
```

[vec2]: /docs/scripting-reference/runtimes/lua/functions/vector2/
[vec3]: /docs/scripting-reference/runtimes/lua/functions/vector3/
[vec4]: /docs/scripting-reference/runtimes/lua/functions/vector4/
[quat]: /docs/scripting-reference/runtimes/lua/functions/quat/
