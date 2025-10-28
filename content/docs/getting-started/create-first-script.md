---
title: Create first script
weight: 1004
image: /getting-started/step4.jpg
description: >
  Create your first script in FiveM.
---

## Creation of a helloWorld script

{{% video url="https://runtime.fivem.net/edu/step-4_helloworld.mp4" %}}

### Creating a script with Visual Studio Code

#### 1. Navigate to your server files

1. Open File Explorer on your Desktop and navigate to the txData folder.
2. Double-click the folder named **FiveMBasicServerCFXDefault_AB1234.base** or something similar.
3. Double-click the **resources** folder located in the folder you opened.

#### 2. Create script folder and files

1. Create a new folder in **resources** named **helloWorld**.
2. Open helloWorld and create two new text files:
   - **client.lua**
   - **fxmanifest.lua**

{{% alert color="info" %}}
If prompted about file extensions, click Yes to confirm.
{{% /alert %}}

#### 3. Write the manifest file

1. Open **fxmanifest.lua** in Visual Studio Code and paste the following code in the file:

```lua
fx_version 'cerulean'
game 'gta5'
author 'YourName'
description 'My first hello world script'
version '1.0.0'
client_script 'client.lua'
```

2. Save the file.

#### 4. Write the client script

1. Open **client.lua** in Visual Studio Code.
2. Paste this code:

```lua
print("helloWorld")
```

3. Save the file.

#### 5. Run the script in FiveM

1. In FiveM, press **F8** to open the console.
2. Type **tx** and press **Tab** twice to open the txAdmin sub menu.
3. Go to **Resources** > **Reload & Refresh**.
4. Use the search bar to look for **helloWorld**.
5. Click **Start** next to the helloWorld script.

#### 6. Verify the script is working

Press **F8**. helloWorld prints in the console.

You've successfully set up your server and run your first Lua script in FiveM. While simple, this script is the first step toward building more advanced resources for your server.

## Next Steps

### Guides

#### Exploring the FiveM native reference

A crucial part of the documentation around FiveM is the [native reference](https://docs.fivem.net/natives/) which allows you to interact with game events.
Let's explore some of the simple to use natives first and incorporate them into your first script.

##### Disabling the minimap

While the minimap helpful it is not wanted in some cases so let's disable it:
{{% video url="https://runtime.fivem.net/edu/step-5_displayradar.mp4" %}}

1. Open the [native reference](https://docs.fivem.net/natives/) and try finding the [**DisplayRadar**](https://docs.fivem.net/natives/?_0xA0EBB943C300E693) native.
2. Go to the helloWorld folder and double-click on client.lua and remove everything inside.
3. Type the following text:

```lua
DisplayRadar(false)
```

4. Hit Ctrl + S or go to File > Save to save your file.
5. Start up the game and restart the helloWorld script via the txAdmin Resource tab.
The minimap is hidden.
On the [native reference](https://docs.fivem.net/natives/) you can find more interesting game functions which can be combined to create unique experiences and gameplay twists.

##### Spawning a vehicle guide

1. Open the [native reference](https://docs.fivem.net/natives/) and try finding the [**CreateVehicle**](https://docs.fivem.net/natives/?_0xAF35D0D2583051B0) native.
2. Navigate to helloWorld and open **client.lua** and remove everything inside.
3. Copy the example from the native reference to your **client.lua**.
4. **Hit Ctrl + S** or go to **File > Save** to save your file.
5. Start up the game and restart the helloWorld script via the txAdmin Resource tab.
A car is spawned. For example, an Adder vehicle is spawned.

Feel free to play around with other vehicles which you can find in the [vehicle reference](https://docs.fivem.net/docs/game-references/vehicle-references/vehicle-models/).

{{% alert color="info" %}}
To use a different vehicle in the script you just created just replace **adder** with a vehicle name that you like.
{{% /alert %}}

Where to learn more?
The official [forum](https://forum.cfx.re/) and the official [Discord server](https://discord.gg/fivem) are great places to look at other people's releases, learn from them, or ask members of the community for help.
Within the forum, go to the [Resource Development & Modding category](https://forum.cfx.re/c/development/30) for learning about resource creation.
For questions regarding server setup or general troubleshooting, go to [Server Development category](https://forum.cfx.re/c/server-development/35).
Want to see what other people made?
While there is a dedicated #showcase channel in our [Discord server](https://discord.gg/fivem) check out the [FiveM Releases](https://forum.cfx.re/c/releases/7) in our forum which can be a great inspiration for your own projects.

{{% article-nav %}}
