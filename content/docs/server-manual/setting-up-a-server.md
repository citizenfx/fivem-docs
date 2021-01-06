---
title: Setting up a server
weight: 310
description: >
  A step-by-step guide on setting up FXServer.
---

FXServer is the name of the Cfx.re platform server. This page shows you how to run it.

Having trouble running your server? Visit [server issues][server-issues], use the Discord [#fxserver-support][fxserver-support] channel or create a topic in the [Server Discussion][fxserver-support-category] sub-category on the forum.

## Before you begin
Make sure you have registered a license key on the [Cfx.re Keymaster](https://keymaster.fivem.net/) service. You need to have the IP match the IP on which you're going to *first* use the key. Afterwards, the key can be used on any IP, but only on one server at a time.

## Traditional installation steps

### Windows

#### Prerequisites
1. [Visual C++ Redistributable 2019][vcredist] or newer.
2. [Git][git-scm] to assure a correct installation.

#### Installation
1. Create a new directory (for example `D:\FXServer\server`), this will be used for the server binaries.
2. Download the current recommended `master` branch build for Windows from the [artifacts server][windows-artifacts].
3. Extract the build into the directory previously created.
  <br>3b. Use any archiving tool (such as WinRAR or 7-Zip).
4. Clone [cfx-server-data][server-data] in a new folder outside of your server binaries folder, for example, `D:\FXServer\server-data`.
  <br>4b. `git clone https://github.com/citizenfx/cfx-server-data.git server-data`
5. Make a **server.cfg** file in your `server-data` folder (copy the [example server.cfg](#servercfgexample) file below into that file).
6. Set the license key in your server.cfg using `sv_licenseKey "licenseKeyGoesHere"`.
7. Run the server from the `server-data` folder. For example, in a plain Windows command prompt (cmd.exe) window: 
    ```dos
    cd /d D:\FXServer\server-data
    D:\FXServer\server\FXServer.exe +exec server.cfg
    ```

    (the `/d` flag is only needed when changing directory to somewhere on a different drive)

---

### Linux
{{% alert theme="info" %}}Note that the Linux version of FXServer is only provided as a courtesy port due to issues regarding Linux distribution compatibility and availability of diagnostic tools for native C++ code.
If you're experiencing any issues, you're more likely to see them fixed if you use the Windows version.
{{% /alert %}}

1. Create a new folder (for example `mkdir -p /home/username/FXServer/server`), this will be used for the server binaries.
2. Download the current recommended `master` branch build for Linux from the [artifacts server][linux-artifacts](copy the URL for the latest server version and use `wget <url>` to download it).
3. Extract the build to the directory that was previously created, using `cd /home/username/FXServer/server && tar xf fx.tar.xz` (you need to have `xz` installed, on Debian/Ubuntu this is in the `xz-utils` package).
4. Clone [cfx-server-data][server-data] in a new folder outside of your server binaries folder.
  <br>4b. For example `git clone https://github.com/citizenfx/cfx-server-data.git /home/username/FXServer/server-data`
5. Make a **server.cfg** file in your `server-data` folder (copy the [example server.cfg](#servercfgexample) file below into that file).
6. Set the license key in your `server.cfg` using `sv_licenseKey "licenseKeyGoesHere"`.
7. Run the server from the `server-data` folder.
  <br>7b. `bash /home/username/FXServer/server/run.sh +exec server.cfg`

### Common issues

- If you don't get any 'resources found', and it says 'Failed to start resource', you didn't 'cd' to the right folder.
- If no resources get started, and you can't connect, you didn't add +exec.
- If you get 'no license key was specified', one of the above things applies.

<a name="servercfgexample"></a>

## server.cfg

An example server.cfg follows.

{{%  code file="/static/examples/config/server.cfg" language="sh"  %}}

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

[server-issues]: /docs/support/server-issues
[server-commands]: /docs/server-manual/server-commands
[scripting-introduction]: /docs/scripting-manual/introduction

[fxserver-support]: https://discord.gg/UwvVgsJ
[fxserver-support-category]: https://forum.cfx.re/c/server-development/server-discussion
