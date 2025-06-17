---
title: Client issues
weight: 830
---

Getting game crashes? Can't launch FiveM? Or maybe running into some more
obscure issue? Find the most common issues here.

I crash when playing on a server
--------------------------------
Crashes are fairly often related to a server-specific issue. To make sure your crash isn't related to a specific
server, it is advised to join the [FiveM.net testing server][testing-server]. If that server works without your issue, we recommend that you contact the owners of the server where you're experiencing crashes. Otherwise, read on.

I've been banned on a server
----------------------------
FiveM is not responsible for what you do on servers, or what server admins do to you. If you believe you've been
falsely banned from a server, contact the server owners. FiveM cannot and will not provide support for this matter.

I've been globally banned from FiveM
------------------------------------
Please refer to the following support [article][support-ban-faq].

Could not find game executable
------------------------------
Please refer to the following support [article][support-could-not-find-game-exe].

FiveM is already installed
--------------------------
<!-- https://media.discordapp.net/attachments/455024366091108352/479267390836834306/unknown.png -->
After installing FiveM, you don't need to use the same FiveM.exe file anymore. Use the shortcut from your Windows
start menu. Press the Start button on your taskbar and look for FiveM there.

If you uninstalled FiveM by deleting the shortcut, you might have to [uninstall][uninstalling] FiveM properly.

Game storage outdated
-------------------
Please refer to the following support [article][support-game-storage-outdated].

Error generating ROS entitlement token
--------------------------------------
<!-- https://i.imgur.com/IAobS5M.png -->
Certain antivirus vendors are known to block FiveM for unknown reasons. Please submit a [support ticket][antivirus-ticket] if this occurs.

Error loading component xyz.dll
-------------------------------
Delete caches.xml from your [FiveM application data][where-is-fivem-installed] folder.
If there is no such file, delete the entire application data folder and run FiveM again. For `adhesive.dll` also see below.

Error loading component adhesive.dll
-------------------------------
Your Windows 10 installation is outdated. Please update it to at least version 1703. To check your current version, open command prompt and type `winver`.

Opening database (privcache:/) failed: IO error: could not lock file
------------------------------
Please refer to the following support [article][support-privcache-failed].

Entry Point Not Found
------------------------------
Delete `v8.dll`, `v8_libbase.dll`, `v8_libplatform.dll` if available in your `C:\Windows\system32` directory. These are (leftover) files from other applications that incorrectly use `system32` to place these files. FiveM loads DLLs from `system32` first, resulting in these incorrect DLLs being loaded.

Moving of xyz.exe failed (err = 32)
------------------------------
First, check your Task Manager for existing FiveM related processes; if you see them, close them. If that doesn't fix the issue, you may want to submit a [support ticket][antivirus-ticket] regarding your antivirus.

Stuck on 'Starting FiveM, we're getting there'
------------------------------------------------------------
<!-- https://prnt.sc/kj02oo -->
If this occurs, it is often caused by aggressive antivirus settings. You may want to submit a [support ticket][antivirus-ticket] regarding your antivirus.

Stuck on a rotating splash screen
---------------------------------
Delete `%appdata%\citizenfx\ros_id.dat` and `%localappdata%\digitalentitlements`.

Stuck on a colored background but no menu
------------------------------
This happens on specific older AMD laptop GPUs. Unfortunately, this is caused by CEF and not by FiveM. Once the issue has been fixed in CEF, FiveM will be updated too. A forum moderator has created a topic that could potentially rectify this issue. [Click here][discrete-gpu] for more info.

FiveM uninstalls itself after running it!
-----------------------------------------
Please refer to the following support [article][support-fivem-uninstalls-itself].

My game is dropping frames and I have decent hardware
----------------------------
If you believe your game is dropping frames for whatever reason, you may want to take what's called
a 'trace'. A trace can be used to capture game function calls and allows developers to see where an application is taking longer than expected to execute, causing performance drops.

Please refer to the following support [article][support-create-etw-trace] to create a trace.

I have an NVIDIA GPU and FiveM hanged
-----------------------------------------
Recently, FiveM hangs on NVIDIA GPUs have become more common, especially with the latest drivers. Efforts have been made to contact NVIDIA, but no clear response has been given. As of now, we're trying to figure out a way to resolve hangs for this specific GPU vendor, but we need your help on this, and here's how you can help us:

Once the NVIDIA 'crash' dialog is shown, follow these steps:
1. Hold `WinKey + R` and type `taskmgr` followed by enter, it's important that you don't close the process while following this guide.
2. Once `Task Manager` opens, go into the `Details` tab.
3. Find `FiveM_GTAProcess.exe`, right click it and click on `Create dump file`.
4. Wait until the process is dumped, it will be created in the following directory: `C:\Users\xxxx\AppData\Local\Temp\FiveM_GTAProcess.DMP`
5. Click `Open File Location` and zip up the following file: `FiveM_GTAProcess.DMP`, you can zip up a file by right clicking it, followed by clicking `Send to > Compressed (zipped) folder` on the context menu.
6. Contact [CFX Support][email] or one of the elements on our [Discord][discord] once you have the process dump ready to send.

Additionally, you may still enjoy FiveM by rolling back to older drivers such as 471, but we encourage you to send these reports, prior to doing this!

Help! I can't find my issue here!
---------------------------------
We're here to help! First, check the Cfx.re support [section][support-game-articles] for your issue. If you're experiencing crashes or freezes, please post your details on our [forums][forum-tech-support] to help us assist you better.
For all other inquiries, feel free to join our [Discord][discord] for a chat!

[where-is-fivem-installed]: https://support.cfx.re/hc/en-us/articles/8016397932444-Client-FAQ#where-is-fivem-installed
[antivirus-ticket]: https://support.cfx.re/hc/en-us/requests/new
[email]: mailto:support@fivem.net
[forum]: https://forum.cfx.re
[forum-tech-support]: https://forum.cfx.re/c/technical-support
[discord]: https://discord.gg/fivem
[testing-server]: https://cfx.re/join/y4lg95
[uninstalling]: https://support.cfx.re/hc/en-us/articles/360020967780-Uninstalling-FiveM
[discrete-gpu]: https://forum.cfx.re/t/217731
[support-create-etw-trace]: https://support.cfx.re/hc/en-us/articles/8366604193436-Creating-an-ETW-trace
[support-ban-faq]: https://support.cfx.re/hc/en-us/articles/8444465475356-Bans-FAQ
[support-game-articles]: https://support.cfx.re/hc/en-us/sections/8856819954332-Games
[support-fivem-uninstalls-itself]: https://support.cfx.re/hc/en-us/articles/8039696924700-FiveM-error-FiveM-uninstalls-itself-after-running-it
[support-privcache-failed]: https://support.cfx.re/hc/en-us/articles/8039663675036-FiveM-error-Opening-database-privcache-failed-IO-error-could-not-lock-file
[support-game-storage-outdated]: https://support.cfx.re/hc/en-us/articles/8016876906140-FiveM-error-Game-storage-outdated
[support-could-not-find-game-exe]: https://support.cfx.re/hc/en-us/articles/8016804120604-FiveM-error-Could-not-find-game-executable
