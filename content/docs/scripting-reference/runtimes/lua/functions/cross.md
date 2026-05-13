---
title: cross
---

Calculates the [cross product][wiki-cross] of two values. The result depends on the input types: for two vector3
values it returns a new vector3 perpendicular to both inputs, for two vector2 values it returns a number that is
positive or negative depending on whether the second vector is to the left or right of the first, and for quaternions
it combines two rotations into one.

Syntax
------

```lua
number  cross(vector2 x, vector2 y)
vector3 cross(vector3 x, vector3 y)
vector3 cross(vector3 x, quat y)
vector3 cross(quat x, vector3 y)
quat    cross(quat x, quat y)
```

### Required arguments
- **x**: A [vector2][vec2], [vector3][vec3], or [quat][quat].
- **y**: A [vector2][vec2], [vector3][vec3], or [quat][quat]. See the syntax overview above for the supported type combinations.

### Returns
- For two `vector2` values: a number (the 2D cross product).
- For two `vector3` values: a [vector3][vec3] perpendicular to both inputs.
- For a `vector3` and a `quat` (or vice versa): a [vector3][vec3].
- For two `quat` values: a [quat][quat].

Examples
--------

```lua
-- Cross product of two vector3 values:
local v1 = vector3(1, 0, 0) -- right
local v2 = vector3(0, 1, 0) -- up
print(cross(v1, v2)) -- prints `vector3(0, 0, 1)` (forward)

-- Order matters, swapping the arguments inverts the result:
print(cross(v2, v1)) -- prints `vector3(0, 0, -1)`

-- Cross product of two parallel vectors is the zero vector:
local v1 = vector3(1, 0, 0)
local v2 = vector3(2, 0, 0)
print(cross(v1, v2)) -- prints `vector3(0, 0, 0)`

-- 2D cross product returns a scalar:
local v1 = vector2(1, 0)
local v2 = vector2(0, 1)
print(cross(v1, v2)) -- prints `1`

-- Cross product of two quaternions combines the rotations:
local q1 = quat(90, vector3(1, 0, 0))
local q2 = quat(90, vector3(0, 1, 0))
local q3 = cross(q1, q2)
```

Get the surface normal from three points in the world:
```lua
local p1 = vector3(0, 0, 0)
local p2 = vector3(1, 0, 0)
local p3 = vector3(0, 1, 0)

local edge1 = p2 - p1
local edge2 = p3 - p1
local normal = norm(cross(edge1, edge2))

print(normal) -- prints `vector3(0, 0, 1)`
```

[vec2]: /docs/scripting-reference/runtimes/lua/functions/vector2/
[vec3]: /docs/scripting-reference/runtimes/lua/functions/vector3/
[quat]: /docs/scripting-reference/runtimes/lua/functions/quat/
[wiki-cross]: https://en.wikipedia.org/wiki/Cross_product
