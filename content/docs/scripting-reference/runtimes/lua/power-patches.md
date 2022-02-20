---
title: Lua power patches
weight: 516
---

# Lua Power Patches

# Lua 5.4


## Compound Operators

Add ``+=, -=, *=, /=, <<=, >>=, &=, |=, and ^=`` to the language. The increment
and decrement operators (``++, --``) have not been implemented due to one of
those operators being reserved.

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
parsed.

```lua
> `Hello, World!`
1395890823
```

For runtime hashing, the `joaat` function is included in the base library:

```lua
-- joaat(input [, ignore_casing]): Compute the Jenkins hash of the input string.
-- If 'ignore_casing' is true, the byte data is hashed as is. Otherwise, each
-- ASCII character is tolower'd prior to hashing.
> joaat("Hello, World!")
1395890823
```

```lua
> joaat("CPed")
2491553369
```

## Short Function Notation or Shorthand lambdas (5.4.2)

Syntactic sugar for writing concise anonymous functions of the form `|a, b,
...| expr`. Where `expr` is any expression equivalent to `function(a, b, ...)
return expr end`. 

For example:

```lua
> f = |x| x^2 - 1 -- function(x) return x^2+1 end

> f(2)
3.0

> f(vec3(1, 2, 3))
vec3(0.000000, 3.000000, 8.000000)

-- 'hexadump' from lua-MessagePack.lua
> hexadump = |s| s:gsub('.', |c| string.format('%02X ', c:byte()))

> hexadump("\221\255\255\255\255Z")
DD FF FF FF FF 5A
```

## \_\_ipairs

Reintroduce compatibility for the ``__ipairs`` metamethod that was deprecated
in 5.3 and removed in 5.4.

## Defer

Import the defer statement from
[Ravi](https://github.com/dibyendumajumdar/ravi/tree/master/patches) into the
runtime. In addition `func2close` from ltests.h has been imported into the base
library.

```lua
-- closing function. Could also be used to supply a to-be-closed variable to a
-- generic for loop
defer numopen = numopen - 1 end
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
-- Create a string blob of specified length
blob = string.blob(512)

-- Create a blob variant of another string
blob = string.blob(string.rep('\0', 80))

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


## Extended API

Expose ``lua_createtable`` and API functions common to other custom Lua runtimes.

```lua
-- Creates a new empty table
-- narr: a hint for how many elements the table will have as a sequence.
-- nrec: a hint for how many other elements the table will have.
t = table.create(narr[, nrec])

-- Restore the table to its initial value (removing its contents) while
-- retaining its internal pointer;
t = table.wipe(t)

-- Request the removal of unused capacity in the given table (shrink_to_fit).
t = table.compact(t)

-- An efficient (implemented using memcpy) table shallow-copy implementation;
t2 = table.clone(t[, t2]) -- t2 is a preallocated destination table

-- Return the type of table being used. Note, this function only measures the
-- size of the "array part" of a Lua table and the "root" node of its
-- "hash part". Once an "array" becomes "mixed", or if a table has all of
-- values nil'd out, the table.type will remain "mixed" or "hash".
label = table.type(t) -- "empty", "array", "hash", or "mixed"

-- Joins strings together with a delimiter;
str = string.strjoin(delimiter [, string, ...])

-- Trim characters off the beginning and end of a string;
str = string.strtrim(input [, chars])

-- Returns a concatenation of all number/string arguments passed;
str = string.strconcat(...)

-- Splits a string using a delimiter (optionally: into a specified number of pieces);
... = string.strsplit(delimiter [, string [, pieces]])

-- Converts all arguments to strings;
... = string.tostringall(...)

-- Alias: Returns the number of UTF-8 characters in string s;
utf8.strlenutf8 = utf8.len

-- String comparison accounting for UTF-8 chars. Returning a negative integer,
-- zero, or a positive integer if the first string is less than, equal to, or
-- greater than the second string;
result = utf8.strcmputf8i(stringLH, stringRH)

--- Return all arguments with non-number/boolean/string values changed to nil;
... = scrub(...)

```

## Readonly

Introduce the ability to make a table read-only and prohibit any modifications
to the table.

```lua
-- Mark a table as readonly.
--
-- This behavior is 'shallow', i.e., non-frozen tables stored within 't' are
-- still mutable.
--
-- Frozen tables respect the '__newindex' metamethod. However, any attempt to
-- modify the table by that method (e.g., __newindex = rawset) will lead to an
-- error being thrown.
--
-- Finally, tables with 'protected' metatables, i.e., a '__metatable' field,
-- cannot be frozen.
t = table.freeze(t)

-- Return true if the provided table is configured as readonly; false otherwise.
result = table.isfrozen(t)
```

## Save/restore readline history (5.4.2)

    Save/restore the history to/from a file (LUA_HISTORY env variable). 


## Advanced readline support (5.4, 5.3, 5.2, 5.1, 5.0)

  This patch adds the following features to the existing readline support in Lua 5.x:

  - Completion of keywords and global variable names.
  - Recursive and metatable-aware completion of variable names.
  - Context sensitive delimiter completion.
  - Save/restore the history to/from a file (`LUA_HISTORY` env variable).
  - Set a limit for the size of the history (`LUA_HISTSIZE` env variable).
  - Set the app name to allow for `$if lua ... $endif` in ~/.inputrc.

  After applying the patch start Lua and try these (replace ~ with the TAB key):

    ~~
    fu~foo() ret~fa~end<CR>
    io~~~s~~~o~~~w~"foo\n")<CR>


## Better signal handling in the interpreter on POSIX systems (5.4.2, 5.3.5, 5.2.3, 5.1.5)

Use `sigaction` instead of `signal` for consistent behaviour so that, for example, pressing `Ctrl-C` always quits a Lua script blocked on I/O (otherwise, this behaviour is system-dependent).

---
Sources:
<br>https://github.com/gottfriedleibniz/lua
<br>http://lua-users.org/wiki/LuaPowerPatches
