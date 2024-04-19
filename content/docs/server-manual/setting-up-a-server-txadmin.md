---
title: Setting up a server using txAdmin
weight: 312
description: >
  A step-by-step guide on setting up a txAdmin FXServer.
---

## Ultimate easy setup guide
![pic](/server-setup/header.png)<br>
### Windows
#### Download the server
1. Go to the [Windows server build listing][windows-artifacts] ('artifacts' listing, as in 'build artifacts').
2. Download the latest recommended build.<br>
   ![pic](/server-setup/windows-step-2.png)<br>
3. Open the `server.7z` you just downloaded. Use any third-party archiving tool (such as [7-Zip][7zip] or [WinRAR][winrar]) to open the `.7z` file. <br>
   ![pic](/server-setup/windows-step-3.png)<br>
4. Extract it somewhere you want to store it. We'll pick `C:\FXServer\server`.<br>
   ![pic](/server-setup/windows-step-4a.png)<br>
   ![pic](/server-setup/windows-step-4b.png)<br>
5. Open the folder you just extracted it to. It should look a little like this:<br>
   ![pic](/server-setup/windows-step-5.png)<br>

#### Start the server
1. Double click `FXServer.exe`.<br>
   ![pic](/server-setup/windows-step2-1.png)<br>
2. This site should open in your browser. Make sure a PIN is filled, and click `Link Account`.<br>
   ![pic](/server-setup/windows-step2-2.png)<br>
3. Log in to your account on [Cfx.re](https://forum.cfx.re/) in this tab and then click `Yes, Allow`.<br>
   ![pic](/server-setup/windows-step2-3.png)<br>
4. Set a password to log in to your server's admin page.<br>
   ![pic](/server-setup/windows-step2-4.png)<br>
5. Click 'Next'.<br>
   ![pic](/server-setup/windows-step2-5.png)<br>
6. Type a name for your server and click 'Next'.<br>
7. Select 'Popular Recipes'.<br>
   ![pic](/server-setup/windows-step2-7.png)<br>
8. Pick the 'CFX Default' template for now. Other templates may exist, but some will require a database server.<br>
   ![pic](/server-setup/windows-step2-8.png)<br>
9. Click 'Save' or select another path.
10. Go to the 'Recipe Deployer'.<br>
   ![pic](/server-setup/windows-step2-10.png)<br>
11. Click 'Next' once you're sure the recipe looks fine. It should be fine the way it comes.<br>
  ![pic](/server-setup/windows-step2-11.png)<br>
12. Enter the key you just made on the Keymaster in the 'Before you begin' step and click 'Run Recipe'.<br>
   ![pic](/server-setup/windows-step2-12.png)<br>
13. If everything's correct, you can click 'Next' again.<br>
   ![pic](/server-setup/windows-step2-13.png)<br>
14. ... and finally, "Save & Run Server", and you're done!<br>
   ![pic](/server-setup/windows-step2-14.png)<br>


[windows-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/
[server-data]: https://github.com/citizenfx/cfx-server-data

[vcredist]: https://aka.ms/vs/16/release/VC_redist.x64.exe

[winrar]: https://www.rarlab.com/download.htm
[7zip]: https://www.7-zip.org/download.html
