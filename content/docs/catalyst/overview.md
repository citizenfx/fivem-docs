---
title: Catalyst Overview
weight: 10
---

This article walks through the Catalyst interface and explains how effects are structured.

## Welcome Screen

![Welcome screen](/catalyst/welcome.png)

This view is visible on Catalyst launch or after a project is closed. It shows the most recently opened/imported files and projects, with their path and when you last touched them. From here you can start a new project, open an existing project, or import a YPT file directly (which also creates a new project). The same recent list is available under **File -> Open Recent**.

### New Project

Creates a new, unsaved project with no effects, no embedded textures, and no embedded drawables. You can still view and use assets from the **Global** group, which holds sharable assets from the game's `core.ypt` file. Catalyst detects this file automatically and loads it on startup (see [Pointing Catalyst at Your Game](/docs/catalyst/#pointing-catalyst-at-your-game)).

### Open Project

Opens an existing `.ctlst` project from the user's drive.

### Import YPT

Creates a new, unsaved project with embedded textures, embedded drawables, and effects loaded from the YPT file. If the asset contains sharable assets, they overwrite the Global group entries to avoid unnecessary duplication.

You can import additional YPT files afterwards through the menu bar or with <kbd>Ctrl</kbd>+<kbd>I</kbd>.

---

## Interface Layout

| Region | What lives there |
|---|---|
| [Library panel](#library-panel) | Your collections, effects, textures and meshes |
| [Node graph](#1-node-graph) | The effect itself: nodes and their connections |
| [Preview](#3-preview-view) | The live simulation |
| [Timeline](#2-timeline-view) | Keyframe tracks for whatever node is selected |
| [Status bar](#status-bar) | Current state, hover hints, counters, version |

### Menus

The title bar holds the menus on the left and the current project's name in the middle. Double-click its empty area to maximise or restore the window.

| Menu | Items |
|---|---|
| **File** | New Project, Open Project..., Open Recent >, Save Project, Save Project As..., Close Project, Import YPT..., Export YPT..., Import Clip Regions..., Export Clip Regions..., Exit |
| **Edit** | Undo, Redo. Covers graph edits, value changes and keyframe edits |
| **View** | Toggle Library Panel, Toggle Timeline Panel. Useful on smaller screens to give the graph and preview more room |
| **Settings** | Preferences (see [User Preferences and Shortcuts](#user-preferences-and-shortcuts)) |

Save, Save As and Close are greyed out until a project is open. Export is greyed out until at least one effect exists. **Open Recent** has a **Clear Recently Opened...** entry at the bottom.

### Tab Bar

Open effects and assets appear as tabs above the main area. Single-clicking an item in the library opens it as a **preview tab**, which is replaced the next time you single-click something else, so browsing a long list doesn't bury you in tabs. Double-click an item, or edit it, to keep its tab open.

### Status Bar

From left to right:

| Element | Shows |
|---|---|
| **Status / hints** | `Ready`, or the mouse controls for whatever panel you're hovering |
| **Selection** | `selected / visible` node counts in the node graph |
| **Particles** | `N particles alive` in the preview |
| **FPS** | Current frame rate |
| **Version** | The Catalyst version you're running |

---

## Library Panel

The library panel on the left has three tabs. Each is a tree view of files and the effects, textures, or drawables they contain:

| Tab | Holds |
|---|---|
| **Effects** | Collections and the effects inside them |
| **Textures** | `.dds` textures |
| **Drawables** | `.ydr` meshes |

Each tab has its own filter box and remembers its own filter text.

![Sidebar list](/catalyst/sidebar_list.png)

In **Effects** there is a button to create a new **Collection**. A collection represents a YPT file for export: one collection becomes one `.ypt`. Each collection has a checkbox that toggles whether the collection is exported.

- **Add effect** creates a new effect inside the selected collection. It is greyed out until a collection is selected.
- **Remove selected** deletes the active selection in the list, after a confirmation prompt.

![Sidebar buttons](/catalyst/sidebar_buttons.png)

The Effects tree is four levels deep. Expand an effect to list its Event Emitters, so you can jump straight to part of a complex effect without searching through the graph:

```
collection.ypt                 <- one collection = one exported .ypt
└── effect_name                <- a Particle Effect Rule
    └── Event Emitter rows     <- the effect's timeline entries
        └── Domain             <- creation-, target- and attractor domains
```

Right-click (or select and press <kbd>F2</kbd>) to rename a collection, effect, texture, or drawable.

The **Textures** and **Drawables** tabs also contain the **Global** group. This is the read-only pool loaded from the game's `core.ypt`. You can use anything in it, but you can't modify or delete it.

---

## User Preferences and Shortcuts

![User preferences](/catalyst/user_preferences.png)

The user preferences found in **Settings -> Preferences** are currently used only for keybinds. This may change in the future.

All keyboard shortcuts can be remapped there. The defaults are:

| Action | Default |
|---|---|
| New Project | <kbd>Ctrl</kbd>+<kbd>N</kbd> |
| Open Project | <kbd>Ctrl</kbd>+<kbd>O</kbd> |
| Save Project | <kbd>Ctrl</kbd>+<kbd>S</kbd> |
| Import YPT | <kbd>Ctrl</kbd>+<kbd>I</kbd> |
| Export YPT | <kbd>Ctrl</kbd>+<kbd>E</kbd> |
| Undo | <kbd>Ctrl</kbd>+<kbd>Z</kbd> |
| Redo | <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Z</kbd> |
| Rename | <kbd>F2</kbd> |
| Select all | <kbd>Ctrl</kbd>+<kbd>A</kbd> |
| Copy / Paste / Cut | <kbd>Ctrl</kbd>+<kbd>C</kbd> / <kbd>Ctrl</kbd>+<kbd>V</kbd> / <kbd>Ctrl</kbd>+<kbd>X</kbd> |
| Duplicate | <kbd>Ctrl</kbd>+<kbd>D</kbd> |
| Delete selected | <kbd>Delete</kbd> |
| Disable / enable selected nodes | <kbd>H</kbd> |
| Play / pause timeline | <kbd>Space</kbd> |
| Reset timeline to start | <kbd>Home</kbd> |
| Toggle full simulation | <kbd>F</kbd> |

Mouse controls for each panel are listed with the [node graph](#1-node-graph), [timeline](#2-timeline-view) and [preview](#3-preview-view). The status bar also shows them while you hover a panel.

---

## How Effects Are Built

Every part of Catalyst makes more sense once you understand the five layers an effect is made of and how they stack:

| Layer | Answers |
|---|---|---|
| **Particle Effect Rule** | What is this effect, overall? |
| **Event Emitter** | What happens *when* during playback? |
| **Emitter Rule** | Where, when and how many particles are born? |
| **Particle Rule** | What does one particle look like and do? |
| **Behaviors & Draw** | The individual details |

```
Particle Effect Rule        <- the effect you trigger in-game
└── Event Emitter           <- what happens when, during playback
    ├── Emitter Rule        <- where, when and how many particles are born
    │   └── Domains         <- spawn volume, launch direction, attractor
    └── Particle Rule       <- what each particle looks like and does
        ├── Draw node       <- required: sprite, trail, or 3D model
        └── Behaviors       <- optional: color, size, physics, light, collision...
```

The examples below use a campfire effect to show each layer.

### Effect Rule

A **Particle Effect Rule** is the effect you trigger, for example `fire_campfire`. A script or map placement refers to it by this name. It owns the settings that apply to everything inside it:

- How long one play-through lasts (**Duration (Min)** and **Duration (Max)** )
- Whether it loops and how often (**Number of Loops**: `-1` forever, `0` once, `N` for N repeats)
- An overall tint and size multiplier applied to every particle (**Color Tint**, **Zoom Scalar**)
- Off-screen and distance culling
- How its particles collide with the world (**Collision Type**, **Collision Search Range**)

It does not own any particles itself. An Effect Rule on its own plays for its duration and produces nothing visible.

### Event Emitters

An Effect Rule holds a list of **Event Emitters**. Each one is an entry on the effect's timeline, with a **Start Time** and an **End Time** given as a position in the effect's playback. A campfire needs three things happening at once:

```
fire_campfire  (duration 4s, loops forever)
├── Event Emitter  "flames"   Start 0%   End 100%
├── Event Emitter  "smoke"    Start 0%   End 100%
└── Event Emitter  "embers"   Start 10%  End 90%
```

An explosion would instead stage them in sequence: a flash at 0%, debris at 5%, smoke from 10% to 100%.

{{% alert color="info" %}}
**End Time stops new particles from spawning. It doesn't remove particles that are already alive.** Existing particles keep simulating until their own lifespan runs out, so smoke that stops emitting at 90% stays on screen well past the end.
{{% /alert %}}

### Emitter Rule and Particle Rule

An Event Emitter doesn't describe particles itself. It pairs **two separate rules**:

```
Event Emitter "embers"
├── Emitter Rule  ->  "ember_spawn"   <- WHERE / WHEN / HOW MANY / HOW IT SPAWNS
└── Particle Rule ->  "ember_look"    <- WHAT IT LOOKS LIKE / HOW IT MOVES
```

**The Emitter Rule controls birth.** It decides:

- the volume particles appear inside (**Creation Domain**)
- the direction they launch in (**Target Domain**)
- how many per second (**Spawn Rate Over Time**), or all at once (**Spawn All At Once**)
- how long each one lives (**Particle Life**)
- one-time values set at birth, such as starting speed, size and inherited velocity

**The Particle Rule controls everything after birth.** It decides:

- how the particle is drawn (sprite, trail or 3D mesh) and with which shader
- its color, size and rotation over its life
- how it moves, drags, wobbles and collides
- whether it emits light, leaves a decal or spawns another effect

Neither works alone. With only an Emitter Rule, an Event Emitter spawns invisible particles. With only a Particle Rule, nothing is ever born.

#### Domains

A **ParticleDomain** node gets its role from the Emitter Rule slot it's connected to:

| Slot | Role |
|---|---|
| **Creation Domain** | The volume particles spawn inside |
| **Target Domain** | Sets the initial launch direction, not where particles start |
| **Attractor Domain** | Optional pull point. Does nothing unless the paired Particle Rule has an **Attractor** behavior |

An empty slot disables that role. Available shapes are `Box`, `Sphere`, `Cylinder` and `Attractor`. Particles spawn in the shell between **Inner Size** and **Outer Size**. An Inner Size of 0 fills the whole shape.

### Reuse by Name

Both rules are referenced **by name**, and the same rule can be used by many Event Emitters across many different effects. One `smoke_grey_soft` Particle Rule can serve a campfire, a car fire and a chimney. You can pair it with a different Emitter Rule each time, so the campfire's smoke drifts up gently from a small ring while the car fire's smoke pours out fast from a wide box.

```
fire_campfire ──> Emitter Rule "campfire_smoke_spawn" ──┐
                                                        ├──> Particle Rule "smoke_grey_soft"
fire_vehicle  ──> Emitter Rule "carfire_smoke_spawn"  ──┘
```

Change `smoke_grey_soft` and every effect using it updates.

### Draw Nodes and Behaviors

A Particle Rule requires one thing: a Draw node connected to its **Draw Command** input. Without one, particles exist, move and collide, but are invisible. This is the most common reason a new effect previews as empty.

| Draw node | Renders as | Needs |
|---|---|---|
| **Draw Sprite** | A flat textured card, usually facing the camera | a **Sprite Shader** |
| **Draw Trail** | A  trail following the particle's path | a **Trail Shader** |
| **Draw Model** | A real 3D mesh | a list of **Drawables** (meshes) |

To animate a Draw Sprite through the frames of a texture, see [Clip Regions](#clip-regions).

Everything else on a Particle Rule is an optional **behavior**. There are 17 behavior slots, and you only fill the ones you need. A simple ember needs three (Color, Size, Acceleration). An empty slot costs nothing.

| Group | Behaviors |
|---|---|
| **Look over time** | Color, Size, Rotation |
| **Movement** | Acceleration, Dampening, Noise, Wind, River, Attractor, Matrix Weight |
| **World interaction** | Collision, Z Cull |
| **Extra output** | Light, Fog Volume, Decal, Decal Pool, Liquid |

Several behaviors depend on another behavior or domain. They **do nothing without it and show no error**, because an empty slot is valid everywhere else:

| Behavior | Also needs |
|---|---|
| **Attractor** | an **Attractor Domain** on the Emitter Rule |
| **Decal**, **Decal Pool**, **Liquid** | a **Collision** behavior on the same Particle Rule |
| **Chained effect (on impact)** | a **Collision** behavior on the same Particle Rule |

#### Asset Management

An effect can only use textures and drawables that are embedded in its own collection. If the asset you want is in a different collection, copy it into the effect's collection first:

1. In the [library panel](#library-panel), open the **Textures** or **Drawables** tab and find the asset.
2. Right-click the asset, open **Copy To**, and select the collection that contains your effect.

The copy is embedded in that collection and ready to use in its effects.

Assets in the **Global** group don't need to be copied. They come from the game's `core.ypt`, so the game can reference them directly.

### What Happens If You Leave Something Out

| You left out | What you see |
|---|---|
| Event Emitters on the Effect Rule | The effect plays its full duration and nothing appears |
| Emitter Rule on an Event Emitter | That event produces nothing |
| Particle Rule on an Event Emitter | Particles are born but have nothing to draw |
| **Draw node on the Particle Rule** | Particles exist and move, but are invisible |
| Shader on a Draw Sprite / Draw Trail | No visual output |
| Creation Domain on the Emitter Rule | Particles spawn from a single point instead of a volume |
| Target Domain on the Emitter Rule | Particles are born with no launch direction |
| Attractor Domain (with an Attractor behavior) | The behavior does nothing |
| Collision (with Decal / Decal Pool / Liquid) | The behavior never triggers |

### Evolutions and Chained Effects

Two optional systems sit on top of the basic structure. You don't need either for your first effects.

- **Evolutions** are named 0-1 sliders that blend a node's animated values toward an alternate set of keyframes. Every Particle Rule has a built-in **LOD** evolution that is driven automatically by camera distance, so an effect can get cheaper to render far away. You can add up to five more with any name you like (for example `Damage` or `Heat`) and drive them from script so effects react to game state. See [ParticleEvolution](#nodes-overview).
- **Chained effects** let a Particle Rule spawn *another whole Effect Rule* from an individual particle, either at a chosen point in its life or on impact. Examples are a firework shell that bursts, or sparks that leave smoke puffs.

---

## Effect Editor

The effect editor is a multi-view component containing three views in one:

![Effect editor](/catalyst/effect_editor.png)

- Node Graph
- Timeline View
- Preview

Each effect tab keeps its own preview settings.

### 1. Node Graph

This is the main point of control for effects. It contains all nodes, and everything can be tweaked from here.

![Graph editor](/catalyst/graph_editor.png)

| Action | Input |
|---|---|
| Select | **Left click** |
| Add to selection | <kbd>Ctrl</kbd> + **Left click** |
| Pan | **Middle-click drag** |
| Zoom | **Scroll wheel** |
| Open the **Create Node** menu | **Right click** on empty space |
| Connect nodes | Drag from a node's output to another node's input |
| Disable / enable selected nodes | <kbd>H</kbd> |
| Duplicate | <kbd>Ctrl</kbd>+<kbd>D</kbd> |
| Delete | <kbd>Delete</kbd> |

The Create Node menu groups nodes into four categories: **Structure**, **Particle Rule**, **Behavior** and **Evolution**.

{{% alert color="info" %}}
The Create Node menu lists nodes by their internal names (for example `ParticleBehaviorColor`), while tooltips and the labels on connection points use friendlier names ("Color"). This document gives the menu name wherever you need to find a node.
{{% /alert %}}

#### Nodes Overview

- **ParticleEffectRule**: the root node, and the effect you trigger in-game. All event emitters are linked to this node. Sets duration, looping, overall tint and zoom, culling and collision setup (see [Effect Rule](#effect-rule)).

  ![ParticleEffectRule](/catalyst/particle_effect_rule.png)
  ![ParticleEffectRule detail](/catalyst/particle_effect_rule_detail.png)

- **ParticleEventEmitter**: defines the start and end of an event (**Start Time**, **End Time**) and the playback speed, plus per-event size and tint. The EmitterRule and ParticleRule link into this node.

- **ParticleEmitterRule & ParticleDomain**: define how particles spawn, where they move towards, and their speed. The Emitter Rule has three domain slots (**Creation**, **Target**, **Attractor**) and birth values such as **Particle Life**, **Speed Scalar**, **Size Scalar**, **Spawn Rate Over Time** and **Spawn All At Once**. With **Spawn All At Once** on, every particle appears in a single burst and **Spawn Rate Over Time** is ignored. Domains can be viewed and controlled via the preview (see [Domains](#domains)).

  ![ParticleEmitterRule and ParticleDomain](/catalyst/particle_emitter_rule_particle_domain.png)

- **ParticleRule**: controls how each particle behaves over time. The Draw Method, effect spawner, and behaviors link into this node. It also sets **Blend Mode** and **Write To Depth**:
  - `Add` blend mode makes a particle read as *glowing*, because its color adds to what's behind it instead of covering it. Use it for fire, sparks and light.
  - Keep **Write To Depth** off on translucent particles to avoid hard seams where they overlap.

  ![ParticleRule](/catalyst/particle_rule.png)

- **Draw nodes**: **ParticleDrawSprite** (with a **SpriteShader**), **ParticleDrawTrail** (with a **TrailShader**) or **ParticleDrawModel** (with one or more **ParticleDrawable** meshes). One is required in the Particle Rule's **Draw Command** input (see [Draw Nodes and Behaviors](#draw-nodes-and-behaviors)).

- **ParticleEvolution**: overwrites existing keyframe properties from other nodes via scriptable values. As shown below with a "fade" evolution, its value can be set from 0-1, defining the transition between the existing values and the evolution overwrites. Every Particle Rule has a built-in **LOD** evolution driven by camera distance, plus up to five custom ones that you name and drive from script.

  ![ParticleEvolution](/catalyst/particle_evolution.png)

#### Color Behavior

**Color** (`ParticleBehaviorColor`, connected to the Particle Rule's **Color** input) is the behavior you'll use most often. It sets a particle's color and glow brightness over its life. Without it, a particle falls back to whatever its texture and the inherited tints give it.

| Field | What it does |
|---|---|
| **Color (Min)** | RGBA curve over the particle's life. Keyframe the alpha channel from opaque to zero to fade particles out instead of popping. Alpha is the particle's opacity; there's no separate transparency behavior |
| **Color (Max)** | A second RGBA curve, used only when **Color Max Enable** is on |
| **Glow Brightness** | How brightly the particle glows, independent of its hue. Has little effect under `Normal` blending. Pair it with the Particle Rule's `Add` blend mode for fire, sparks and embers |
| **Color Timing** | Which clock the curves are read against: `Point` (each particle's own lifetime, almost always what you want), `Effect` (the effect's playback) or `Emitter` (the emitter's active window) |
| **Color Max Enable** | Each particle picks a random blend between Min and Max at spawn. An inexpensive way to stop particles looking identical |
| **Proportional Randomization** | Uses one random value for all channels, so results stay on the line between Min and Max instead of drifting into muddy colors |
| **Allow Outer Tinting** | Turn off to protect a color that must stay exact from the effect's and event's **Color Tint** |

The final color is **multiplied**, not replaced: this node's output x the Event Emitter's tint x the Effect Rule's tint. If a particle's color looks wrong, check the Effect Rule's **Color Tint** before adjusting this node. To make a particle actually light up its surroundings, add a **Light** behavior as well. Its **Color From Particle** option keeps the light's color in sync with this node.

#### Keyframes in Nodes

Keyframe properties can be modified inside the timeline as well as directly from the nodes.

![Keyframes in nodes](/catalyst/keyframes_in_nodes.png)

Keyframable entries have a diamond symbol at the end of the input row:

![Keyframe diamond states](/catalyst/keyframe_diamond_states.png)

- **Blue**: no keyframe is set.
- **Green**: the displayed value is interpolated.
- **Yellow**: the current progress contains a keyframe for this row.

All modifications are blocked unless a keyframe is actively set. To unblock, toggle **auto-keyframe** mode in the timeline.

#### Randomized Values (Min/Max)

Many fields come as a **(Min)** and **(Max)** pair. Each particle picks a random value within that range when it spawns (see [Randomness](#randomness)). **ParticleBiasLink** nodes link certain keyframe properties to the same random roll, so they vary together instead of independently.

### 2. Timeline View

The timeline view controls the overall progress and keyframe values. It shows the keyframe tracks of whatever node is selected. A node with no animated values has no tracks.

| Action | Input |
|---|---|
| Scrub / select | **Left click** |
| Add a keyframe | <kbd>Ctrl</kbd> + **Left click** |
| Pan | **Middle-click drag** |
| Zoom | **Scroll wheel** |
| Play / pause | <kbd>Space</kbd> |
| Reset to start | <kbd>Home</kbd> |
| Toggle full simulation | <kbd>F</kbd> |

Useful toggles: **auto-keyframe** records a keyframe whenever you change a value, and **show unused** reveals tracks you haven't touched yet. The timeline can be docked to the bottom or the side.

There are two modes:

- **Keyframes**: runs from 0% to 100% of the lifecycle of the Effect Rule. The lifecycle represents the time when events live and individual particles can spawn; it does not represent the full life duration of each particle.
- **Simulation**: simulates the entire particle duration. This goes beyond the 0-100% range and spans the entire duration until all particles in the view have died. In this mode you cannot edit keyframe values directly, since editing is only possible within the original emitter's range.

Overview of timelines:

![Keyframes timeline](/catalyst/keyframes_timeline.png)
*Keyframes Timeline*

![Simulation timeline](/catalyst/simulation_timeline.png)
*Simulation Timeline*

In the keyframes mode, every event emitter is rendered as a draggable area with an adjustable start and end, similar to a clip in video editing software. Each EventEmitter is a **TrackGroup** containing multiple Tracks and TrackGroups. Every TrackGroup previews the keyframes its child tracks contain. The EventEmitter is the only TrackGroup that can act as a sub-timeline with its own progress, since the progress of keyframes within events is relative.

![Event emitter track group](/catalyst/event_emitter_track_group.png)
![Track group keyframes preview](/catalyst/track_group_keyframes_preview.png)

{{% alert color="warning" %}}
**Which clock a track runs on depends on the node.** Tracks on a particle property (such as a Color or Size behavior with **Color Timing** set to `Point`) run across *one particle's lifetime*: position 0 is the moment a particle is born, the end is its death. Tracks on an Effect Rule or Event Emitter run across the effect's playback.
{{% /alert %}}

### 3. Preview View

This component previews the active effect.

| Action | Input |
|---|---|
| Orbit | **Middle-click drag** |
| Pan | <kbd>Shift</kbd> + **Middle-click drag** |
| Zoom | **Scroll wheel** |

- **Editor Mode** (default)

  ![Editor mode](/catalyst/editor_mode.png)

  Combines particle rendering with wireframes to show how the entire effect behaves in the world. This mode also visualizes domains. Domains are selectable in Editor/Wireframe/Sim mode and can be moved with a gizmo, using the **select**, **translate** and **rotate** tools.

  ![Editor mode gizmo](/catalyst/editor_mode_gizmo.png)

  Keyframe or auto-keyframing is required.

  ![Editor mode domain](/catalyst/editor_mode_domain.png)

- **Preview Mode**

  ![Preview mode](/catalyst/preview_mode.png)

  Displays the effect like the game would, by only showing emitted particles.

- **Wireframe Mode**

  ![Wireframe mode](/catalyst/wireframe_mode.png)

  Renders everything as bounding boxes to display a particle's true size and location. Useful for checking spawn volumes.

- **Simulation Mode**

  ![Simulation mode](/catalyst/simulation_mode.png)

  Renders every particle as colored dots. Useful for seeing where a particle spawns, moves towards, and dies, without the visuals getting in the way.

#### Randomness

Each effect in the game is spawned with a random seed. This affects any parameters defined as a range (Min, Max): a random value within that range is picked. The preview component in Catalyst has three predefined random presets. **Bias links** are used to link certain keyframe properties to the same random seed.

Each preset is deterministic. The preview is drawn at the timeline's current position using the chosen seed, so the same preset always gives the same result. Switch between presets to check that your effect still looks right with a different random roll, and keep one preset selected when comparing changes. The selected preset is remembered per effect tab.

---
## Clip Regions

Clip Regions Editor creates sprite data for particles. It splits a texture into **Clip Regions**, where each region is one sprite. A particle can play through these sprites as an animation, or use them for variation between particles.

### Creating a Sprite Map

1. Open a texture from the **Textures** tab of the [library panel](#library-panel). To use your own texture, import a `.dds` file first.
2. Specify the row and column count of the sprites in the texture.
3. Click **Create Clip Regions**. This opens the Clip Regions Editor, and a grid appears over the texture that defines the sprites.

![Clip Regions Editor with clip regions](/catalyst/sprite_editor_with_clip_regions.png)

If a region is too large for its sprite, select the tile and resize the region to crop it.

To see the sprites animated, click **Preview Animation**, then **Play**. Frames play from left to right, from top to bottom.

{{% video src="/catalyst/sprite_editor_preview.webm" %}}

### Using a Sprite Map in an Effect

Create a **ParticleDrawSprite** node and a **SpriteShader** node. Connect the SpriteShader to the ParticleDrawSprite's **Shader** input, connect the ParticleDrawSprite to the Particle Rule's **Draw Command** input, and set the SpriteShader's **Texture Map** to your texture (see [Draw Nodes and Behaviors](#draw-nodes-and-behaviors)).

To animate the sprite, set the following values on the **ParticleDrawSprite** node:

| Setting | Value |
|---|---|
| **Texture Frame min** | `0` |
| **Texture Frame max** | `(rows * columns) - 1` |
| **Last Frame** | `(rows * columns) - 1` |
| **Enable Texture Animation** | `true` |
| **Match Remaining life** | `true` |

For example, a sprite map with 7 rows and 7 columns has 49 frames, so **Texture Frame max** and **Last Frame** are both `(7 * 7) - 1 = 48`.

{{% video src="/catalyst/animation_preview.webm" %}}

### Importing and Exporting Clip Regions

Clip regions are not stored in the `.ypt`. GTAV reads them from a single `ptxclipregions.dat` file that holds the sprite map data for the particle textures of the whole game. It is not a file that each DLC adds to: whenever new particles are added, the whole file is replaced in `update.rpf`. Catalyst can import and export this file.

**To import**, choose **File -> Import Clip Regions...** and select a `ptxclipregions.dat` file. Catalyst applies its entries to the textures they describe in all open projects.

**To export**, choose **File -> Export Clip Regions...**. In the export window:

1. Set the output path for the new `ptxclipregions.dat`.
2. Tick the projects to export. Catalyst exports the clip regions of all textures in the ticked projects.
3. Optionally, pick a **base** `ptxclipregions.dat`. The exported file then contains all entries from the base file as well as the new entries from your projects.

Because the game uses one file for all particles, pick the game's own `ptxclipregions.dat` as the base. This way the exported file still contains the clip regions of the game's existing particles.

---
## Troubleshooting

### Nothing appears in the preview -->

Work down this list:

1. **No Draw node.** The Particle Rule's **Draw Command** input must have a Draw Sprite, Draw Trail or Draw Model connected. This is the most common cause.
2. **No shader.** Draw Sprite and Draw Trail both need one.
3. **No texture** on the Sprite Shader's **Texture Map**.
4. **Event Emitter not connected** to the Effect Rule's **Event Emitters** input.
5. **Timeline is past the End Time.** Press <kbd>Home</kbd> to reset, then <kbd>Space</kbd>.
6. **Particle Life is 0** on the Emitter Rule, so particles die the instant they're born.
7. **Alpha keyframed to 0 everywhere.** Check the Color track starts opaque.

### Particles appear but don't move

Check that the **Target Domain** is connected and has a non-zero **Outer Size**. It sets the launch direction. Also confirm **Speed Scalar** on the Emitter Rule isn't 0.

### Particles all spawn from one point

The **Creation Domain** isn't connected, or its **Outer Size** is 0.

### A behavior does nothing

Some behaviors need a partner and do nothing without it, with no error shown. See the dependency table in [Draw Nodes and Behaviors](#draw-nodes-and-behaviors).

### A burst comes out as a steady stream

**Spawn All At Once** is off on the Emitter Rule, so **Spawn Rate Over Time** drives emission instead.

### No textures or meshes in the Global group

Catalyst couldn't load the game's `core.ypt`. Restart Catalyst and point the locate-game dialog at your `GTA5.exe` or `core.ypt` (see [Pointing Catalyst at Your Game](/docs/catalyst/#pointing-catalyst-at-your-game)).
