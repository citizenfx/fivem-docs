---
title: CfxLua language extensions
weight: 516
---

CfxLua is FiveM's fork of Lua 5.4.8, with its source in the
[citizenfx/lua](https://github.com/citizenfx/lua) repository. It replaced Lua 5.3
after that version was deprecated and then
[removed](https://github.com/citizenfx/fivem/commit/a2a71bd1ba). This page
documents the language extensions CfxLua adds on top of standard Lua.

## Compound Operators

CfxLua adds these compound assignment operators. Each one applies an operation
to a variable and assigns the result back:

| Operator | Equivalent |
| --- | --- |
| `+=` | `x = x + y` |
| `-=` | `x = x - y` |
| `*=` | `x = x * y` |
| `/=` | `x = x / y` |
| `<<=` | `x = x << y` |
| `>>=` | `x = x >> y` |
| `&=` | `x = x & y` |
| <code>&#124;=</code> | <code>x = x &#124; y</code> |
| `^=` | `x = x ~ y` |

{{% alert color="warning" title="^= is bitwise XOR" %}}
Unlike `^`, which is exponentiation, `^=` is bitwise XOR. So `x ^= 2` is the
same as `x = x ~ 2`.
{{% /alert %}}

A compound assignment targets one variable only. `x += 1` is valid, but
`x, y += 1, 2` is not.

The increment and decrement operators (`++`, `--`) have not been implemented
because `--` is reserved for comments.

## Safe Navigation

An indexing operation that suppresses errors on accesses into undefined tables
(similar to the safe-navigation operators in C#, Kotlin, etc.), e.g.,

```lua
t?.x?.y == nil
```

## In Unpacking

Support for unpacking named values from tables using the ``in`` keyword, e.g,

```lua
local a,b,c in t
```

is functionally equivalent to:

```lua
local a,b,c = t.a,t.b,t.c
```

## Set Constructors

Syntactic sugar to improve the syntax for specifying sets, e.g.,

```lua
t = { .a, .b }
```

is functionally equivalent to:

```lua
t = { a = true, b = true }
```

## C-Style Comments

Support for C-style block comments: ``/* Comment */``, e.g.,

```lua
print("Hello, World!") /* Comment */
```

## Compile Time Jenkins' Hashes

String literals wrapped in back-ticks are Jenkins' one-at-a-time hashed when
parsed, and they are always lowercased first.

```lua
> `Hello, World!`
1395890823
```

For runtime hashing, the `joaat` function is included in the base library:

```lua
-- joaat(input [, ignore_casing])
-- By default, ASCII characters are lowercased before hashing. Pass true to
-- hash the input as-is, which makes the hash case-sensitive.
> joaat("Hello, World!")
1395890823
```

Hashes are signed 32-bit integers. To get an unsigned value, mask the result
with `0xFFFFFFFF`:

```lua
> joaat("CPed")
-1803413927

> joaat("CPed") & 0xFFFFFFFF
2491553369
```

## \_\_ipairs

Reintroduce compatibility for the ``__ipairs`` metamethod that was deprecated
in 5.3 and removed in 5.4.

## Defer

`defer` takes a function and returns a to-be-closed value. Assign the result to
a `<close>` variable and the function runs when that variable goes out of
scope:

```lua
local function scope()
    local _ <close> = defer(function()
        print("leaving scope")
    end)
    print("inside scope")
end

scope()
-- inside scope
-- leaving scope
```

## Each Iteration

In Lua 5.4, a generic 'for' loop starts by evaluating its explist (expression list) to produce
four values: an iterator function, a state, an initial value for the control
variable, and a closing (to-be-closed) value. However, the ``\_\_pairs`` metamethod
does not support the optional to-be-closed variable.

This extension introduces a ``__iter`` metamethod to allow ``next, t, nil,
to-be-closed`` forms of iteration bound to a metamethod. To iterate over such a
table, only the table needs to be supplied as an argument to a loop, e.g.,

```lua
t = {1,2,3}
for k,v in each(t) do print(k, v) end
```

which defaults to a ``pairs`` implementation that supports a fourth return
variable (to-be-closed) when no `__iter` metamethod exists. ... This patch is
inspired by the *Self-iterating Objects patch*; see [commit logs](https://github.com/gottfriedleibniz/lua/commits/luaglm) for reasoning
behind deviation.


## String Blobs

Introduce a `LUA_TSTRING` variant that is effectively a `LUA_VLNGSTR` but
without the hash caching mechanism. Values of this variant are stored in tables
by reference.

```lua
-- Create a string blob of the given length. Raises an error if n <= 0.
blob = string.blob(512)

-- Create a blob variant of another string
blob = string.blob(string.rep('\0', 80))

-- Returns whether the value is a string blob
is_blob = string.isblob(value)

-- Returns a string blob containing the values v1, v2, etc. serialized in binary
-- form (packed at an optional offset) according to the format string fmt.
--
-- Unlike string.pack, this function attempts to write the resulting
-- serialization onto the provided blob (at an optional offset). If the blob is
-- not of sufficient size, a (byte-)copy of the blob is made and returned.
_blob = string.blob_pack(blob, pos --[[ optional ]], fmt, v1, v2, ···)

-- string.unpack where the "fmt" and "s" parameters have swapped order. It is
-- possible to still use string.unpack on blobs. This function exists for
-- API consistency.
... = string.blob_unpack(blob, pos --[[ optional ]], fmt)
```

With included C API functions:

```c
/*
** Creates a string blob of at least "len" bytes, pushing the zero-terminated
** blob onto the stack. Returning a pointer to that blob inside the Lua state.
*/
char *lua_pushblob(lua_State *L, size_t len);

/*
** Converts the (explicit) string at the given index to a blob. If the string
** value is not already a blob, then lua_tostringblob changes the actual value
** in the stack to a blob (same lua_tolstring caveats apply).
*/
char *lua_tostringblob(lua_State *L, int idx, size_t *len);
```

A [DataView](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DataView) API that interfaces with Lua's built in facilities, e.g., `string.pack`, `string.unpack`, and `table.concat`, is located [here](https://github.com/citizenfx/lua/blob/luaglm-548/libs/scripts/examples/dataview.lua).

The intent is to allow byte data to still be beholden to the garbage collector while not requiring the allocation of intermediate data when going to and from the Lua API (unsafe caveats apply).


## Extended API

The following functions are added on top of the standard Lua libraries.

### Table functions

`table.create(narr, nrec)`
: Creates a new empty table. Both arguments are required. `narr` is a hint for
  the number of array elements, `nrec` for the number of other entries.

`table.new(narr, nrec)`
: Alias for `table.create`.

`table.wipe(t)`
: Removes all entries from the table while keeping its internal storage.

`table.clear(t)`
: Alias for `table.wipe`.

`table.clone(t [, t2])`
: Returns a shallow copy of the table. `t2` is an optional preallocated
  destination table.

`table.type(t)`
: Returns the table's storage type: `"empty"`, `"array"`, `"hash"`, or
  `"mixed"`. It only inspects the array part and the root of the hash part, so
  the result can stay `"mixed"` or `"hash"` after entries are removed.

### String functions

`string.strjoin(delimiter [, string, ...])`
: Joins the given strings with the delimiter between them.

`string.strtrim(input [, chars])`
: Trims characters off the beginning and end of a string. `chars` optionally
  specifies the characters to trim.

`string.strconcat(...)`
: Returns the concatenation of all number and string arguments.

`string.strsplit(delimiter [, string [, pieces]])`
: Splits a string on any of the delimiter characters. `pieces` optionally
  limits the number of results.

`string.tostringall(...)`
: Converts all arguments to strings.

### UTF-8 functions

`utf8.strlenutf8(s)`
: Alias for `utf8.len`. Returns the number of UTF-8 characters in the string.

`utf8.len16(s [, i [, j]])`
: Returns the number of UTF-16 code units in a byte range of the string, or
  `-1` if the range is malformed UTF-8.

### Other

`scrub(...)`
: Returns all arguments, changing any value that is not a number, boolean,
  string, or vector to `nil`.

## Nanosecond resolution timers
Enable nanosecond resolution timers (high resolution timers) and x86 rdtsc (Read Time-Stamp Counter) sampling in `loslib.c`.

This enables lua functions such as:

```lua
end_time, start_time = 2000, 1000
dt = os.deltatime(end_time, start_time)
mt = os.microtime()
nt = os.nanotime()
print("dt: " .. dt .. " mt: " .. mt .. " nt: " .. nt)
-- dt: 1000 mt: 263860441973 nt: 72001719953
```
