---
title: World Editor
weight: 920
---

**World Editor** - is FxDK *personality* allowing you to create your own worlds by modify game's map (with some limitations, see [patches]() section), and adding new objects.

> Please note, that World Editor is still in it's early stage.

World Editor follows _what you see is what you get_ paradigm of editing, providing 3D gizmo control essential properties of objects on a map, such as positioning, rotation and scale, both in global coordinates space and local.

There're two distinct primitives:

### Patches

Patches are your modifications to existing map objects, such as traffic lights, trash bins and so on.

Current major limitation is that you can only patch objects that have embedded collisions. Technically, it is already possible to move even buildings, but as their collisions are part of global collision mesh and as we're still unable to modify that, patches are limited to objects with embedded collision meshes.

Another limitation is that you can not delete existing map objects, however, you can hide them.

### Additions

Additions are objects that you add on a map manually from the objects browser.


# Map assets
World Editor operates on map file assets, these are single files containing your map info.

Map files, before server can use them, are compiled to normal resource with optimized runtime for managing map additions.

Why not compile them to normal map files that game uses? Reason is that while it is possible, normal map files don't allow for script bindings.

> Usually, you don't have to manually compile map assets via context menu `Recompile` option because it **should** autocompile when leaving World Editor. This option is available for edge cases such as that if computer shut down unexpectedly and FxDK had no opportunity to autocompile.

## Script binding
This is **very basic** currently, but will be expanded further in the future.

### Addition events
For map addition you can specify arbitrary event names that will be triggered when it is created and/or deleted, allowing you to use them in code.

Both created and deleted events will be triggered with object's handle, which you can use to invoke entity natives.

Do note that both kinds of events will be triggered after the fact, meaning that, for example, invoking natives with object's handle in deleted event handler will result in error.

> These events are emitted on client and are not available on server.


# Using World Editor

We won't dive deep into details here because we have extensive intro tour built into World Editor itself, however, there're few things worth mentioning here.

## Play test
You can test your creation right away without leaving World Editor by pressing `F5` hotkey or clicking on play button in UI, this will place a controllable player ped where your camera is currently.

You can configure World Editor like so that you'll spawn in vehicle instead, see settings panel in UI.

There're two options to leave play test mode:
 - `ESC` hotkey, camera returns where it was when you entered play test.
 - `Shift+ESC` hotkey, camera stays where you are.

## Environment
You can control what time is it in game, freeze time and change weather,  these options live in environment panel in UI.

## Positioning additions
In addition to all normal controls like position, rotation and scale, exclusively for additions, you can ask game to try to position them "correctly" on ground.

## Undo/Redo
World Editor fully supports undo/redo functionality, it behaves like you'd expect: `Ctrl+Z` to undo, `Ctrl+Shift+Z` to redo.


# Contributing
If you have any suggestions, bug reports or questions, please [file an issue on our GitHub](https://github.com/citizenfx/fivem/issues/new).

For all existing World Editor related issues see [`world-editor` labelled issues](https://github.com/citizenfx/fivem/issues?q=is%3Aopen+is%3Aissue+label%3A%22world+editor%22).

As always, pull-requests are very much welcome!
