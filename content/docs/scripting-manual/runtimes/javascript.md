---
title: Scripting in JavaScript
weight: 422
languages: ['js']
---

FiveM supports JavaScript as scripting language.
To use JavaScript, just use `.js` in your script filename.

FiveM has the ES2017 standard library built in. FiveM also implements a WHATWG compliant `console` API (some
rarely-used methods are not yet implemented).

**Note that FiveM (on the client) doesn't include any browser or Node.js-specific API's, such
as DOM, localStorage, IndexedDB, WebGL, etc.**

Using natives
-------------
Native commands are mapped to global JavaScript functions with names similar to the Lua natives mapping. Definitions for
them are located at `path\to\fivem\FiveM.app\citizen\scripting\v8\natives_universal.d.ts`.

For automatic completion of the FiveM API methods and mapped native functions we recommend using the official NPM packages
[@citizenfx/client][npmclient] and [@citizenfx/server][npmserver], respectively.

Example:

``` js
// The native command GET_PLAYER_PED translates to the following:
GetPlayerPed(-1);
```

Using Node.js APIs
------------------

FiveM includes a [customized version][nodejs] of Node.js 12.x **on the server**. You can simply use `require` in server
scripts, and it'll resolve the package either from Node.js built-ins, or the `node_modules/` folder in your resource
directory.

To automatically install and update a `package.json` with Yarn on launch, make sure the `yarn` resource is running
before starting your resource, or preferably add it as a `dependency` in your [resource manifest][deplink].

Using exports
-------------

A proxy object for handling exports. Exports can be called using `exports.resourceName.exportName` (or using bracket
syntax: `exports['resourceName']['exportName']`), exports can be added using `exports('func', () => 42)`.

Example:

```js
exports('myFunc', (arg) => {
  console.log(arg);
});
```

```js
on('onClientGameTypeStart', () => {
  exports.spawnmanager.setAutoSpawnCallback(() => {
    exports.spawnmanager.spawnPlayer({
      x: 686.245,
      y: 577.950,
      z: 130.461,
      model: 'a_m_m_skater_01'
    }, () => {
      emit('chat:addMessage', {
        args: [
          'Hi, there!'
        ]
      })
    });
  });

  exports.spawnmanager.setAutoSpawn(true)
  exports.spawnmanager.forceRespawn()
});
```

TypeScript support
------------------

Definitions for the FiveM JavaScript API are available as TypeScript definition file, which can be
found at `path\to\fivem\FiveM.app\citizen\scripting\v8\natives_universal.d.ts`, which will allow your
editor to provide automatic completion of the FiveM API methods and mapped native functions.

For typings use the official NPM packages [@citizenfx/client][npmclient] and [@citizenfx/server][npmserver].
These packages are also recommended for automatic completion.

Gotchas
-------

### Thread affinity
In the Node.js runtime, any callbacks that are triggered by Node.js will _run on a separate thread_ hosting the libuv
event loop. Since CitizenFX server natives can only be called on the main game thread, trying to invoke any will likely
lead to an error saying 'No current resource manager'.

To resolve this, use `setImmediate` to schedule a callback to be executed on the main thread if you're intending to call
any server natives.

For example:

```js
const root = GetResourcePath(GetCurrentResourceName());

// wrong
fs.readFile(`${root}/test.txt`, { encoding: 'utf8' }, (err, data) => {
  emitNet('chat:addMessage', -1, { // this call will error out due to thread affinity
    args: [ data ]
  });
});

// right
fs.readFile(`${root}/test.txt`, { encoding: 'utf8' }, (err, data) => {
  setImmediate(() => { // the callback will be called next game tick
    emitNet('chat:addMessage', -1, {
      args: [ data ]
    });
  });
});
```

Note that when nesting Node.js callbacks and _not_ using natives in between, you don't need to schedule the code back to
the main thread, and it is recommended that you don't do so for the sake of performance.

Functions in JavaScript
-----------------------

- on (alias: addEventListener, AddEventHandler)
- onNet (alias: addNetEventListener)
- RegisterNetEvent (alias: RegisterServerEvent)
- emit
- emitNet (alias: TriggerClientEvent, TriggerClientEvent)
- addRawEventListener (alias: addRawEventHandler)
- removeEventListener
- setTick
- clearTick

See [Scripting reference][scriptreflink] for example usage of these functions.

[scriptreflink]: /docs/scripting-reference/runtimes/javascript
[deplink]: /docs/scripting-reference/resource-manifest/resource-manifest#dependency
[nodejs]: https://github.com/citizenfx/node
[npmclient]: https://www.npmjs.com/package/@citizenfx/client
[npmserver]: https://www.npmjs.com/package/@citizenfx/server
