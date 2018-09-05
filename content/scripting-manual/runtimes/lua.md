---
title: Scripting in lua
---

FiveM supports the general purpose programming language Lua as one of its scripting languages. Lua is a very easy
language to learn, simple to use and fast to write. To use Lua, just use `.lua` in your scripts file extensions.

A modified version of [Lua 5.3][luadocs] is used in FiveM, called _CfxLua_. This version is includes some of the
modifications the [Grit game engine][grit] introduced:

- [Support for relative path literals](#relative-path-literals)
- [Support for vectors & quaternions](#vectors-quaternions)

To learn more about Lua, read their [official documentation][luadocs].

Using Lua
---------
To use Lua in your scripts, simply use the `.lua` file extension. No additional configuration is required.

Relative path literals
----------------------
As is the case in Grit, CfxLua provides support for relative path literals using backticks. This allows you to express a
relative file path in your code, which can sometimes be more convenient than absolute file paths. Relative path literals
will be resolved from their current file and cannot descend below the root of your resource.

```lua
print(`foo`)
print(`/dir/foo`)
print(`../foo`)
print(`.`)
```

Strings within backticks are assumed to be a path. If the path starts with a `/`, it will behave as an absolute path,
not any different from a normal string. Any other path is assumed to be relative, and will be resolved using the
directory of the currently executing Lua file. Descending below the root of your resource will raise an error.

```lua
assert(`foo/../bar` == `bar`)
assert(`foo/../bar/.` == `bar`)
assert(`./foo/../bar` == `bar`)
assert(`/.` == `/`)
```

Vectors & quaternions
---------------------

FiveM supports first-class vectors and quaternions in Lua. Vectors and quaternions are incredibly useful to represent
things like positions, rotations or even colors. For performance reasons, vectors and quaternions are real data types in
CfxLua, just like booleans, numbers and strings are.

Many [native functions][natives-doc] return and accept vectors too. They're commonly used for world positions and
standard euler rotations, so use them whenever you can. More about there [here][about-natives].

For usage and examples see their respective docs:

- [quat](/scripting-reference/runtimes/lua/functions/quat)
- [vector2](/scripting-reference/runtimes/lua/functions/vector2)
- [vector3](/scripting-reference/runtimes/lua/functions/vector3)
- [vector4](/scripting-reference/runtimes/lua/functions/vector4)

Using exports
-------------

Unline JavaScript and C#, Lua does not have a `Export` function to create exports. Instead, you define an `export` or
`server_export` entry in your [resource manifest][resource-manifest]. Functions need to be global to be exported.
For example:

hello.lua:
```lua
function SayHello(str)
  print('Hello, ' .. tostring(str) .. '!')
end
```

\_\_resource.lua:
```lua
-- Client:
client_script 'hello.lua'
export 'SayHello'

-- Or server:
server_script 'hello.lua'
server_export 'SayHello'
```

In another resource:
```lua
-- Prints 'Hello, world!'
exports.myresource:SayHello('world')
```

<!-- TODO: More information about exports can be found [here]. -->

<!-- TODO:
Event system
Just as is the case with JavaScript, Lua events can be added through functions like AddEventHandler and triggered
through functions like TriggerEvent. Event handlers run in a coroutine, so Citizen.Wait works inside of them.
-->

<!-- TODO:
The scheduler
Citzen.CreateThread, Citizen.Wait, threaded events, etc
-->

External libraries
------------------
The Lua runtime exposes some libraries on the global scope which you can use.

- `json`: [dkjson 2.5](https://github.com/LuaDist/dkjson/tree/2.5)
- `promise`: [lua-promises](https://github.com/zserge/lua-promises/tree/02b64afdbe38de958a6a92703af8e66a9ff3e492)
- `msgpack`: [lua-MessagePack 0.3.3](https://framagit.org/fperrad/lua-MessagePack/tree/0.3.3)

Lua specific functions
----------------------

- [Client functions](/scripting-reference/runtimes/lua/client-functions)
- [Server functions](/scripting-reference/runtimes/lua/server-functions)

[about-natives]: /scripting-manual/introduction/about-native-functions
[resource-manifest]: /scripting-reference/resource-manifest
[grit]: http://gritengine.com
[luadocs]: https://www.lua.org/manual/5.3/
[natives-doc]: https://runtime.fivem.net/doc/reference.html
