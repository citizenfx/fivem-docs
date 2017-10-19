---
title: "Scripting in JavaScript"
---

Getting started
---------------

Make a script file in your [resource folder]({{<relref "/resources/_index.md">}}) ending with `.js` extension, and reference it in your [resource manifest]({{<ref "/resources/manifest.md">}}) as follows:

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

*Alias: addEventListener*

Registers a listener for `eventName` triggered from the client.

Example:

``` js
on('onClientMapStart', resourceName => console.log('Client map started! Resource name: %s', resourceName));
```

### onNet(eventName: string, callback: Function): void

*Alias: addNetEventListener*

Registers listener for `eventName` triggered from the server.

Example:

``` js
onNet('chatMessage', (name, color, message) => {
  console.info('chat message received "%s"', message, name, color);
});
```

### emit(eventName: string, ...args: any\[\]): void

Triggers a client event named `eventName` with a payload of `...args`

Example:

``` js
emit('loadout', GetPlayerPed(-1), 'pistol_mk2');
```

### emitNet(eventName: string, ...args: any\[\]): void

Triggers a server event named `eventName` with a payload of `...args`

Example:

``` js
emitNet('storePosition', GetEntityCoords(GetPlayerPed(-1), true));
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
