---
title: FxDK
weight: 900
---

The Cfx.re Development Kit, FxDK for short, is an integrated development environment designed to provide a smooth developer experience for FiveM.

Detailed documentation links:

 - [FXCode](/docs/fxdk/fxcode)
 - [Resources](/docs/fxdk/resources)
 - [World Editor](/docs/fxdk/world-editor)

# Highlights

## Live code editing experience
With FxDK you no longer have to switch between your server console and game to restart resources. FxDK detects changes in your [resources](/docs/fxdk/resources) and will restart them automatically.

![live edit showcase](/fxdk/live-edit.webp)

## Integrated essentials
A game console, server console and combined resource monitor, all in one place.

![combined resource monitor showcase](/fxdk/resource-monitor.png)

![consoles showcase](/fxdk/consoles.png)

## Excellent coding experience
Thanks to the amazing the open source code editor by Microsoft, we're able to integrate a cutting edge coding experience appropriately named [FXCode](/docs/fxdk/fxcode).

![fxcode showcase](/fxdk/code.png)

## Code editor extensions
In FxDK, you can use all of your favorite extensions that you normally use in VSCode.

![fxcode extensions](/fxdk/extensions.png)

## World Editor
No more handcrafted scripts to place objects on a map, [World Editor](/docs/fxdk/world-editor) allows you to do it the same way you'd do it in Unity editor or Unreal Engine editor, visually.

![world editor showcase](/fxdk/world-editor.jpg)

## Ready-to-deploy server builds
In FxDK, [building](/docs/fxdk/project-building) deploy-ready server is as easy as clicking on a button, batteries included.

![project building modal showcase](/fxdk/project-building.png)


# Getting started

> If you have FiveM installed - skip to step 2.

1. [Install FiveM](/docs/client-manual/installing-fivem).
2. Next to `FiveM.exe` you'll find a shortcut named `FiveM - Cfx.re Development Kit (FxDK)`.
3. Follow intro or skip and start creating right away.


# Projects
FxDK operates on so called **projects**. Project, in a nutshell, is a dedicated folder on your disk where all project files live. It is a collection of all assets, scripts, models and other files, treat projects like a complete runnable server.

Currently, there're two types of assets:
 - [Resource](/docs/fxdk/resources)
 - [Map](/docs/fxdk/world-editor)

If you're familiar with how typical server's folder is structred, FxDK projects are a bit different in a way that there's no limitation on where exactly you put your resources.

FxDK provides system resources automatically, you just enable what you need in project settings, unlike how normally you'd download them from https://github.com/citizenfx/cfx-server-data/.


# Limitations
FxDK was designed as a local-only development environment for a single user, however, many people have asked us about that it would be useful to let other users to join you on a dev session, and we understand this demand, however, there're some technical difficulties wrapping this problem.

This implies a lot of things needs to be done to make it work as you'd expect, we have some plans about it, but it's a long-term concern and you should not expect multi-user experience soon.


# Contributing
If you have any suggestions, bug reports or questions, please [file an issue on our GitHub](https://github.com/citizenfx/fivem/issues/new).

For all existing FxDK related issues see [`sdk` labelled issues](https://github.com/citizenfx/fivem/issues?q=is%3Aopen+is%3Aissue+label%3Asdk).
