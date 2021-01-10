---
title: Scripting in C#
weight: 423
languages: ['cs']
---

# Setting up our environment
Before you can create your first C# resource, you'll need to install [Visual Studio 2019](https://visualstudio.microsoft.com/vs/). The Community (free) edition will work just fine.

## Creating our project
1. Open Visual Studio 2019. A window similar to the one below will pop up:
<br>
![screenshot-1](/csharp-setup-1.png)

2. Select "Create a new project". The following window will pop up:
<br>
![screenshot-2](/csharp-setup-2.png)

3. Choose **Class Library (.NET Framework)** (C#) and click "next".
<br>
It's very important that you select the correct project type, as otherwise your resource will **not** run.
<br>
The following window will appear:
<br>
![screenshot-3](/csharp-setup-3.png)

4. Choose a name for your new resource project. 
<br>
    - If this is going to be a client resource, name it something like `MyResourceNameClient`.
    - If it's going to be a server resource, name it something like `MyResourceNameServer`.
    - If it's going to be a resource containing both a server and a client project, we'll consider this a client project for now, because we will create the server project for this resource later. In this case, we recommend changing the solution name to just `MyResourceName` (see the image above), however, it's completely up to you.
<br>

5. Before proceeding to the next step, make sure you set the Framework version to **.NET Framework 4.5.2** (somewhere at the bottom of the window, see the highlighted areas in the screenshot above). 
<br>
Yes, this is **not** the latest version, but this specific version is required for your client resource to work correctly. In case of a server resource, it's possible to target up to **.NET Framework 4.6.1**.
<br>
Click "Create", and the full IDE will finally appear.

## Creating additional projects
{{% alert theme="info" %}}You can skip these steps if you only created a server or client side project, however continue reading if you need both a client and a server side project.{{% /alert %}}
<br>
1. So, you've just created a client-side project, but you also need a server-side project. Right-click on *"Solution 'MyResourceName' (1 of 1 projects)"* in the Solution Explorer, and click "Add > New Project".
<br>
![screenshot-4](/csharp-setup-4.png)

2. Configure your project like we did before and click "Create".
<br>
![screenshot-5](/csharp-setup-5.png)

## Sharing code between projects
If you have multiple projects in your solution, and you want to share code among them, it's a good idea to create a shared project.
<br>
1. Follow the same steps to create a new project, but select the "Shared project" template.
<br>
![screenshot-6](/csharp-setup-6.png)

2. After naming your shared project, you need to reference it in all of your projects. Right click on the "References" item of your project and select "Add reference", then tick the Shared project and click "OK".
<br>
![screenshot-7](/csharp-setup-7.png)

Any classes you add to the shared project will be available in all of your projects where you referenced it. This is particularly useful for your data model classes.

## Required project settings
To make these projects work with FXServer, we'll need to change some settings.

1. In the solution explorer on the right, right-click on your **project** (not the solution), and select "Properties".
<br>
![screenshot-8](/csharp-setup-8.png)

2. In the "Application" tab on the left, modify the "Assembly name" and add `.net` to your project's name. Now press CTRL + S to save this change.
<br>
This is a very important step; if you do not add `.net` at the end of the Assembly name, your resource will **NOT** run (as it won't be suffixed with `.net.dll` in the output - renaming it will work but you probably won't want to do this manually every single time you compile your scripts).
<br>
![screenshot-9](/csharp-setup-9.png)

Repeat the above steps for all of your projects (except shared projects).

Optionally, you may want to add a build event to automatically copy your output files to your resource folder. To do this, navigate to the "Build Events" tab, copy the following code and paste it in the "Post-build event command line" field:
```
if $(ConfigurationName) == Release (
    copy /y "$(TargetDir)$(TargetName).dll" "C:\path\to\your\resource\folder\$(TargetName).dll"
)
```
Remember to set your solution's configuration to "Release".

## Setting up the required dependencies
To build script resources for FiveM in C#, you need to reference the appropriate packages. The best and easiest way to reference those packages and to keep them up to date, is to use the NuGet package manager, included in Visual Studio 2019.

1. Right click on your project and select "Manage NuGet Packages...".
<br>
![screenshot-10](/csharp-setup-10.png)

2. In the "browse" tab, search for "CitizenFX". In case you are installing the dependency for a client project, select `CitizenFX.Core.Client`, otherwise, if it's for a server project, select `CitizenFX.Core.Server`, then click "Install".
<br>
Be very careful to not install other CitizenFX NuGet packages because they are outdated.
<br>
![screenshot-11](/csharp-setup-11.png)

# Let's write some code
**[It's finally time to actually start writing some code! ??](/docs/scripting-manual/introduction/creating-your-first-script-csharp)**
