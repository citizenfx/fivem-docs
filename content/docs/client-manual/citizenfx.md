---
title: CitizenFX.ini
toc_hide: true
---

## How to find this file

- Press Win+R, enter `%localappdata%\FiveM\FiveM.app\CitizenFX.ini` into the Open field, and click OK.
- This will open a text file in the systems default text editor.

Please note if you didn't install FiveM in `C:/`, just open it from the app location.

## Structure

This file should have the following:

```
[Game]
IVPath=[Your game path]
```

This is the path to the GTA 5 installation on your local machine. You shouldn't need to modify this variable as FiveM will ask you to update the path automatically if it doesn't detect the GTA5 binary.

You can also add the following in this file:

### Game build

```
SavedBuildNumber=1604
```

You can find the list of game builds [here](/docs/server-manual/server-commands/#sv_enforcegamebuild-build).

This will launch FiveM directly into the specified build so you don't have to transition when connecting to servers on the specified build.

### Update channel

```
UpdateChannel=production
```

UpdateChannel can have the following values:

- **production**: this is the stable channel for FiveM.
- **beta**: this is the version between latest updates on canary and production which will have some of the latest features after they've been tested on canary. This version isn't guaranteed to be stable you should only use it if you're a developer or want to test new features.
- **canary**: this channel will have the latest build of FiveM. This channel is unstable, **do not use this build unless you're fine with issues, crashes, etc.**.

**Note:** `canary` and `beta` are versions that isn't guaranteed to be stable and you should only use it if you're a developer or want to test new features.

### Enable Geforce Experience Overlay

```
DisableNVSP=0
```

**NOTE**: Enabling GeForce Experience Overlay has been known to cause crashing issues, which is why it is disabled.

This will tell FiveM to not block the GeForce Experience Overlay.

### Enabling dumps

```
EnableFullMemoryDump=0
```

Setting this to `EnableFullMemoryDump=1` will enable Full Memory dumps which is useful for diagnosing game crashes.

These dumps are typically very large (anywhere from 1-10gb), if you have these enabled make sure to clean then out from time to time.

You can read more about this [here](https://forum.cfx.re/t/enabling-and-uploading-full-client-dumps/1138940).

### Windows version not supported

```
DisableOSVersionCheck=0
```

By default FiveM checks if you're using using an outdated version of Windows 10 as older versions don't have certain [ABIs](https://en.wikipedia.org/wiki/Application_binary_interface) that FiveM uses.
The minimum supported version of Windows 10 is version 1703 (aka "Creators Update").
Setting this to `DisableOSVersionCheck=1` will disable the popup that happens when you start FiveM on an outdated machine.

You can see more [here](https://github.com/citizenfx/fivem/blob/1b01a54ea0803c8e06ef7e15bb1ae3a3d64de085/code/client/launcher/Main.cpp#L682).

### Disable crash dump upload

```
DisableCrashUpload=0
```

Setting this to `DisableCrashUpload=1` will disable the game from automatically uploading the crash dumps to the Cfx Sentry.
You can see more [here](https://github.com/citizenfx/fivem/blob/1b01a54ea0803c8e06ef7e15bb1ae3a3d64de085/code/client/launcher/MiniDump.cpp#L1646).

***Please note that this file shouldn't be modified if you don't know what you are doing. For any issue join our [discord](https://discord.gg/fivem).***
