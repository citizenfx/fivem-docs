---
title: Client issues
weight: 830
---

Getting game crashes? Can't launch FiveM? Or maybe running into some more
obscure issue? Find the most common issues here.

I crash when playing on a server
--------------------------------
More often than not are crashes related to a server specific issue. To make sure your crash isn't related to a specific
server, it is advised to join the [vanilla FiveM server][vanilla-server]. If that server works without issue, we
recommend you to contact the server owners of the server where you're experiencing crashes on. Otherwise read on.

I've been banned on a server
----------------------------
FiveM is not responsible for what you do on servers, or what server admins do to you. If you believe you've been
falsely banned from a server, contact the server owners. FiveM cannot, and will not provide support for this matter.

I've been globally banned from FiveM
------------------------------------
That's unfortunate, don't cheat.
If you believe you've been falsely banned, please reach out to us on [pr@fivem.net][email]. <br />
**Please note that FiveM forum moderators or staff in the FiveM discord, can _not_ assist you with this ban.**

Could not find game executable
------------------------------
<!-- https://media.discordapp.net/attachments/455024366091108352/479263072276578324/unknown.png -->
<!--<img src="/static/could-not-find-game-exec-error.png">-->
Locate the `CitizenFX.ini` file within your [FiveM application data][where-is-fivem-installed] and make sure it is
pointing to the correct path. Open the file with a text editor like Notepad and edit the path to your GTA V installation
if necessary.

FiveM is already installed
--------------------------
<!-- https://media.discordapp.net/attachments/455024366091108352/479267390836834306/unknown.png -->
After you installed FiveM, you don't need to use the same FiveM.exe file anymore. Use the shortcut from your Windows
start menu. Press the start button on your task bar and look for FiveM there.

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
Certain antivirus vendors are known to block FiveM for unknown reasons.
[Disable your antivirus][disabling-antivirus] and try again.

Error loading component xyz.dll
-------------------------------
Delete caches.xml from your [FiveM application data][where-is-fivem-installed] folder.
If there is no such file, delete the entire application data folder and run FiveM again.

Stuck on 'We're getting there and it will be worth the wait'
------------------------------------------------------------
<!-- https://prnt.sc/kj02oo -->
Often caused by aggressive antivirus settings. [Disable your antivirus][disabling-antivirus] and try again.

Stuck on a rotating splash screen
---------------------------------
Delete `%appdata%\citizenfx\ros_id.dat` and `%localappdata%\digitalentitlements`.

Stuck on a black screen
-----------------------
This is a common issue with Nvidia drivers. Stay patient, it takes a minute to load. This happens to other games too.

Stuck on a colored background but no menu
------------------------------
This happens on specific older AMD laptop GPUs. Unfortunately, this is caused by CEF and not by FiveM. Once the issue
has been fixed in CEF, FiveM will be updated too.

FiveM uninstalls itself after running it!
-----------------------------------------
This is most likely your antivirus software removing FiveM. Unfortunately some antivirus vendors falsely flag FiveM,
and remove some (or even all) FiveM files as a precaution. You can safely ignore any warnings about this.<br />
[Click here][disabling-antivirus] for more info on how to disable your antivirus.

Help! I can't find my issue here!
---------------------------------
We are more than happy to help you out! If you're running into crashes or freezes, please post your issue
on our [forums][forum]. Provide as much detail as you can, that will make it easier for everyone to help you.
For all other issues, you are more than welcome to join our [Discord][discord] and have a chat with us.

[where-is-fivem-installed]: /support/client-faq#where-is-fivem-installed
[disabling-antivirus]: /client-manual/disabling-antivirus
[email]: mailto:pr@fivem.net
[forum]: https://forum.fivem.net/
[discord]: https://discord.gg/GtvkUsc
[vanilla-server]: https://servers.fivem.net/#/servers/detail/198.27.79.239:45454
