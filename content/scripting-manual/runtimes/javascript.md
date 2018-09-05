---
title: Scripting in JavaScript
weight: 422
---

FiveM supports JavaScript as scripting language.
To use JavaScript, just use `.js` in your script filename.

FiveM has the ES2017 standard library built in. FiveM also implements a WHATWG compliant `console` API (some
rarely-used methods are not yet implemented).

**Note that FiveM doesn't include any browser or Node.JS-specific API's, such
as DOM, localStorage, IndexedDB, WebGL, etc.**

Using natives
-------------
Native commands are mapped to global JavaScript functions with names similar to the Lua natives mapping. Definitions for
them are located at `path\to\fivem\FiveM.app\citizen\scripting\v8\natives_universal.d.ts`

Example:

``` js
// The native command GET_PLAYER_PED translates to the following:
GetPlayerPed(-1);
```

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

Gotchas
-------

### Thread affinity
Explain this: https://discordapp.com/channels/192358910387159041/433008322732490778/479361371147075585

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
