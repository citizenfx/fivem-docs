---
title: Setting up a server
weight: 310
---

Running FXServer
================

FXServer is the name of the current CitizenFX server version. This page shows you how to run it.

Having trouble running your server? Visit [server issues][server-issues], use the Discord [#fxserver-support][fxserver-support] channel or create a topic in the [Server Discussion][fxserver-support-category] sub-category on the forum.

Windows
-------

#### Prerequisites
1. [Visual C++ Redistributable 2019][vcredist] or newer.
2. [Git][git-scm] to assure a correct installation.

#### Installation
1. Create a new folder (for example `D:\FXServer`).
2. Download the latest `master` branch build for Windows from the [artifacts server][windows-artifacts].
3. Extract the build.
  <br>3b. Use any archiving tool (such as WinRAR or 7-Zip).
4. Clone [cfx-server-data][server-data] in a new folder (outside of your FXServer folder).
  <br>4b. `git clone https://github.com/citizenfx/cfx-server-data.git server-data`
5. Make a **server.cfg** in your `server-data` folder. You need to copy the example cfg below into the file.
6. Generate a license key at <https://keymaster.fivem.net>.
7. Set the license key in your server.cfg using `sv_licenseKey "licenseKeyGoesHere"`.
8. Run the server from the `server-data` folder. For example, in a plain Windows command prompt (cmd.exe) window: 
    ```dos
    cd /d D:\FXServer\server-data
    D:\FXServer\server\run.cmd +exec server.cfg
    ```

    (the `/d` flag is only needed when changing directory to somewhere on a different drive)

---

Linux
-----
1. Create a new folder (for example `mkdir /home/username/server`).
2. Download the latest `master` branch build for Linux from the [artifacts server][linux-artifacts](copy the URL for the latest server version and use `wget <url>` to download it).
3. Extract the build using `cd path/to/server/folder && tar xf fx.tar.xz` (you need to have `xz` installed, on Debian/Ubuntu this is in the `xz-utils` package).
4. Clone [cfx-server-data][server-data] in a new folder (other than your FXServer folder).
  <br>4b. For example `git clone https://github.com/citizenfx/cfx-server-data.git /home/username/server-data`
5. Make a **server.cfg** file in your `server-data` folder (copy the example server.cfg file below into that file).
6. Generate a license key at <https://keymaster.fivem.net>.
7. Set the license key in your `server.cfg` using `sv_licenseKey "licenseKeyGoesHere"`.
8. Run the server from the `server-data` folder.
  <br>8b. `bash /home/username/server/run.sh +exec server.cfg`

Common issues
---------------

- If you don't get any 'resources found', and it says 'Failed to start resource', you didn't 'cd' to the right folder.
- If you get a lot of errors about citizen:/scripting/, you didn't use run.cmd.
- If nothing happens at all except 'sending heartbeat', you didn't use run.cmd **and** failed to cd to the folder.
- If no resources get started, and you can't connect, you didn't add +exec.
- If you get 'no license key was specified', one of the above things applies.

server.cfg
----------

An example server.cfg follows.

```sh
# Only change the IP if you're using a server with multiple network interfaces, otherwise change the port only.
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

# These resources will start by default.
ensure mapmanager
ensure chat
ensure spawnmanager
ensure sessionmanager
ensure fivem
ensure hardcap
ensure rconlog
ensure scoreboard

# This allows players to use scripthook-based plugins such as the legacy Lambda Menu.
# Set this to 1 to allow scripthook. Do note that this does _not_ guarantee players won't be able to use external plugins.
sv_scriptHookAllowed 0

# Uncomment this and set a password to enable RCON. Make sure to change the password - it should look like rcon_password "YOURPASSWORD"
#rcon_password ""

# A comma-separated list of tags for your server.
# For example:
# - sets tags "drifting, cars, racing"
# Or:
# - sets tags "roleplay, military, tanks"
sets tags "default"

# Set an optional server info and connecting banner image url.
# Size doesn't matter, any banner sized image will be fine.
#sets banner_detail "https://url.to/image.png"
#sets banner_connecting "https://url.to/image.png"

# Set your server's hostname
sv_hostname "FXServer, but unconfigured"

# Nested configs!
#exec server_internal.cfg

# Loading a server icon (96x96 PNG file)
#load_server_icon myLogo.png

# convars which can be used in scripts
set temp_convar "hey world!"

# Uncomment this line if you do not want your server to be listed in the server browser.
# Do not edit it if you *do* want your server listed.
#sv_master1 ""

# Add system admins
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but don't allow quit
add_principal identifier.steam:110000100000000 group.admin # add the admin to the group

# Hide player endpoints in external log output.
sv_endpointprivacy true

# Server player slot limit (must be between 1 and 32, unless using OneSync)
sv_maxclients 32

# License key for your server (https://keymaster.fivem.net)
sv_licenseKey changeme
```

What's next?
------------

- [Using server commands][server-commands]
- [Start scripting][scripting-introduction]

[windows-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/
[linux-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
[server-data]: https://github.com/citizenfx/cfx-server-data

[vcredist]: https://aka.ms/vs/16/release/VC_redist.x64.exe
[winrar]: https://www.rarlab.com/download.htm
[7zip]: https://www.7-zip.org/download.html
[git-scm]: https://git-scm.com/download/win

[server-issues]: /support/server-issues
[server-commands]: /server-manual/server-commands
[scripting-introduction]: /scripting-manual/introduction

[fxserver-support]: https://discord.gg/UwvVgsJ
[fxserver-support-category]: https://forum.fivem.net/c/server-development/server-discussion