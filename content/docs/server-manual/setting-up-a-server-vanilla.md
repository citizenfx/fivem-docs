---
title: Setting up a Vanilla FXServer
weight: 313
description: >
  A step-by-step guide on setting up a Vanilla FXServer.
---


## Vanilla Server Installation steps

### Windows

#### Prerequisites
1. [Git][git-scm] if you want to follow the recommended way of _cloning_ the base server data.

#### Installation
1. Create a new directory (for example `C:\FXServer\server`), this will be used for the server binaries.
2. Download the current recommended `master` branch build for Windows from the [Windows server build listing][windows-artifacts].
3. Extract the build into the directory previously created.
    * 3b. Use any third-party archiving tool (such as [WinRAR][winrar] or [7-Zip][7zip]) to open the `.7z` file.
4. Clone [cfx-server-data][server-data] in a new folder outside of your server binaries folder, for example, `C:\FXServer\server-data`. 
    * 4b. `git clone https://github.com/citizenfx/cfx-server-data.git server-data` *(To type this command you need to open a command prompt, press `Win + R`, once the run dialog shows type `cmd` and hit enter, remember to switch directories to the directory you plan to clone to by typing `cd C:\FXServer`.)*
  
5. Make a **server.cfg** file in your `server-data` folder (copy the [example server.cfg](#servercfg) file below into that file).
6. Set the license key in your server.cfg using `sv_licenseKey "licenseKeyGoesHere"`.
7. Run the server from the `server-data` folder. For example, in a plain Windows command prompt (cmd.exe) window: 
    ```dos
    cd /d C:\FXServer\server-data
    C:\FXServer\server\FXServer.exe +exec server.cfg
    ```

    (the `/d` flag is only needed when changing directory to somewhere on a different drive)

---

### Linux
{{% alert theme="info" %}}Note that the Linux version of FXServer is only provided as a courtesy port due to issues regarding Linux distribution compatibility and availability of diagnostic tools for native C++ code.
If you're experiencing any issues, you're more likely to see them fixed if you use the Windows version.
{{% /alert %}}

#### Prerequisites
1. [Git][git-scm] if you want to follow the recommended way of _cloning_ the base server data.
2. `xz` or `xz-utils` package. 

#### Installation
1. Create a new folder (for example `mkdir -p ~/FXServer/server`), this will be used for the server binaries.
2. Download the current recommended `master` branch build for Linux from the [Linux server build listing][linux-artifacts] (copy the URL for the recommended server version and use `wget <url>` to download it).
3. Extract the build to the directory that was previously created, using `cd ~/FXServer/server && tar xf fx.tar.xz` (you need to have `xz` installed, on Debian/Ubuntu this is in the `xz-utils` package).
4. Clone [cfx-server-data][server-data] in a new folder outside of your server binaries folder.<br>
   For example: `git clone https://github.com/citizenfx/cfx-server-data.git ~/FXServer/server-data`
5. Make a **server.cfg** file in your `server-data` folder (copy the [example server.cfg](#servercfg) file below into that file).
6. Set the license key in your `server.cfg` using `sv_licenseKey "licenseKeyGoesHere"`.
7. Run the server from the `server-data` folder.<br>
   `cd ~/FXServer/server-data && bash ~/FXServer/server/run.sh +exec server.cfg`

---

<a name="servercfgexample"></a>

## server.cfg

An example server.cfg follows.

{{%  code file="/static/examples/config/server.cfg" language="sh"  %}}

---

### Common issues

- If you don't get any 'resources found', and it says 'Failed to start resource', you didn't 'cd' to the right folder.
- If no resources get started, and you also can't connect (i.e. 'timed out'/'connection refused'), you didn't add +exec.
- If you get 'no license key was specified', one of the above two mistakes may apply.
- If you're facing slow server startups on Windows, refer to [this][slow-server-startups].

[windows-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/
[linux-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
[server-data]: https://github.com/citizenfx/cfx-server-data

[vcredist]: https://aka.ms/vs/16/release/VC_redist.x64.exe
[winrar]: https://www.rarlab.com/download.htm
[7zip]: https://www.7-zip.org/download.html
[git-scm]: https://git-scm.com/download/win
[slow-server-startups]: /docs/support/server-issues/#troubleshooting-slow-server-startups-on-windows

