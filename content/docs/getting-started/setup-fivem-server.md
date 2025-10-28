---
title: Setting up a FiveM Server
weight: 1003
image: /getting-started/step3.jpg
description: >
  Setup FiveM Server.
---

{{% alert color="info" %}}
If you already have a FiveM up & running you can skip this step.
{{% /alert %}}

{{% video src="https://runtime.fivem.net/edu/step-2_setup-fivem-server.mp4" %}}

### 1. Download and open server artifacts

{{% alert color="info" %}}
Server artifacts contain the software needed to run a FiveM server.
{{% /alert %}}

1. Go to [**FiveM Server Artifacts**](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
2. Click **Latest recommended** to download the latest server build.
The download progresses and completes.
3. Open the **server.7z** archive using [7-Zip](https://www.7-zip.org/download.html) or a similar tool.

### 2. Create folder and extract contents

1. Create a new folder on your desktop. Name it **FiveM Server** or something recognizable.
2. Extract all contents of **server.7z** into the new folder.

### 3. Run FXServer and access txAdmin

1. Go to the extracted folder and run **FXServer.exe**.
Your browser opens **txAdmin** automatically.

{{% alert color="info" %}}
If you are not automatically redirected, go to: http://localhost:40120/
{{% /alert %}}

2. Enter the 4-digit PIN from the console.

### 4. Link your account and register server

1. Click **Link account**.
2. Sign in and click **Continue** to authorize txAdmin to access to your Cfx.re account.
3. Set up a backup password.

{{% alert color="info" %}}
As an option, you can include your Discord ID.
{{% /alert %}}

4. Review the **Creator Platform License Agreement** and the **txAdmin License**.
5. If you agree, click the checkbox below the password.
6. Click **Register**.

The initial server configuration page is displayed.

### 5. Initialize the server settings

1. Enter a **Server Name**, then click **Next**.
2. For **Deployment Type**, choose **Popular Recipes**.
3. For **Select Template**, choose **FiveM Basic Server (CFX Default)**.
4. Leave **Data Location** as-is and click **Save**.
5. Click **Go to Recipe Deployer**.

### 6. Generate and enter server registration key

1. In **Step 1: Review Recipe**, click **Next**.
2. In **Step 2: Input Parameters**, click [Portal](https://portal.cfx.re/login?return=%252Fservers%252Fregistration-keys%253Fmodal%253Dcreate) link to open a new tab.
3. Sign in with Cfx.re.
4. Click **Create a key** > enter a display name > click **GENERATE**.
5. Go to your new key and click **copy**.
6. Return to txAdmin, paste the key in the textbox, and click **Run Recipe**.

### 7. Finish recipe deployment

Wait for the setup process to complete.
A folder containing your server resources opens. You can close it for now.

### 8. Configure and run the server

{{% alert color="info" %}}
Your server configuration file appears. No changes are needed.
{{% /alert %}}

Click **Save and Run Server** to launch your new FiveM server.
You made it! Your own local FiveM server is now up and running, waiting for you to customize it to your liking!

## Connect to local server

{{% video src="https://runtime.fivem.net/edu/step-3_connect-to-fivem-server.mp4" %}}

### 1. Launch the FiveM client and connect to your server

1. Open the **FiveM client**. Relaunch it if it was previously closed.
2. Click **Connect to ComputerName on LAN**.

{{% alert color="info" %}}
If you don't see the button, restart the FiveM client.
{{% /alert %}}

### 2. Verify txAdmin is working

1. Once connected, press **F8** to open the in-game console.
2. Type **tx** and press **Enter**.

The **txAdmin** in-game menu is displayed.

{{% alert color="info" %}}
You can close the txAdmin in-game menu with **Backspace** or **Esc**.
{{% /alert %}}

You are now connected to your local server! Feel free to explore **txAdmin features** like:

- God mode
- Spawning vehicles
- Noclip

{{% article-nav %}}
