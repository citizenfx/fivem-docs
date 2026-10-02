---
title: Example Project
weight: 20
---

In this example project you will create a simple particle effect from start to finish. You will set up the effect, add emitters, configure keyframes, and then preview the result in different modes.

## 1. Setting Up the Project

1. Open Catalyst and select **New Project** from the menu.
2. Click the "Add Collection" button next to the search bar to create a new collection for your project.
3. Name the collection (by right-clicking and selecting **Rename**) and press Enter.
4. Press the **+** button ("Add Effect") to add a new effect to the collection.
5. Name the effect (by right-clicking and selecting **Rename**) and press Enter.

## 2. Building the Node Graph

1. Right-click in the node graph, search for "ParticleDrawModel", and connect its output to the "ParticleRule" node using the "Draw Command" slot.
2. Right-click in the node graph, search for "ParticleDrawable", and connect its output to the "ParticleDrawModel" node using the "Drawables" slot.
3. Click the Drawables tab, right-click on "ptfx_model_snow/ptfx_model_snow" and select the collection under "Copy To".
4. Click the Mesh dropdown menu in the "ParticleDrawable" node and search for "Snow" to select the "ptfx_model_snow_copy" mesh.

  {{% alert color="info" %}} If there are no meshes present this means that Catalyst could not load the game's `core.ypt`. Restart Catalyst and specify the game installation path in the locate-game dialog (see [Pointing Catalyst at Your Game](/docs/catalyst/#pointing-catalyst-at-your-game)). {{% /alert %}}

5. Right-click in the node graph, search for "Sprite Shader", and connect its output to the "ParticleDrawModel" node using the "Shader" slot.
6. Set the technique to "RGBA_lit" in the "Sprite Shader" node by clicking the technique dropdown menu.
7. In the "ParticleEmitterRule" node, set both the "Spawn Rate Over Time" Min and Max values to "20.000".
8. To view the particles, press the play icon in the timeline below and observe the particles in the preview window. Zoom into the preview window as needed to get a better view of the particles.

## 3. Exporting the Effect

1. To export, press "File" at the top left and press "Export YPT" (<kbd>Ctrl</kbd>+<kbd>E</kbd>).
2. Set an output directory by pressing "Browse".
3. Set the GTAV version by pressing "Legacy", "Enhanced", or both. At least one always stays selected. With both selected, Catalyst writes both files and adds a suffix so they never collide: `<name>_legacy.ypt` and `<name>_enhanced.ypt`.
4. Check the validation list above the export button. Fix any **errors**, since the result won't work with them. **Warnings** (such as an empty name) are usually worth fixing too. Each entry names the node it came from.
5. Press export and wait until it is done exporting.

Only collections with their export checkbox ticked in the [library panel](/docs/catalyst/overview/#library-panel) are exported.

## 4. Implementing in FiveM

Create a FiveM resource to stream the exported particle asset:

1. In your server's `resources` folder, create a new folder for the resource (e.g. `my-particles`).
2. Inside it, create a `stream` folder and place the exported `.ypt` file there. If you exported for Enhanced, use a `stream_enhanced` folder instead so the asset only loads for enhanced clients.
3. Create an `fxmanifest.lua` file in the resource root with the following contents:

   ```lua
   fx_version 'cerulean'
   game 'gta5'

   client_script 'client.lua'
   ```

4. In the resource root (next to `fxmanifest.lua`), create a `client.lua` file and paste the code below. It registers a `ptfx_test` command that spawns the effect at your player's position. Set `dict` to the name of your exported ypt file and `effect` to the name of your **ParticleEffectRule**.

   ```lua
   RegisterCommand("ptfx_test", function(src, args, raw)
       local dict = "new_collection" -- name of ypt file
       local effect = "new_effect2"  -- name of the ParticleEffectRule

       RequestNamedPtfxAsset(dict)

       while not HasNamedPtfxAssetLoaded(dict) do
           Wait(0)
       end

       local playerCoord = GetEntityCoords(PlayerPedId())

       UseParticleFxAssetNextCall(dict)
       local handle = StartParticleFxLoopedAtCoord(effect, playerCoord.x, playerCoord.y, playerCoord.z, 0.0, 0.0, 0.0, 1.0, false, false, false, 0)
   end, false)
   ```

5. Rename "new_collection" to the name of your exported ypt file and "new_effect2" to the name of your ParticleEffectRule.
6. Add `ensure my-particles` to your `server.cfg` (matching your resource folder name) to automatically load your resource when the server starts.
7. Start or restart the server (or run `ensure my-particles` / `restart my-particles` in the server console) so the new `client.lua` is loaded.
8. Join the server and run `/ptfx_test` in the chat. The particle effect should spawn at your player's position.
