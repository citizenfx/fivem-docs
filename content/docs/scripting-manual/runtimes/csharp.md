---
title: Scripting in C#
weight: 423
languages: ['cs']
---

_This page is still a <b>work in progress</b> so this guide is not completed yet!_

# Setting up our environment
Before you can create your first C# resource, you'll need to install [Visual Studio 2017](https://visualstudio.microsoft.com/vs/) (the community/free version will work just fine).


## Creating your project
1. Open Visual Studio, and click `File > New > Project`. A window should pop up that looks something like the window below:
![screenshot-1](/csharp-tut-1.png)
2. Make sure you select **Visual C#** in the panel on the left, then choose **Class Library (.NET Framework)**.
<br>It's very important that you select the correct project type, as otherwise your resource will **not** run.
3. After selecting the project type, make sure you set the Framework version to **.NET Framework 4.5.2** (somewhere at the bottom of the window, see the highlighted areas in the screenshot above). Yes, this is **not** the latest version, but this specific version is required for your resource to work correctly.
4. Once you've selected all these things and specified the correct framework version, it's time to enter a name for this project.
  - If this is going to be a client script, name it something like `MyResourceNameClient`.
  - If it's going to be a server script, name it something like `MyResourceNameServer`.
  - If it's going to be a script for both the server and the client, we'll consider this a Client script for now because we will create the Server project for this resource later.
<br><br>{{% alert theme="info" %}}You might want to change the "Solution name:" to something simpler. Instead of **MyResourceName[Server/Client]** you probably want to change it to just **MyResourceName**.<br>However, this is completely up to you.{{% /alert %}}
5. After choosing a proper name, click "Browse..." to choose a folder where you want to save this project, or click "OK" if you want to save it in the default location.
### Additional project
**You can skip these steps if you only created a server or client side project, however continue reading if you need both a client and a server sided project.**
6. So, you've just created a client side project, but you also need a server side project. To add this to the solution, right-click on the "Solution '<solution name>' (1 project)" item in the Solution Explorer on the right side of your screen, and click "Add > New Project". All the settings should be the same as you used for the client project. This time, change the name to "MyResourceNameServer" and click "OK".
7. You should now have 2 projects inside your "Solution 'MyResourceName'" solution (again, you can view this in the Solution Explorer on the right).


## Configuring some project settings
To be able to build these projects and prepare them for FXServer, we'll need to change some settings in the project settings (change these settings in both projects if you're using multiple projects for the client/server).

1. In the solution explorer on the right, right-click on your **project** (not the solution), and select "Properties".
2. Then go to the "Application" tab on the left, and in there add `.net` at the end of the "Assembly name". Now press CTRL + S to save this change. ![screenshot-2](/csharp-tut-2.png)
This is a very important step, if you do not add `.net` at the end of the Assembly name, your resource will **NOT** run (as it won't be suffixed with `.net.dll` in the output - renaming it will work but you probably won't want to do this).

## Setting up the required dependencies
Once you've set that all up, it's time to get our dependencies for our resource.
<br>Depending on the type of resource you want to create, we'll either need the server CitizenFX.Core.dll dependency (for resources that need to run on the server side), or the client CitizenFX.Core.dll dependency (for resources that need to run on the client). If you want to be able to run your script both on the server and the client, you'll need to get both of those dependencies, and we'll make 2 separate projects in our resource solution.

#### Client dependency
Getting the client dependency is very easy. Simply go to your local installation folder of FiveM, and follow the following path and copy the CitizenFX.Core.dll file. Then go to the folder where you saved your  Visual Studio project, and paste the DLL file in that folder.
```ini
FiveM Application Data\citizen\clr2\lib\mono\4.5\CitizenFX.Core.dll
```
Now, go back into Visual Studio and go to your project in the Solution Explorer on the right. Right click on your (client) project, and click "Add > Reference".
The following window should appear: ![screenshot-3](/csharp-tut-3.png)
In that window, click on "Browse..." and go to your project folder. Find the CitizenFX.Core.dll file, select it, and press Add. You should now see that the DLL has been added to the "Browse > Recent" list. Make sure that the checkbox in front of the reference **is** checked, and click "OK" in the bottom right.

Congratulations, you've now added the client dependency to your project. Only one more step before we can actually start coding. If you have a server sided project, also follow the next step. Otherwise, skip the next step and continue to the "Let's write some code" section.


#### Server dependency
The server project dependency is very similar to the client one. One major change is the location where you get the dependency from. Instead of getting it from your client files, you actually need to grab it from your server files.

Go to the following folder in your server files:
```ini
citizen\clr2\lib\mono\4.5\
```
Once you're in there, copy the `CitizenFX.Core.dll` file and paste it in your C# server project folder.

Now, go back into Visual Studio and go to your project in the Solution Explorer on the right. Right click on your (server) project, and click "Add > Reference".
The same window shown in the above section should appear.

In that window, click on "Browse..." and go to your server project folder. Find the CitizenFX.Core.dll file, select it, and press Add. You should now see that the DLL has been added to the "Browse > Recent" list. Make sure that the checkbox in front of the reference **is** checked, and click "OK" in the bottom right.

Congratulations, you've now added the server dependency to your project.


# Let's write some code
**[It's finally time to actually start writing some code! 🎉](/docs/scripting-manual/introduction/creating-your-first-script-csharp)**
