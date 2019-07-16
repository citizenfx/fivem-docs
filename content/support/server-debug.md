---
title: Server Debugging
weight: 840
---

This section will explain how to create useful debugging dumps (called .dmp files) in order to assist with troubleshooting.

**NOTE**: This page is for Windows servers only. Linux does not have the same debugging tools.

If you encounter a crash, set up your environment to capture the next time it happens.

# Creating Full Dumps

1) Download and extract: https://download.sysinternals.com/files/Procdump.zip

2) Start your server.

3) Open a command prompt where you extracted procdump to. **Use an ELEVATED command prompt** for this (should say "Administrator" in the title bar).

4) Type in the following command: `procdump64.exe -accepteula -i`

    This registers procdump as a debugger to capture certain crashes.

5) Open task manager, click "Details". Locate FXServer.exe. There should be a "PID" column. Note down the number.

6) Go back to your command prompt and type in: `procdump64.exe -accepteula -e 1 -h -ma pidhere`

where `pidhere` is the number you found from step 4. If you get an error, reopen command prompt as administrator and try again.

7) Wait for server to crash. When it does, it will write a large .dmp file to the procdump folder. Zip up this file and upload to google drive/dropbox and supply to #server-bugs or where it was requested.

8) Run the following in your command prompt to unregister the debugger when you are done: `procdump64.exe -accepteula -u`