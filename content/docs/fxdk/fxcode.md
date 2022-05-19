---
title: FXCode
weight: 940
---

[FXCode](https://github.com/citizenfx/fxcode), an adaptation of [`Code - OSS`](https://github.com/microsoft/vscode), is FxDK's main *personality* responsible for providing rich code editing functionality along with our addons listed below.


## Game view

Instead of running FiveM separately, in FxDK it runs in the background and `Game view` FXCode widget provides access to it, allowing reorganizing workspace to your needs.


## Consoles

Provides access to both game console (the one you'd open with F8 hotkey) and server console.


## Resource monitor

Combines game and server resource monitors in one place, providing quick access to vital information about system resources consumption.


## JS/TS support

We extend JS/TS language support by automatically loading code completions of these scripting runtimes, although it is not very smart and fine-grained yet, like so that it won't limit native suggestions based on whether the current script is server-sided or client-sided.


## C#/CLR support

This is expected to behave as it'd in normal Microsoft's VSCode, we automatically install the needed extension.


## Lua support

This relies on [Sumneko's Lua Language Server](https://github.com/sumneko/lua-language-server) extension that provides similar to JS/TS coding experience. However, there's currently no automatic loading of needed type definitions, this is still a work in progress.