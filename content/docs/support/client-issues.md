---
title: Client issues
weight: 830
---

Getting game crashes? Can't launch FiveM? Or maybe running into some more
obscure issue? Find the most common issues here.

I crash when playing on a server
--------------------------------
Crashes are fairly often related to a server-specific issue. To make sure your crash isn't related to a specific
server, it is advised to join the [FiveM.net testing server][testing-server]. If that server works without your issue, we
recommend you to contact the server owners of the server where you're experiencing crashes on. Otherwise, read on.

I've been banned on a server
----------------------------
FiveM is not responsible for what you do on servers, or what server admins do to you. If you believe you've been
falsely banned from a server, contact the server owners. FiveM can not and will not provide support for this matter.

I've been globally banned from FiveM
------------------------------------
Please see [the following article](/docs/support/ban-faq).

Could not find game executable
------------------------------
<!-- https://media.discordapp.net/attachments/455024366091108352/479263072276578324/unknown.png -->
<!--<img src="/static/could-not-find-game-exec-error.png">-->
Locate the `CitizenFX.ini` file within your [FiveM Application Data][where-is-fivem-installed] and make sure it is
pointing to the correct path. Open the file with a text editor like Notepad and edit the path to your GTA V installation
if necessary.

FiveM is already installed
--------------------------
<!-- https://media.discordapp.net/attachments/455024366091108352/479267390836834306/unknown.png -->
After you installed FiveM, you don't need to use the same FiveM.exe file anymore. Use the shortcut from your Windows
start menu. Press the Start button on your taskbar and look for FiveM there.

If you uninstalled FiveM by deleting the shortcut, you might have to [uninstall][uninstalling] FiveM properly.

Game cache outdated
-------------------
<!-- https://media.discordapp.net/attachments/455024366091108352/479268603510652946/unknown.png -->
<!-- https://vgy.me/JJJzfI.png -->
Press `Yes` if the dialog asks `Do you wish to continue?`. If you get an error like `DLC files are missing`, make sure
your game is up to date by following the instructions in the dialog. Also, make sure your `CitizenFX.ini` points to
the correct GTA V installation. You can find that file within your [FiveM application data][where-is-fivem-installed].

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
Your privcache got corrupted. Please remove the "priv" folder from the cache folder located in your [FiveM application data][where-is-fivem-installed].

Entry Point Not Found
------------------------------
Delete `v8.dll`, `v8_libbase.dll`, `v8_libplatform.dll` if available in your `C:\Windows\system32` directory. These are (leftover) files from other applications that incorrectly use `system32` to place these files. FiveM loads dll's from `system32` first, resulting in these incorrect dll's being loaded.

Moving of xyz.exe failed (err = 32)
------------------------------
First check your task manager for existing FiveM related processes; if you see them, close them. If that doesn't fix the issue, you may want to submit a [support ticket][antivirus-ticket] regarding your antivirus.

Stuck on 'We're getting there and it will be worth the wait'
------------------------------------------------------------
<!-- https://prnt.sc/kj02oo -->
If this occurs, it is often caused by aggressive antivirus settings. You may want to submit a [support ticket][antivirus-ticket] regarding your antivirus.

Stuck on a rotating splash screen
---------------------------------
Delete `%appdata%\citizenfx\ros_id.dat` and `%localappdata%\digitalentitlements`.

Stuck on a black screen
-----------------------
This is a common issue with certain NVIDIA drivers. Stay patient, it takes a minute to load. This often
happens to other games too.

Early Exit Trap crash
-----------------------
Looks like you might have something messing in the background. Please make sure to remove everything running on background when lauching FiveM. It could be antivirus or any software recording app.

Can't link FiveM to Discord
-----------------------
To be able to connect Discord to FiveM, you need to do the following:
- Close FiveM and Discord completely
- Open Discord Desktop App
- Start FiveM and load main menu

Please avoid using any plugins / client modification when following the steps.

HTTP 412 System Clock
-----------------------
Looks like you are not sync on time. Follow those simple steps:
- Close FiveM and open Windows settings
- Go to Date & Time
- Sync Clock
- Start FiveM and load main menu

**Note:** words might change depending on what Windows version you are running (10/11).

Stuck on a colored background but no menu
------------------------------
This happens on specific older AMD laptop GPUs. Unfortunately, this is caused by CEF and not by FiveM. Once the issue has been fixed in CEF, FiveM will be updated too. A forum moderator has created a topic that could potentially rectify this issue. [Click here][discrete-gpu] for more info.

FiveM uninstalls itself after running it!
-----------------------------------------
This is most likely your antivirus software removing FiveM. Unfortunately some antivirus vendors falsely flag FiveM,
and remove some (or even all) FiveM files as a precaution. You can safely ignore any warnings about this.  
If this becomes an issue, you may want to submit a support ticket regarding your antivirus [here][antivirus-ticket].

My game is dropping frames and I have decent hardware
----------------------------
If you believe your game is dropping frames for whatever reason, you may want to take what's called
a 'trace'. A trace can be used to capture game function calls and allows developers to see where an application is taking longer than expected to execute, causing performance drops.

ETW can be downloaded from here:
https://github.com/google/UIforETW/releases

Download the `etwpackage` zip file from the `Assets` section and extract it, optionally, you can click [here](https://github.com/google/UIforETW/releases/download/v1.56/etwpackage1.56.zip) to download it. Make sure you are downloading the zip file that contains the binaries and not the source code.

After extracting the zip file:
- Navigate to the etwpackage folder
- Navigate to the bin folder
- Execute `UIforETW.exe` by double clicking it.

You will see a couple options there (to the right, in the checkbox section), leave them as is and follow the next steps: 
- Wait for the game/application to drop frames. 
- Once your game begins to drop frames click on ‘Start Tracing’. 
- Let it run for a minute.
- Click on `Save Trace Buffers` after that. Remember to upload the trace afterwards.

Traces will most likely end up saved under `C:\Users\xxxx\Documents\etwtraces`. In UI For ETW's window there's a list of saved traces, you can click on. Click on the trace with the most recent date and proceed by clicking on 'Browse Folder' afterwards.

You can use services such as Google drive to upload your trace.

I have an NVIDIA GPU and FiveM hanged
-----------------------------------------
FiveM hangs when using NVIDIA GPUs as of recently are not uncommon (especially on most recent drivers), efforts were made, trying to contact NVIDIA, but no clear response was given. As of now, we're trying to figure out a way to resolve hangs for this specific GPU vendor, but we need your help on this, and here's how you can help us:

Once the NVIDIA 'crash' dialog is shown, follow these steps:
1. Hold `WinKey + R` and type `taskmgr` followed by enter, it's important that you don't close the process while following this guide.
2. Once `Task Manager` opens, go into the `Details` tab.
3. Find `FiveM_GTAProcess.exe`, right click it and click on `Create dump file`.
4. Wait until the process is dumped, it will be created in the following directory: `C:\Users\xxxx\AppData\Local\Temp\FiveM_GTAProcess.DMP`
5. Click `Open File Location` and zip up the following file: `FiveM_GTAProcess.DMP`, you can zip up a file by right clicking it, followed by clicking `Send To -> Compressed (zipped) folder` on the context menu.
6. Contact [CFX Support][email] or one of the elements on our [Discord][discord] once you have the process dump ready to send.

Additionally, you may still enjoy FiveM by rolling back to older drivers such as 471, but we encourage you to send these reports, prior to doing this!

Help! I can't find my issue here!
---------------------------------
We are more than happy to help you out! If you're running into crashes or freezes, please post your issue
on our [forums][forum]. Provide as much detail as you can, that will make it easier for everyone to help you.
For all other issues, you are more than welcome to join our [Discord][discord] and have a chat with us.

[where-is-fivem-installed]: /docs/support/client-faq#where-is-fivem-installed
[antivirus-ticket]: https://support.cfx.re/hc/en-us/requests/new
[email]: mailto:support@fivem.net
[forum]: https://forum.cfx.re
[discord]: https://discord.gg/fivem
[testing-server]: https://cfx.re/join/jm85gm
[uninstalling]: /docs/client-manual/installing-fivem#uninstalling
[discrete-gpu]: https://forum.cfx.re/t/217731
