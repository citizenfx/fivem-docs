---
title: Scripting in C#
weight: 423
languages: ['cs']
---


# Setting up our environment
Before you can create your first C# resource, you'll need to install [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/) (the community/free version will work just fine).


## Creating your project
1. Open a command window by pressing `Win + R`, type in `cmd` and then press `Enter`. Now you should have a console like the one below:

![screenshot-1](/csharp-tut-1.png)

2. Once that window shows up we're going to be following the [FiveM's Cookbook modern guide](https://cookbook.fivem.net/2020/02/24/try-the-new-citizenfx-c-templates-for-fivem/) to setup our scripting environment, so make sure you enter the following commands in the console window:

```
dotnet new -i CitizenFX.Templates
mkdir MyResource
cd MyResource
dotnet new cfx-resource
```

3. If everything went right, you should get a folder named `MyResource` with a solution file named `MyResource.sln`. This is the solution file to manage your projects.
4. To build the project, you can click on `build.cmd`, which will build a release server and client dll for you, both targeting the correct `.NET Framework` needed for FiveM and FXServer.

## Setting up and running the project
If you built the resource, you should now have a `dist` folder available, so you should be able to run the following commands:

**Change directory to the resource path named `MyResource`:**
```dos
cd /d [PATH TO THIS RESOURCE]
```

**Make a symbolic link. For more information about `mklink`, visit the following [article](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink)** by Microsoft.

```
mklink /d X:\cfx-server-data\resources\[local]\MyResource dist
```

{{% alert theme="info" %}}
**Make sure you provide the right paths.**
{{% /alert %}}

Afterwards, you can use `ensure MyResource` in your `server.cfg` or server console to start the resource.

Congratulations, you've created a resource using FiveM's C# templates!

# Let's write some code
**[It's finally time to actually start writing some code! 🎉](/docs/scripting-manual/introduction/creating-your-first-script-csharp)**
