---
title: txAdmin
---

## About
**txAdmin** is a **full-featured** web panel to help you Manage & monitor your FiveM Server.  
Contrary to the other resources on this documentation (eg. chat, mapmanager etc), **txAdmin** already comes preinstalled with FXServer, so you do not need to download it separately.

For more information, you can join the [Discord Server](https://discord.gg/AFAAXzq).

## Main Features
- Recipe-based Server Deployer: create a server in under 60 seconds!
- Start/Stop/Restart your server instance or resources
- Full-featured in-game admin menu:
	- Player Mode: NoClip, God, SuperJump
	- Teleport:  waypoint, coords and back
	- Vehicle: Spawn, Fix, Delete, Boost
	- Heal: yourself, everyone
	- Send Announcements
	- Reset World Area
	- Show player IDs
	- Player search/sort by distance, ID, name
	- Player interactions: Go To, Bring, Spectate, Freeze
	- Player troll: make drunk, set fire, wild attack
	- Player ban/warn/dm
- Access control:
	- Login via Password or CitizenFX
	- Admin permission system
	- Action logging
	- Brute-force protection
- Discord Integration:
	- Server configurable, persistent, auto-updated status embed
	- Command to whitelist players
	- Command to display player info
- Monitoring:
	- Auto Restart FXServer on crash or hang
	- Server’s CPU/RAM consumption
	- Live Console (with log file, command history and search)
	- Server threads performance chart with player count
	- Server Activity (Log connections/disconnections, kills, chat, explosions and custom commands)
- Player Manager:
	- [Warning system](https://www.youtube.com/watch?v=DeE0-5vtZ4E)
	- Ban (temporarily or permanently) system
	- Whitelist system (Discord member, Discord Role, Approved License, Admin-only)
	- Take notes about players
	- Keep track of player's play and session time
	- Self-contained player database with backup tool (no MySQL required!)
	- Clean/Optimize the database by removing old players, or bans/warns/whitelists
- Real-time playerlist
- Scheduled restarts with warning announcements and custom events
- Translation Support
- FiveM's Server CFG editor & validator
- Responsive web interface with Dark Mode 😎

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
