---
title: What's Changed in FiveM for GTAV Enhanced
weight: 50
description: >
    Differences between FiveM Legacy and FiveM for GTAV Enhanced: removed features, breaking changes, and new config variables.
---

This page covers what's changed for server owners and resource developers moving from FiveM Legacy to FiveM for GTAV Enhanced: removed features, breaking changes, new config variables, and behavioral differences. Review the breaking changes before switching, as some require code or config updates.

## Migration & Breaking Changes

### Removed Features

| Feature | Notes |
|---------|-------|
| P2P Sync | FiveM for GTAV Enhanced no longer uses P2P synchronization and has instead switched to a client-server model. This change reduces latency. |
| OneSync non-big mode | No longer exists; OneSync big mode is now the only mode. Non-big mode was the legacy OneSync behavior. The difference is player event scoping: in big mode, player connect/disconnect events only arrive when the player is in range, whereas in non-big mode they arrived regardless of location. |
| ARQ (`onesync_automaticResend`) | Previously defaulted to `false`; now removed entirely |
| Asset Escrow | Not implemented yet |
| `sv_netHttp2` | HTTP/2 support removed |
| DevCon server ports (29200, 29300) | Removed |
| Server ImGui GUI | Removed |
| `+set moo 31337` developer command | Was used in Gen8 to enable devmode; removed. Client dev tools now only work when `sv_devMode true` is set on the server. Dev mode can also be set via the connection deferral handover. |
| `sv_useAccurateSends` | Deprecated (see `sv_syncTickRate` below) |
| `-cl2` parameter | Deprecated. Check the [running-two-fivem-clients](https://docs.fivem.net/docs/client-manual/running-two-fivem-clients/) article for more information. |
| Mumble | Deprecated. Check the [voice](https://docs.fivem.net/docs/scripting-manual/voice/) article for more information. |

---

### New Features

#### Unregistering Server Commands

You can now unregister server commands:

```lua
local commandID = RegisterCommand(...)
UnregisterCommand(commandID)
```

### Breaking Changes

#### Key-Value DB Files

Key-value DB files **must be migrated**.
We will provide a migration script to assist with this process.

#### Remote Commands

Remote commands no longer return the full log to the client. You must now explicitly call:

```lua
PrintRemoteCommandLog(message)
```

so that it appears on the client.

#### Resource Builders

Resources can no longer be builders.

#### DevCon Ports

DevCon server ports 29200 and 29300 were removed.

#### Server ImGui

Server ImGui GUI was removed.

#### Mono to .NET

Mono was replaced by **.NET**.
The only requirement for .NET is a .NET 10 SDK and optionally some IDE.
We will share more information on what this means for developers in the future.

#### Pure Mode

Pure mode is now **always enabled** and can no longer be turned off.
While FiveM for GTAV Enhanced is in early access, graphic mods cannot be used.

#### Endpoints

`endpoint_add_tcp` and `endpoint_add_udp` now support only a **single endpoint** instead of multiple endpoints.

#### Developer Mode

The `+set moo 31337` command (used in Gen8 to enable devmode) was removed.  
Enabling devmode in the client now requires `sv_devMode true` to be set on the server side (in the server.cfg).

#### Deprecated & Compatibility Variables

The following variables exist only for backward compatibility and have no effect:

| Variable | Type | Default | Notes |
| -------- | ---- | ------- | ----- |
| `onesync_enableBeyond` | bool | `false` | Does nothing. |
| `sv_enhancedHostSupport` | bool | `false` | Not used anymore. |
| `sv_protectServerEntities` | bool | `false` | Not implemented. Use `sv_entityLockdown` instead. |

---

### New Configuration Variables

#### `sv_resourceFileDownloadTimeout`

The timeout in milliseconds for downloading resource files over HTTP. If the download does not complete within this time, it will be canceled.

| Property | Value |
|----------|-------|
| Default | 2 minutes |
| Type | `std::chrono::milliseconds` |

#### `sv_syncTickRate`

Tick rate for the sync thread. Higher values can reduce latency but increase CPU usage.

| Property | Value |
|----------|-------|
| Default | 60 |
| Range | 1-120 |

> **Note:** `sv_useAccurateSends` is deprecated. Specify the sync tick rate explicitly with `set sv_syncTickRate [1, 120]`.
---

### Lockdown Mode Changes

- New lockdown mode: **`full`**, disables dummy object creation.
  - *Dummy objects:* objects on the map which are created dynamically from clients.
- In **relaxed** lockdown mode, population entities can only be spawned if the world grid is owned by the player.

For more information on lockdown modes, see [Entity lockdown](https://docs.fivem.net/docs/scripting-reference/onesync/#entity-lockdown) and the [SetRoutingBucketEntityLockdownMode](https://docs.fivem.net/natives/?_0xA0F2201F) native.

---

### State Bags & Replication

- State bags will only fire callbacks if the entity exists.
- Replicated values are only replicated if explicitly set.

---

### Gamebuilds

FiveM for GTAV Enhanced currently supports only the latest gamebuild (The Kortz Center Heist).
This gamebuild is loaded by default if no other gamebuild is specified.
If you wish to load the base game without any DLCs you can do so by setting `sv_enforceGameBuild 1` in the server.cfg.

For more information on gamebuilds, see [Gamebuilds](https://docs.fivem.net/docs/server-manual/server-commands/#sv_enforcegamebuild-build).

### File Name Changes

In FiveM for GTAV Enhanced, some server files are named differently. The `server.7z` / `fx.tar.xz` archive is named `cfx-server_win_x64` / `cfx-server-linux_x64`, and the `FXServer.exe` executable is named `cfx-server.exe`.
