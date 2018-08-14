---
title: Setting up a server
weight: 110
---

# Running FXServer

FXServer is the name of the current CitizenFX server version. This page shows you how to run it.

Running from Build Artifacts
----------------------------
# Windows
- Make sure you have installed a newer Visual C++ redistributable, 2017 is fine ( direct link to the 2017 setup <https://go.microsoft.com/fwlink/?LinkId=746572> )
- Create a new folder (for example `D:\FXServer`).
- Download the latest `master` branch build for Windows from the [artifacts server](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
- Extract the build.
- * Use any archiving tool (such as WinRAR or 7-Zip).
- Clone [cfx-server-data](https://github.com/citizenfx/cfx-server-data) in a new folder (other than your FXServer folder).
- * `git clone https://github.com/citizenfx/cfx-server-data.git server-data`
- Make a **server.cfg** in your `server-data` folder. You need to copy the example cfg below into the file.
- Run the server from the `server-data` folder. (`cd /d D:\FXServer\server-data`)
- * `D:\FXServer\run.cmd +exec server.cfg` (from a new cmd window)
- Generate a license code from <https://keymaster.fivem.net> and register for an account.

# Linux
- Create a new folder (for example `mkdir /home/username/server`).
- Download the latest `master` branch build for Linux from the [artifacts server](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/) (copy the URL for the latest server version and use `wget <url>` to download it).
- Extract the build using `cd path/to/server/folder && tar xf fx.tar.xz` (you need to have `xz` installed, on Debian/Ubuntu this is in the `xz-utils` package).
- Clone [cfx-server-data](https://github.com/citizenfx/cfx-server-data) in a new folder (other than your FXServer folder).
- * For example `git clone https://github.com/citizenfx/cfx-server-data.git /home/username/server-data`
- Make a **server.cfg** file in your `server-data` folder (copy the example server.cfg file below into that file).
- Run the server from the `server-data` folder.
- * `bash /home/username/server/run.sh +exec server.cfg`
- Generate a license code from <https://keymaster.fivem.net> and register for an account.

Troubleshooting
---------------

-   If you don't get any 'resources found', and it says 'Failed to start resource', you didn't 'cd' to the right folder.
-   If you get a lot of errors about citizen:/scripting/, you didn't use run.cmd.
-   If nothing happens at all except 'sending heartbeat', you didn't use run.cmd **and** failed to cd to the folder.
-   If no resources get started, and you can't connect, you didn't add +exec.
-   Mono errors _on startup_ (SIGSEGV, exception stack trace) are perfectly fine, and don't signify any error condition.
-   If you get 'Couldn't load resource sessionmanager', then input `restart sessionmanager` into the console input. This is a temporary workaround, and only happens after the cache was initially generated.

server.cfg
----------

An example server.cfg follows.

```toml
# you probably don't want to change these!
# only change them if you're using a server with multiple network interfaces
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

start mapmanager
start chat
start spawnmanager
start sessionmanager
start fivem
start hardcap
start rconlog
start scoreboard
start playernames

sv_scriptHookAllowed 1

# change this
#rcon_password yay

# a comma-separated list of tags for your server
# for example: sets tags "drifting, cars, racing" or sets tags "roleplay, military, tanks"
sets tags "default"

# set an optional server info and connecting banner image url.
# size doesn't matter, any banner sized image will be fine.
#sets banner_detail "http://url.to/image.png"
#sets banner_connecting "http://url.to/image.png"

sv_hostname "My new FXServer!"

# nested configs!
#exec server_internal.cfg

# loading a server icon (96x96 PNG file)
#load_server_icon myLogo.png

# convars for use from script
set temp_convar "hey world!"

# disable announcing? clear out the master by uncommenting this (your server will not be listed in the serverlist if you uncomment this!)
#sv_master1 ""

# want to only allow players authenticated with a third-party provider like Steam (don't forget, Social Club is a third party probvider too!)?
#sv_authMaxVariance 1
#sv_authMinTrust 5

# add system admins
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but don't allow quit
add_principal identifier.steam:110000112345678 group.admin # add the admin to the group

# remove the # to hide player endpoints in external log output
sv_endpointprivacy true

# server slots limit (must be between 1 and 31)
sv_maxclients 30

# license key for server (https://keymaster.fivem.net)
sv_licenseKey changeme
```

For more commands/variables, check `cmdlist` over rcon. Most commands/set functions can be executed over the command line too, similar to Quake.
