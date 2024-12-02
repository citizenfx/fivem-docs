---
title: Setting up a server using txAdmin
weight: 312
description: >
  A step-by-step guide on setting up a txAdmin FXServer.
---

## Ultimate easy setup guide
![pic](/server-setup/header.png)
### Windows
#### Download the server
1. Go to the [Windows server build listing][windows-artifacts] ('artifacts' listing, as in 'build artifacts').
2. Download the latest recommended build.<br>
   ![pic](/server-setup/windows-step-2.png)
3. Open the `server.7z` you just downloaded. Use any third-party archiving tool (such as [7-Zip][7zip] or [WinRAR][winrar]) to open the `.7z` file. <br>
   ![pic](/server-setup/windows-step-3.png)
4. Extract it somewhere you want to store it. We'll pick `C:\FXServer\server`.<br>
   ![pic](/server-setup/windows-step-4a.png)<br>
   ![pic](/server-setup/windows-step-4b.png)
5. Open the folder you just extracted it to. It should look a little like this:<br>
   ![pic](/server-setup/windows-step-5.png)

#### Start the server
1. Double click `FXServer.exe`.<br>
   ![pic](/server-setup/windows-step2-1.png)
2. This site should open in your browser. Make sure a PIN is filled, and click `Link Account`.<br>
   ![pic](/server-setup/windows-step2-2.png)
3. Log in to your account on [Cfx.re](https://forum.cfx.re/) in this tab and then click `Yes, Allow`.<br>
   ![pic](/server-setup/windows-step2-3.png)
4. Create a password to sign up to your server's admin page.<br>
   ![pic](/server-setup/windows-step2-4.png)
5. Click 'Next'.<br>
   ![pic](/server-setup/windows-step2-5.png)
6. Type a name for your server and click 'Next'.
7. Select 'Popular Recipes'.<br>
   ![pic](/server-setup/windows-step2-7.png)
8. Pick the 'CFX Default FiveM' template for now. Other templates may exist, but some will require a database server.<br>
   ![pic](/server-setup/windows-step2-8.png)
9. Click 'Save' or select another path.
10. Go to the 'Recipe Deployer'.<br>
   ![pic](/server-setup/windows-step2-10.png)
11. Click 'Next' once you're sure the recipe looks fine. It should be fine the way it comes.<br>
  ![pic](/server-setup/windows-step2-11.png)
12. Enter the key you just made on the Portal in the 'Before you begin' step and click 'Run Recipe'.<br>
   ![pic](/server-setup/windows-step2-12.png)
13. If everything's correct, you can click 'Next' again.<br>
   ![pic](/server-setup/windows-step2-13.png)
14. ... and finally, "Save & Run Server", and you're done!<br>
   ![pic](/server-setup/windows-step2-14.png)

#### Troubleshooting
If you're facing slow server startups, refer to [this][slow-server-startups].

[windows-artifacts]: https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/
[server-data]: https://github.com/citizenfx/cfx-server-data

[vcredist]: https://aka.ms/vs/16/release/VC_redist.x64.exe

[winrar]: https://www.rarlab.com/download.htm
[7zip]: https://www.7-zip.org/download.html
[slow-server-startups]: /docs/support/server-issues/#troubleshooting-slow-server-startups-on-windows