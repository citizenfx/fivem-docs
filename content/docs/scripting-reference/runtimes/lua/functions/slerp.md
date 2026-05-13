---
title: slerp
---

Smoothly interpolates between two vectors or quaternions using [spherical linear interpolation][wiki-slerp] (slerp).
Unlike regular linear interpolation, slerp follows the shortest path along a curve, which keeps the motion smooth
and even. This makes it a good choice for blending between rotations or directions.

Syntax
------

```lua
vector2 slerp(vector2 x, vector2 y, float a)
vector3 slerp(vector3 x, vector3 y, float a)
vector4 slerp(vector4 x, vector4 y, float a)
quat    slerp(quat x, quat y, float a)
```

### Required arguments
- **x**: The starting [vector2][vec2], [vector3][vec3], [vector4][vec4], or [quat][quat].
- **y**: The ending value, must be the same type as `x`.
- **a**: A floating point number representing the interpolation factor, typically between `0.0` and `1.0`.

### Returns
A value of the same type as `x` and `y`. When `a` is `0.0` the result equals `x`, when `a` is `1.0` the result
equals `y`, and values in between blend smoothly from `x` to `y`.

Examples
--------

```lua
-- Interpolate halfway between two vector3 directions:
local v1 = vector3(1, 0, 0) -- right
local v2 = vector3(0, 1, 0) -- up
print(slerp(v1, v2, 0.5))   -- halfway between right and up

-- At the boundaries:
print(slerp(v1, v2, 0.0)) -- prints `vector3(1, 0, 0)` (equals v1)
print(slerp(v1, v2, 1.0)) -- prints `vector3(0, 1, 0)` (equals v2)

-- Works with quaternions for smooth rotation interpolation:
local q1 = quat(0, vector3(0, 0, 1))   -- no rotation
local q2 = quat(90, vector3(0, 0, 1))  -- 90 degrees around Z
local qMid = slerp(q1, q2, 0.5)        -- 45 degrees around Z

-- Works with vector2:
local v1 = vector2(1, 0)
local v2 = vector2(0, 1)
print(slerp(v1, v2, 0.5))
```

Smoothly rotate a vehicle towards a target rotation over time:
```lua
local vehicle = GetVehiclePedIsIn(PlayerPedId())
local x, y, z, w = GetEntityQuaternion(vehicle)
local currentRot = quat(w, x, y, z)

local targetRot = quat(90, vector3(0, 0, 1))

-- Interpolate 10% of the way towards the target each frame:
local newRot = slerp(currentRot, targetRot, 0.1)
SetEntityQuaternion(vehicle, newRot.x, newRot.y, newRot.z, newRot.w)
```

[vec2]: /docs/scripting-reference/runtimes/lua/functions/vector2/
[vec3]: /docs/scripting-reference/runtimes/lua/functions/vector3/
[vec4]: /docs/scripting-reference/runtimes/lua/functions/vector4/
[quat]: /docs/scripting-reference/runtimes/lua/functions/quat/
[wiki-slerp]: https://en.wikipedia.org/wiki/Slerp
