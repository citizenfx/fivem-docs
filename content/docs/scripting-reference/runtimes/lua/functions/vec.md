---
title: vec
---

Creates a new vector depending on the count of arguments.

Syntax
------
Supports 1 to 4 arguments. Return value is depends on the input.

```lua
number  vec(float x)
vector2 vec(float x, float y)
vector3 vec(float x, float y, float z)
vector4 vec(float x, float y, float z, float w)
```

### Required arguments
- **x**: A floating point number representing the `x` value of your vector.

### Optional arguments
- **y**: A floating point number representing the `y` value of your vector.
- **z**: A floating point number representing the `z` value of your vector.
- **w**: A floating point number representing the `w` value of your vector.

### Returns
- If 1 argument is passed, returns the number.
- If 2 arguments are passed, returns a [vector2][vec2].
- If 3 arguments are passed, returns a [vector3][vec3].
- If 4 arguments are passed, returns a [vector4][vec4].

Examples
--------

The following is true:

```lua
vec(1)          == 1
vec(1, 2)       == vector2(1, 2)
vec(1, 2, 3)    == vector3(1, 2, 3)
vec(1, 2, 3, 4) == vector4(1, 2, 3, 4)
```

A basic version of this function could be implemented like so:

```lua
function vec_alt(...)
  local args = {...}
  if #args == 1 then
    return args[1]
  elseif #args == 2 then
    return vector2(args[1], args[2])
  elseif #args == 3 then
    return vector3(args[1], args[2], args[3])
  elseif #args == 4 then
    return vector4(args[1], args[2], args[3], args[4])
  else
    error('Argument count mismatch.')
  end
end
```

[vec2]: /docs/scripting-reference/runtimes/lua/functions/vector2
[vec3]: /docs/scripting-reference/runtimes/lua/functions/vector3
[vec4]: /docs/scripting-reference/runtimes/lua/functions/vector4
