---
title: Project building
weight: 930
---

FxDK allows you to build a complete runnable server instance with all enabled resources from project, with runnable server artifact included.

After building, under user-specified build path, FxDK will create a set of configuration files, `resources` folder with **enabled** and `artifact` folder containing latest server artifact from update channel selected in project settings (`latest` by default).


# Server artifact
By default, building process will also put a copy of server artifact in build directory.

If build folder already contains artifact and it is of outdated version, FxDK will use versioning mechanism to allow fast rollback, meaning that new artifact will replace what was there before in `artifact` folder, old artifact will be in `artifact-TIMESTAMP` folder next to `artifact`.

Including server artifact is optional and can be disabled either in project settings or in project build modal.

> Currently, building only supports windows artifacts.
> When building for linux deploy target, disable artifact inclusion and resort to manual artifact deployment.


# Resources versioning
By default, when building project against previous build, FxDK will use versioning mechanism, same as for artifact, so old resources build will be moved to `resources-TIMESTAMP` folder, again, allowing for fast rollback.

This is optional and can be disabled either in project settings or in project build modal.

If disabled, old `resources` folder will be permanently deleted and new resources will replace it.


# Variables
All defined variables (convars, Steam WebAPI key, Tebex secret), will be placed in `variables.cfg` file in build folder.

> This file is not supposed to be edited by user, **FxDK will overwrite it on build**.


# License key
For running public server you need to specify license key obtained at https://portal.cfx.re/.

FxDK purposefully does not provide any way to enter this key in user interface because of security concerns.

This will be revisited once we implement sign-in procedures in FxDK, see [#865 GitHub issue](https://github.com/citizenfx/fivem/issues/865).

You will need to manually specify your server's license key in `server.cfg` file in build folder, this file won't be overwritten on any consequent build. In addition, if running server with `start.cmd` script, it will check if you've entered license key there before running the server.


# Slots
By default built server is configured with 48 slots, if your license key allows for more - please change the value in `server.cfg` file.
