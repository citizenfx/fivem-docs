---
title: vector1
toc_hide: true
aliases:
  - /docs/scripting-reference/runtimes/lua/functions/vec1/
---

Creates a new vector1 value.

Unlike other vector types, vector1 simply returns a plain number.
This means that `vector1(x) == x` is always true and `type(vector1(x))` returns `number`.
It has no practical use and exists solely for completeness within the vector type system.
More about vectors in the [Lua runtime manual][lua-runtime].

Syntax
------

```lua
number vector1(float x)
```

```lua
number vec1(float x)
```

### Required arguments
- **x**: A floating point number representing the `x` value of your vector.

Examples
--------
Basic vector1 functionality:

```lua
-- vector1 returns a plain number:
print(type(vector1(1))) -- prints `number`

-- It is equivalent to the input value:
print(vector1(1) == 1) -- prints `true`

-- Using the alias:
print(vec1(1) == 1) -- prints `true`
```

[lua-runtime]: /docs/scripting-manual/runtimes/lua/
