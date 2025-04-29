---
title: txAdmin
---

## About
**txAdmin** is a **full featured** web panel to help you Manage & monitor your FiveM Server.  
Contrary to the other resources on this documentation (eg. chat, mapmanager and etc), **txAdmin** already comes preinstalled with FXServer, so you do not need to download it separately.

For more information, you can join the [Discord Server](https://discord.gg/AFAAXzq).

## Main Features

### Server Management
Start, stop, or restart your server instance or resources, and easily edit your server's configuration using the built-in server CFG editor and validator.

### Server Recipes
Get a server up and running in under 60 seconds using the powerful txAdmin recipe deployer.

### Performance Analytics
Gain detailed insights into your server's performance across all three threads via the in-depth performance chart, including player count tracking.

### Player Management
Manage players with simplicity using the full-featured txAdmin player manager:
- Ban (temporary or permanent)
- Warn players
- Whitelist system (by Discord member, Role, License, Admin-only)
- Take notes about players
- Track player playtime and session time
- Self-contained player database with backup and optimization tools

### Security
Secure your server with:
- Cfx.re authentication
- Admin permission system
- Action logging
- Brute-force protection
- Password/CitizenFX login options

### Monitoring
Effortlessly monitor your server with:
- Auto-restart on crashes or hangs
- Live console with command history, search, and log file
- RAM and CPU usage monitoring
- Server activity logs (connections, disconnections, kills, chat, explosions, custom commands)

### In-Game Admin Menu
Manage players and resources directly from inside the game:
- **Player Mode:** NoClip, God, SuperJump
- **Teleport:** To waypoint, specific coordinates, return
- **Vehicle:** Spawn, fix, delete, boost
- **Heal:** Yourself or all players
- **Player Interactions:** Go to player, bring player, spectate, freeze
- **Trolling:** Make drunk, set fire, wild animal attack
- **Communication:** Announcements, warn, ban, DM players
- **Player Management:** Show player IDs, search/sort by distance, ID, name
- **World Controls:** Reset world areas

### Discord Integration
Enhance server communication and management with:
- Server-configurable, persistent, auto-updated status embeds
- Whitelist players via Discord commands
- View player information directly from Discord

### Scheduled Server Restarts
Set up automatic server restarts with custom warnings and event triggers.

### Translation Support
Multilingual support for global admins.

### Responsive Web Interface
Modern, responsive web panel with full dark mode support 😎.

---

## Server Stats

| Servers Online | Admins | Bans Issued |
|:--------------:|:------:|:-----------:|
| 28.8k          | 155.0k | 2.16m       |

## Running (Windows/Linux)
**txAdmin is included in all FXServer builds** above 2524, so to run it for the first time simply do the following:
- Update FXServer to the latest artifact/build (2524 or superior)
- If Windows, run FXServer.exe | If Linux, run `screen ./run.sh`
- Open one of the URLs shown and configure txAdmin

txAdmin requires to be launched from *inside* FXServer in monitor mode, to do that, just execute the `run.sh` or `FXServer.exe` without **any** `+exec` arguments.  
  
### ConVars
- **serverProfile:** The name of the server profile to start. Profiles are saved/loaded from the current directory inside the `txData` folder. The default is `default`.
- **txAdminPort:** The TCP port to use as HTTP Server. The default is `40120`.
- **txAdminInterface:** The interface to use as HTTP Server. The default is `0.0.0.0`.
- **txDataPath:** The path of the data folder. The default on Windows is `<citizen_root>/../txData` and on Linux `<citizen_root>/../../../txData`.
- **txAdminVerbose:** Set to `true` to print on the console more detailed information about errors and events. The default is `false`.
  
ConVar usage **example** for different port and profile:  
```bash
# Windows
./FXServer.exe +set serverProfile dev_server +set txAdminPort 40121

# Linux
./run.sh +set serverProfile dev_server +set txAdminPort 40121
```
