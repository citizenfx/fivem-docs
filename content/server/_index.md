---
title: "Server Administration"
---

# Running FXServer

FXServer is the name of the current CitizenFX server version. This page shows you how to run it.

Running from Build Artifacts
----------------------------

1.  Download the latest `master` branch build for your platform (Windows or Linux/PRoot) from the [artifacts server](https://runtime.fivem.net/artifacts/fivem/).
2.  Extract the build.
    -   **Linux**: `cd path/to/fxs && tar xf fx.tar.xz` (you need to have `xz` installed, on Debian/Ubuntu this is in the `xz-utils` package)
    -   **Windows**: Use any archiving tool (such as WinRAR or 7-Zip).
3.  Clone [cfx-server-data](https://github.com/citizenfx/cfx-server-data) in a new folder (other than your FXServer folder).
    -   `git clone `[`https://github.com/citizenfx/cfx-server-data.git`](https://github.com/citizenfx/cfx-server-data.git)` server-data`
4.  Make a [server.cfg](#server.cfg "wikilink") in your `server-data` folder.
5.  Run the server from the `server-data` folder. (`cd /d X:\cfx-server-data` or `cd /home/server/cfx-server-data`)
    -   **Linux**: `bash /home/server/files/run.sh +exec server.cfg`
    -   **Windows**: `C:\artifacts\run.cmd +exec server.cfg`

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

sv_scriptHookAllowed 1

# change this
#rcon_password yay

sv_hostname "My new FXServer!"

# nested configs!
#exec server_internal.cfg

# loading a server icon (96x96 PNG file)
#load_server_icon myLogo.png

# convars for use from script
set temp_convar "hey world!"

# disable announcing? clear out the master by uncommenting this
# this is not related to your server not showing up if the # is still there
#sv_master1 ""

# want to only allow players authenticated with a more permanent identifier?
#sv_authMaxVariance 1
#sv_authMinTrust 5

# add system admins
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but don't allow quit
add_principal identifier.steam:110000112345678 group.admin # add the admin to the group

# hide player endpoints in external log output
#sv_endpointprivacy true

# server slots limit (default to 24)
sv_maxclients 8
```

For more commands/variables, check `cmdlist` over rcon. Most commands/set functions can be executed over the command line too, similar to Quake.
