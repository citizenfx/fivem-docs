---
title: quat
---

Creates a new quaternion. Quaternions are incredibly useful to represent and calculate rotations in 3D world space.
Unlike the more common [euler angles][wiki-euler], [quaternions][wiki-quats] are immune to [gimbal lock][wiki-gimbal]
and are therefore much more suitable for transforming rotations.

In FiveM's Lua runtime, quaternions are real data types, just like numbers, bools and strings are.
This means that `type(quat(1, 0, 0, 0))` will return `quat`. More about this in the [Lua runtime manual][lua-runtime].

If you're looking for a good way to visualize quaternions, try <https://quaternions.online>.

Syntax 1
--------
The basic syntax is to create a quaternion in its raw form.

```lua
quat quat(float w, float x, float y, float z)
```

### Required arguments
- **w**: A floating point number representing the `w` value of your quaternion.
- **x**: A floating point number representing the `x` value of your quaternion.
- **y**: A floating point number representing the `y` value of your quaternion.
- **z**: A floating point number representing the `z` value of your quaternion.

Syntax 2
--------
It's also possible to create a quaternion based on an angle/axis using a vector.

```lua
quat quat(float w, vector3 vec)
```

### Required arguments
- **w**: The angle of the rotation.
- **vec**: A [vector3][vec3] representing the axis to rotate around.

Syntax 3
--------
Alternatively, it's possible to create a quaternion calculated between 2 vector3 values. This would represent the
rotation between the vectors.

```lua
quat quat(vector3 vec1, vector3 vec2)
```

### Required arguments
- **vec1**: A [vector3][vec3] representing the starting point.
- **vec2**: A [vector3][vec3] representing the ending point.

Examples
--------

Basic quaternion functionality:
```lua
-- Create a basic quaternion:
quat(1, 0, 0, 0)

-- Basic rotations:
quat(1, 1, 0, 0) -- 180 degrees about X
quat(1, 0, 1, 0) -- 180 degrees about Y
quat(1, 0, 0, 1) -- 180 degrees about Z

-- Create a quaternion rotated around an axis:
quat(90, vector3(1, 0, 0)) -- 90 degrees clockwise around the X axis
quat(90, vector3(0, 1, 0)) -- 90 degrees clockwise around the Y axis
quat(90, vector3(0, 0, 1)) -- 90 degrees clockwise around the Z axis

-- It's also possible to create the above counter-clockwise.
-- Both of the below rotates counter-clockwise around the X axis:
quat(-90, vec(1, 0, 0))
quat(90, vec(-1, 0, 0))

-- You can also calculate the rotation between 2 vectors.
-- Both of the following rotate 90 degrees around the X axis:
quat(vec(0, 1, 0), vec(0, 0, 1))  --  Y is turned to Z
quat(vec(0, 0, -1), vec(0, 1, 0)) -- -Z is turned to X

-- You can get the individual quaternion values like so:
local q = quat(1, 0, 0, 0)
print(q.w) -- prints the `w` value
print(q.x) -- prints the `x` value
print(q.y) -- prints the `y` value
print(q.z) -- prints the `z` value

-- Unpacking works too:
local q = quat(1, 0, 0, 0)
local w, x, y, z = table.unpack(q)

-- To get the rotation and axis:
local q = quat(90, vector3(1, 0, 0))
print(q.axis)  -- prints `vector3(1, 0, 0)`
print(q.angle) -- prints `90`

-- The length of a quaternion is usually 1.0:
local q = quat(1, 0, 0, 0)
print(#q)

-- Quaternions are real data types:
local q = quat(1, 0, 0, 0)
print(type(q)) -- prints `quat`

-- Comparing quaternions:
local q1 = quat(90, vector3(1, 0, 0))
local q2 = quat(90, vector3(1, 0, 0))
local q2 = quat(45, vector3(1, 0, 0))
print(q1 == q2) -- prints `true`
print(q1 == q3) -- prints `false`
print(q1 ~= q3) -- prints `true`

-- Basic calculations are supported.
-- The following rotates an existing quaternion 45 degrees around its X axis:
local q1 = quat(1, 0, 0, 0)
local q2 = q1 * quat(45, vector3(1, 0, 0))

-- To invert a quaternion, use `inv`:
local q1 = quat(35, vec(0, 1, 0))
local q2 = quat(-35, vec(0, 1, 0))
print(inv(q1) == q2) -- prints `true`
```

Create a quaternion based on your current vehicle's rotation:
```lua
local vehicle = GetVehiclePedIsIn(PlayerPedId())

-- GTA returns the `w` value last.
local x, y, z, w = GetEntityQuaternion(vehicle)
local q = quat(w, x, y, z)

-- Prints the quaternion to your client console
print(q)
```

[lua-runtime]: /docs/scripting-manual/runtimes/lua
[vec3]: /docs/scripting-reference/runtimes/lua/functions/vector3
[wiki-euler]: https://en.wikipedia.org/wiki/Euler_angles
[wiki-quats]: https://en.wikipedia.org/wiki/Quaternion
[wiki-gimbal]: https://en.wikipedia.org/wiki/Gimbal_lock
