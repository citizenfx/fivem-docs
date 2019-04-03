---
title:  Could not find executable (GTA5.exe) at configured path.
---

Cause
-------

Caused by an invalid config.

![Error Image](/could-not-find-executable.png)

Resolution
-------

Press: Windows Key + R then type `%localappdata%\FiveM\FiveM.app` and press Enter
![Run Box](/fivem.app.png)

Locate the `CitizenFX.ini` file.
![CitizenFX.ini file](/citizenfx.ini)

Right Click the file and click `Edit with Notepad++` (if you have it installed) or `Open With -> Notepad`
![Open](/citizenfx.ini.open-with.png)

Change the path to the GTA:V install folder

![File](/citizenfx.ini.path.png)

Save and restart FiveM.
