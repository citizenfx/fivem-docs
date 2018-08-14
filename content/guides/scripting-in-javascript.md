---
title: Scripting in JavaScript
weight: 262
---

Getting started
---------------

Make a script file in your [resource folder]({{<relref "/guides/resource-manifest">}}) ending with `.js` extension, and reference it in your [resource manifest]({{<ref "/guides/resource-manifest">}}) as follows:

```lua
client_script 'example.js'
```

Natives
-------

Native commands are mapped to global JavaScript functions with names similar to the Lua natives mapping. Definitions for them are located at `path\to\fivem\FiveM.app\citizen\scripting\v8\natives_universal.d.ts`

Example:

``` js
// The native command GET_PLAYER_PED translates to the following:
GetPlayerPed(-1); // 238 <- example, may differ in-game
```

Definitions
-----------

Definitions for the FiveM JavaScript API are available as TypeScript definition file, which can be found at `path\to\fivem\FiveM.app\citizen\scripting\v8\natives_universal.d.ts`, which will allow your editor to provide automatic completion of the FiveM API methods and mapped native functions.

Standard library
----------------

FiveM has the ES2017 standard library built in. FiveM also implements a WHATWG compliant `console` API (some rarely-used methods are not yet implemented).

**Note that FiveM doesn't include any browser or Node.JS-specific API's, such as DOM, localStorage, IndexedDB, WebGL, etc.**

Globals
-------

FiveM implements a global `window` object, which is an alias for the global scope.

### on(eventName: string, callback: Function): void

*Alias: addEventListener, AddEventHandler*

Registers a listener for `eventName` triggered locally.

Example:

``` js
on('onClientMapStart', resourceName => console.log('Client map started! Resource name: %s', resourceName));
```

### onNet(eventName: string, callback: Function): void

*Alias: addNetEventListener*

Registers listener for `eventName` triggered from the remote. (server if on client, client if on server)

Example:

``` js
onNet('chatMessage', (name, color, message) => {
  console.info('chat message received "%s"', message, name, color);
});
```

### RegisterNetEvent(eventName: string): void

*Alias: RegisterServerEvent*

Adds a specific event name to be whitelisted for remote usage. This is not needed if using `onNet`.

Example:

``` js
RegisterNetEvent('myEvent');
```

### emit(eventName: string, ...args: any\[\]): void

Triggers a local event named `eventName` with a payload of `...args`

Example:

``` js
emit('loadout', GetPlayerPed(-1), 'pistol_mk2');
```

### emitNet(eventName: string, ...args: any\[\]): void

*Alias: TriggerServerEvent*

**On the client**: triggers a server event named `eventName` with a payload of `...args`

Example:

``` js
emitNet('storePosition', GetEntityCoords(GetPlayerPed(-1), true));
```

### emitNet(eventName: string, source: number|string, ...args: any\[\]): void

*Alias: TriggerClientEvent*

**On the server**: triggers a client event named `eventName` with a payload of `...args` on the client identified by `source`

Example:

``` js
emitNet('sendPosition', source, [ 400.0, 0.0, 15.0 ]]);
```

### addRawEventListener(eventName: string, callback: Function): void

*Alias: addRawEventHandler*

Registers a raw `eventName` handler that will receive a serialized `msgpack` payload of type `UInt8Array`.

### removeEventListener(eventName: string, callback: Function): void

Unregisters the given `callback` as `eventName` handler.

### setTick(callback: Function): void

Registers a `callback` that will be invoked on each game frame, you should make it as efficient as possible.

Example:

``` js
setTick(() => {
  BeginTextCommandDisplayText('STRING');
  AddTextComponentSubstringPlayerName('You monster');
  EndTextCommandDisplayText(0.5, 0.5);
});
```

### exports

A proxy object for handling exports. Exports can be called using `exports.resourceName.exportName` (or array syntax of `exports['resourceName']['exportName']`), exports can be added using `exports('func', () => 42)`.

Example:

``` js
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
