---
title: Scripting in Lua
weight: 421
languages: ['lua']
---

FiveM supports the general purpose programming language Lua as one of its scripting languages. Lua is a very easy
language to learn, simple to use and fast to write. To use Lua, just use `.lua` in your scripts file extensions.

A modified version of [Lua 5.3][luadocs] is used in FiveM, called _CfxLua_. This version includes some of the
modifications the [Grit game engine][grit] introduced:

- [Support for relative path literals](#relative-path-literals)
- [Support for vectors & quaternions](#vectors-quaternions)

To learn more about Lua, read their [official documentation][luadocs].

Using Lua
---------
To use Lua in your scripts, simply use the `.lua` file extension. No additional configuration is required.

Compile-time hashes
----------------------
Because you might often have to deal with 'Jenkins one-at-a-time' hashes in GTA/RAGE, the Lua runtime has been extended
to have support for compile-time generation of hash keys, similar to {{% native_link "GET_HASH_KEY" %}}, however with zero
runtime overhead.

For example:
```lua
-- getting
RequestModel(`adder`)

-- comparing
if GetEntityModel(vehicle) == `buzzard` then
  print("Indeed, it's a Buzzard.")
end

-- printing
print(`a_m_y_skater_01`)
```

Vectors & quaternions
---------------------

FiveM supports first-class vectors and quaternions in Lua. Vectors and quaternions are incredibly useful to represent
things like positions, rotations or even colors. For performance reasons, vectors and quaternions are real data types in
CfxLua, just like booleans, numbers and strings are.

Many [native functions][natives-doc] return and accept vectors too. They're commonly used for world positions and
standard euler rotations, so use them whenever you can. More about there [here][about-natives].

For usage and examples see their respective docs:

- [quat](/docs/scripting-reference/runtimes/lua/functions/quat)
- [vector2](/docs/scripting-reference/runtimes/lua/functions/vector2)
- [vector3](/docs/scripting-reference/runtimes/lua/functions/vector3)
- [vector4](/docs/scripting-reference/runtimes/lua/functions/vector4)

Using exports
-------------

You can define exports by calling the global `exports` object:

hello.lua:
```lua
exports('SayHello', function(str)
  print('Hello, ' .. tostring(str) .. '!')
end)
```

You can also define an `export` or `server_export` entry in your [resource manifest][resource-manifest]. Functions need
to be global to be 'explicitly' exported. Note that these exports will only be available after the first scheduler tick.

For example:

Inside hello_explicit.lua:
```lua
function SayHello(str)
  print('Hello, ' .. tostring(str) .. '!')
end
```

Inside fxmanifest.lua:
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

<!-- TODO:  Perhaps tell something about lazy loading of natives? -->

External libraries
------------------
The Lua runtime exposes some libraries on the global scope which you can use.

- `json`: [dkjson 2.5](https://github.com/LuaDist/dkjson/tree/2.5)
- `promise`: [lua-promises](https://github.com/zserge/lua-promises/tree/02b64afdbe38de958a6a92703af8e66a9ff3e492)
- `msgpack`: [lua-MessagePack 0.3.3](https://framagit.org/fperrad/lua-MessagePack/tree/0.3.3)

Lua specific functions
----------------------

- [Client functions](/docs/scripting-reference/runtimes/lua/client-functions)
- [Server functions](/docs/scripting-reference/runtimes/lua/server-functions)

[about-natives]: /docs/scripting-manual/introduction/about-native-functions
[resource-manifest]: /docs/scripting-reference/resource-manifest/resource-manifest/
[grit]: http://gritengine.com
[luadocs]: https://www.lua.org/manual/5.3/
[natives-doc]: https://docs.fivem.net/natives
