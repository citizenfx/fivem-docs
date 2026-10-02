---
nav_group: Products
title: Catalyst
weight: 95
---

## Catalyst Documentation

Catalyst is an editor for creating and editing particle effects for GTAV. You build an effect as a node graph, watch it simulate live while you change it, and export it as a `.ypt` for **Legacy**, **Enhanced**, or both. This section of the documentation is split into three articles:

- **Introduction** (this page): what Catalyst is and how to install it.
- [Catalyst Overview](/docs/catalyst/overview/): a tour of the interface and an explanation of how effects are built.
- [Example Project](/docs/catalyst/example-project/): a step-by-step tutorial that takes you from a new project to an effect running in FiveM.

{{% alert color="info" %}}
**New to Catalyst?** Read [How Effects Are Built](/docs/catalyst/overview/#how-effects-are-built) first. It explains the structure that every other part of the editor relies on. Then follow the [Example Project](/docs/catalyst/example-project/). Importing one of the game's own `.ypt` files and taking it apart is also one of the fastest ways to learn how effects are put together.
{{% /alert %}}

## Overview

| | |
|---|---|
| **What can you make?** | Particle effects such as fire, smoke, sparks, dust, water, light and decals |
| **How you make them** | A node graph with a keyframe timeline and a live preview |
| **What comes out** | `.ypt` files for Legacy and/or Enhanced |
| **Platform** | Windows 10 and 11. Installs per-user, no admin rights needed |

If you've modified particle effects before, the development loop was probably: open the file, change some numbers, repackage, load the game, look, repeat. Catalyst changes three things:

- **You see the effect while you edit it.** The preview simulates as you change values, so most of the work that used to need a game launch no longer does.
- **Values are curves, not single numbers.** A particle's color, size and rotation are animated across its lifetime. "Fade out as it dies" takes two keyframes, where a single fixed value could only approximate it.
- **The structure is explicit.** An effect's parts (what spawns, where, how many, what each particle does) are separate connected nodes that you can inspect, rename and reuse.

### What Catalyst Does and Doesn't Do

**It does:**

- Create effects from scratch, and import existing `.ypt` files to edit or learn from
- Organise effects into **collections**, where one collection is one exported `.ypt`
- Use the game's own textures and meshes through a read-only **Global** pool loaded from `core.ypt`
- Import your own `.dds` textures and `.ydr` meshes

**It doesn't:**

- Create or edit textures. You will need finished `.dds` files.
- Model or rig meshes. You will need finished `.ydr` files.
- Pack into RPFs or install to your game. Use OpenIV, CodeWalker or a FiveM resource for that (see [Implementing in FiveM](/docs/catalyst/example-project/#4-implementing-in-fivem)).
- Place effects in the world or script their triggers.

### Legacy and Enhanced

GTAV Legacy and GTAV Enhanced read particle files differently, so Catalyst writes them separately:

| Target | Export produces |
|---|---|
| **Legacy** | `<name>_legacy.ypt` |
| **Enhanced** | `<name>_enhanced.ypt` |

You pick either or both at export time, from the same project, so you never maintain two versions of an effect by hand.

### File Types

| Extension | Used for |
|---|---|
| `.ctlst` | Catalyst project files |
| `.ypt` | Particle files, for import and export |
| `.dds` | Textures |
| `.ydr` | Meshes (drawables) |
| `.dat` | `ptxclipregions.dat`, the clip regions (sprite map data) of particle textures, for import and export |

---

## Installation

| | |
|---|---|
| **Operating system** | Windows 10 or 11. Older versions of Windows are not supported |
| **Admin rights** | Not needed. Catalyst installs per-user |
| **Install location** | `%LOCALAPPDATA%\Cfx\Catalyst` by default |
| **GTAV** | Optional, but recommended. See [Pointing Catalyst at Your Game](#pointing-catalyst-at-your-game) |
| **Internet connection** | Not needed. Catalyst works fully offline |

Download the Catalyst installer from the [Cfx Portal](https://portal.cfx.re/downloads), then run it and work through its pages: **Welcome**, **Install location** (change it if you want; anywhere your user account can write is fine), **Shortcuts** (*Create a Desktop shortcut* is ticked by default), then **Install** and **Finish**.

You get a **Start Menu -> Catalyst** folder (containing *Catalyst* and *Uninstall Catalyst*), a Desktop shortcut if you left it ticked, and an **Add/Remove Programs** entry. The installer makes no machine-wide changes.

It also sets up two file associations:

| File type | What happens |
|---|---|
| `.ctlst` | Becomes a **Catalyst Project**, gets the Catalyst icon and opens in Catalyst on double-click |
| `.ypt` | Gains an **Import in Catalyst** entry on its right-click menu |

Catalyst does **not** make itself the default handler for `.ypt`, so OpenIV, CodeWalker and other tools keep working as before. Right-click -> **Import in Catalyst** on any `.ypt` is the quickest way into the tool.

### Pointing Catalyst at Your Game

On startup, Catalyst looks up your GTAV installation in the registry and loads the game's `core.ypt` in the background as a read-only **Global** asset pool. This pool lets you use the game's existing textures and meshes without copying anything into your project. Usually this just works, and the Global group appears in the library panel's **Textures** and **Drawables** tabs.

If the load fails (for example a missing or incomplete install, or an unreadable archive), a locate-game dialog appears. Point it at either your **`GTA5.exe`** or a **`core.ypt`** file directly, and Catalyst retries the load.

You can also dismiss the dialog and keep working. Catalyst is fully usable without GTAV, but without the Global pool you'll need to import your own `.dds` textures and `.ydr` meshes. Effects authored this way still export normally. To get the pool back after dismissing the dialog, restart Catalyst.

### Updating and Uninstalling

When an **update** is available, Catalyst offers to install it when it starts. Updating is optional: you can skip it and keep using your current version, and install the update later. Updates install over your existing copy, keeping your shortcuts and file associations.

**To uninstall**, use **Settings -> Apps -> Catalyst -> Uninstall** or **Start Menu -> Catalyst -> Uninstall Catalyst**. This removes the program, its shortcuts, the `.ctlst` association and the `.ypt` right-click entry. Your projects and exported files are not deleted. Only the installation folder is removed, so don't save projects inside `%LOCALAPPDATA%\Cfx\Catalyst`.
