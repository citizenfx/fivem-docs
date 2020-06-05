---
title: txAdmin
---

## About
**txAdmin** is a **full featured** web panel to help you Manage & monitor your FiveM Server.  
Contrary to the other resources on this documentation (eg. chat, mapmanager and etc), **txAdmin** already comes preinstalled with FXServer, so you do not need to download it separately.

## Main Features
- Start/Stop/Restart your server instance or resources
- Access control:
	- Login via Password or CitizenFX
	- Admin permission system ([more info](permissions))
	- Action logging
	- Login brute-force protection
- Discord Integration:
	- Server status command (`/status`)
	- Command spam prevention
- Monitoring:
	- Auto Restart on crash
	- Server’s CPU/RAM consumption
	- Live Console (with log file)
	- Hitch Detection statistics
	- Online players chart
	- Server Activity Log (connections/disconnections, kills, chat, explosions and custom commands)
- Player Manager:
	- [Warning system](https://www.youtube.com/watch?v=DeE0-5vtZ4E)
	- Ban (temporary or permanently) system
	- Whitelist system
	- Take notes about players
	- Keep track of player's play and session time
	- Self-contained player database (no MySQL required!)
- Real-time playerlist
- Scheduled restarts with warning announcements
- Translation Support
- FiveM's Server CFG editor
- Responsive web interface

## Running (Windows/Linux)
Currently **txAdmin is included in all FXServer builds** above 2401, so to run it for the first time simply do the following:
- Update FXServer to the latest artifact/build (2401 or superior)
- If Windows, run FXServer.exe | If Linux, run `./run.sh`
- Open one of the URLs shown and configure txAdmin

After that you could also run the `start_<build>_<profile>.bat` file created, or call it via cmd/bash if you want to edit the ConVars (ex http port).  
  
txAdmin requires to be launched from *inside* FXServer in monitor mode, to do that, just execute the `run.sh` or `FXServer.exe` without **any** `+exec` arguments.  
  
### ConVars
- **serverProfile:** The name of the server profile to start. Profiles are saved/loaded from the current directory inside the `txData` folder. The default is `default`.
- **txAdminPort:** The TCP port to use as HTTP Server. The default is `40120`.
- **txDataPath:** The path of the data folder. The default on Windows is `<citizen_root>/../txData` and on Linux `<citizen_root>/../../../txData`.
- **txAdminVerbose:** Set to `true` to print on the console more detailed information about errors and events. The default is `false`.
  
ConVar usage **example** for different port and profile:  
```bash
# Windows
./FXServer.exe +set serverProfile dev_server +set txAdminPort 40125

# Linux
./run.sh +set serverProfile dev_server +set txAdminPort 40125
```
