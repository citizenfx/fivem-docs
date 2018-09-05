---
title: Setting up a server
weight: 310
---

Running FXServer
================

FXServer is the name of the current CitizenFX server version. This page shows
you how to run it.

Having trouble running your server? See [server issues][server-issues] for help.

Windows
-------

- Make sure you have installed [Visual C++ redistributable 2017][vcredist] or newer.
- Create a new folder (for example `D:\FXServer`).
- Download the latest `master` branch build for Windows from the [artifacts server][windows-artifacts].
- Extract the build.
- * Use any archiving tool (such as WinRAR or 7-Zip).
- Clone [cfx-server-data][server-data] in a new folder (other than your FXServer folder).
- * `git clone https://github.com/citizenfx/cfx-server-data.git server-data`
- Make a **server.cfg** in your `server-data` folder. You need to copy the example cfg below into the file.
- Generate a license code on <https://keymaster.fivem.net> using your forum account.
- Use the license code in your `server.cfg`.
- Run the server from the `server-data` folder. (`cd /d D:\FXServer\server-data`)
- * `D:\FXServer\run.cmd +exec server.cfg` (from a new cmd window)

Linux
-----
- Create a new folder (for example `mkdir /home/username/server`).
- Download the latest `master` branch build for Linux from the [artifacts server][linux-artifacts](copy the URL for the latest server version and use `wget <url>` to download it).
- Extract the build using `cd path/to/server/folder && tar xf fx.tar.xz` (you need to have `xz` installed, on Debian/Ubuntu this is in the `xz-utils` package).
- Clone [cfx-server-data][server-data] in a new folder (other than your FXServer folder).
- * For example `git clone https://github.com/citizenfx/cfx-server-data.git /home/username/server-data`
- Make a **server.cfg** file in your `server-data` folder (copy the example server.cfg file below into that file).
- Generate a license code on <https://keymaster.fivem.net> using your forum account.
- Use the license code in your `server.cfg`.
- Run the server from the `server-data` folder.
- * `bash /home/username/server/run.sh +exec server.cfg`

Common issues
---------------

- If you don't get any 'resources found', and it says 'Failed to start resource', you didn't 'cd' to the right folder.
- If you get a lot of errors about citizen:/scripting/, you didn't use run.cmd.
- If nothing happens at all except 'sending heartbeat', you didn't use run.cmd **and** failed to cd to the folder.
- If no resources get started, and you can't connect, you didn't add +exec.
- Mono errors _on startup_ (SIGSEGV, exception stack trace) are perfectly fine, and don't signify any error condition.
- If you get 'Couldn't load resource sessionmanager', then type `restart sessionmanager` into the console input. This is a temporary workaround, and only happens after the cache was initially generated.

server.cfg
----------

An example server.cfg follows.

```sh
# You probably don't want to change these!
# Only change them if you're using a server with multiple network interfaces.
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

# These resources will start by default.
start mapmanager
start chat
start spawnmanager
start sessionmanager
start fivem
start hardcap
start rconlog
start scoreboard
start playernames

# This allows players to use scripthook based plugins such as lambda menu.
# Set this to 0 to disallow scripthook.
sv_scriptHookAllowed 1

# Uncomment this to enable RCON. Make sure to change the password.
#rcon_password changeme

# A comma-separated list of tags for your server.
# For example:
# - sets tags "drifting, cars, racing"
# Or:
# - sets tags "roleplay, military, tanks"
sets tags "default"

# Set an optional server info and connecting banner image url.
# Size doesn't matter, any banner sized image will be fine.
#sets banner_detail "http://url.to/image.png"
#sets banner_connecting "http://url.to/image.png"

# Set your server's hostname
sv_hostname "My new FXServer!"

# Nested configs!
#exec server_internal.cfg

# Loading a server icon (96x96 PNG file)
#load_server_icon myLogo.png

# convars which can be used in scripts
set temp_convar "hey world!"

# Uncomment this line if you do not want your server to be listed in the server browser.
#sv_master1 ""

# Want to only allow players authenticated with a third-party provider like Steam?
# Don't forget Social Club is a third party provider too!
#sv_authMaxVariance 1
#sv_authMinTrust 5

# Add system admins
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but don't allow quit
add_principal identifier.steam:110000112345678 group.admin # add the admin to the group

# Hide player endpoints in external log output.
sv_endpointprivacy true

# Server player slot limit (must be between 1 and 32)
sv_maxclients 32

# License key for your server (https://keymaster.fivem.net)
sv_licenseKey changeme
```

What's next?
------------

- [Using server commands][server-commands]
- [Start scripting][scripting-introduction]
<!--- [Create a resource][creating-resources]--> <!-- seems bit redundant, if we already have the link above? -->

[windows-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/
[linux-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
[server-data]: https://github.com/citizenfx/cfx-server-data

[vcredist]: https://go.microsoft.com/fwlink/?LinkId=746572
[winrar]: https://www.rarlab.com/download.htm
[7zip]: https://www.7-zip.org/download.html

[server-issues]: /support/server-issues
[server-commands]: /server-administration/server-commands
[scripting-introduction]: /guides/scripting-introduction/
[creating-resources]: /getting-started/creating-resources
