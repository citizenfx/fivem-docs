---
title: inv
---

Calculates the inverse of a quaternion. The inverse represents the opposite rotation: if a quaternion rotates 90
degrees to the right, its inverse rotates 90 degrees to the left.

Syntax
------

```lua
quat inv(quat q)
```

### Required arguments
- **q**: A [quat][quat] to invert.

### Returns
A [quat][quat] representing the opposite rotation.

Examples
--------

```lua
-- Inverting a quaternion gives the opposite rotation:
local q = quat(90, vector3(1, 0, 0))
local qi = inv(q)
print(qi) -- equivalent to quat(-90, vector3(1, 0, 0))

-- Multiplying a quaternion by its inverse returns the identity:
local q = quat(45, vector3(0, 1, 0))
local identity = q * inv(q)
print(identity) -- prints `quat(1, 0, 0, 0)` (no rotation)

-- Useful for undoing a rotation:
local q1 = quat(90, vector3(1, 0, 0))
local q2 = quat(45, vector3(0, 1, 0))
local combined = q1 * q2
local undoQ2 = combined * inv(q2)
print(undoQ2 == q1) -- prints `true`
```

[quat]: /docs/scripting-reference/runtimes/lua/functions/quat/
