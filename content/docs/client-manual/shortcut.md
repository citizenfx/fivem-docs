---
title: FiveM Shortcut
weight: 80
toc_hide: true
---

## How to Access FiveM Properties

**Note:** You can skip to step 3 if you already have a shortcut created.

1. **Locate FiveM Application**
   - Navigate to the FiveM installation directory, **usually** found at `%localappdata%\FiveM`.
   - Alternatively, you can search for "FiveM" in the Windows search bar to find the application.

2. **Create a Shortcut**
   - Right-click on the `FiveM.exe` file in the installation directory.
   - Select "Create shortcut."
   - Move the newly created shortcut to a preferred location on your PC.

3. **Access Shortcut Properties**
   - Right-click on the shortcut you just created.
   - Select "Properties" from the context menu.

### What can you add?

Shortcuts allow you to add multiple things to launch FiveM with pre-defined settings. You can do the following:

### FiveM second instance

```
-cl2

-- Should look like this
%localappdata%\FiveM\FiveM.exe -cl2
```

This method allows you to create a second instance of FiveM, which is particularly useful for developers who want to test with a second player themselves. However, please note that this will not create a different identifier.

For more information refer to the [Running two FiveM clients](/docs/client-manual/running-two-fivem-clients/) guide.

### Puremode level

```
-pure_X

-- Should look like this
%localappdata%\FiveM\FiveM.exe -pure_1
```

Where `X` represents the level you wish to have (0-2 available). This will launch FiveM directly to the puremode level requested. This is good if you play on a specific server to avoid the "Puremode transition".

### Game build

```
-bXXXX

-- Should look like this
%localappdata%\FiveM\FiveM.exe -b1604
```

Where `XXXX` represents the build number you wish. You can find the list [here](/docs/server-manual/server-commands/#sv_enforcegamebuild-build). This will launch FiveM application directly to the build requested. This is good if you play on a specific server to avoid the "build transition".

---

Please note that this will not affect the FiveM instalation. You can easily repeat the steps if you missed something. For any issue, join our [Discord](https://discord.gg/fivem).
