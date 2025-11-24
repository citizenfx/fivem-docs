---
title: Alchemist
weight: 850
description: >
  Information about Alchemist, Asset Conversion and Asset Refinement
---

## What is Alchemist?

Alchemist is a tool for players, server owners, and asset creators who want to convert assets originally made for **GTAV Legacy (Gen8)** to be compatible with **GTAV Enhanced (Gen9)**.  
It also allows you to refine existing Legacy assets to correct potential formatting or compatibility issues created by earlier tools.

You can download Alchemist directly on the [Cfx Portal](https://portal.cfx.re/downloads).

### What is Asset Conversion?

The **Asset Conversion** feature allows you to automatically convert a given folder and all its contents, making all your existing Legacy 3D assets compatible with FiveM Enhanced.

### What is Asset Refinement?

**Asset Refinement** automatically corrects your Legacy assets. This is useful if you have existing Legacy assets that were created with older tools.

### Requirements to Run Alchemist

- Windows 11

### Supported Filetypes

The following filetypes are supported:

YDR, YTD, YFT, YPT and YDD.

---

## Alchemist GUI

![Alchemist GUI](/alchemist/alchemist-gui.png)

### How to Start Alchemist GUI

1. Double-click **Alchemist.exe**.  
2. Choose whether you want to submit telemetry data and click **Yes** or **No** accordingly.

#### How to Use Alchemist GUI

1. Choose between **Asset Conversion** and **Asset Refinement** depending on what you want to do.  
2. Click **Browse** next to *Select Input Folder* to specify the path to the input folder.  
3. Click **Browse** next to *Select Output Folder* to specify the path to the output folder.  
4. Click **Convert Assets** or **Refine Assets** and wait for the process to finish.

After the process is finished, you will find your converted or refined assets in the output folder.
Selecting your Cfx.re Platform Server resources directory as an input folder will generate a drop-in replacement resources folder, compatible with FiveM Enhanced.

##### Relaxed Mode

**Relaxed Mode** allows importing assets that may not fully comply with strict validation rules. Some validations are skipped to improve compatibility, which means the resulting asset may differ slightly from the original due to automatic corrections applied during import.

### Known Issues

**Issue**: If Alchemist GUI hits an escrowed asset it will fail and stop the process.

**Workaround**: Remove any escrowed assets before running the process, or use the Alchemist CLI instead. The CLI version will skip escrowed assets automatically and note them in the output report once the conversion is complete.

---

## Alchemist CLI

### How to Start Alchemist CLI

1. Open the Command Prompt.  
2. Drag **AlchemistCli.exe** into the Command Prompt window.  
3. Press **Enter**.  
4. You will be asked to accept the Terms of Service. Type **y** if you agree.  
5. You will be asked whether to enable telemetry. Enter **y** to share this data, or **n** if you prefer not to.  
6. Alchemist CLI is now ready to use.

#### How to Use Alchemist CLI

Assuming you have placed **AlchemistCli.exe** in `C:\` and created both an `input` and `output` folder in the same directory, you can start converting assets like this:

```powershell
C:\AlchemistCli.exe C:\input C:\output
```

#### CLI Parameters

You can add the following parameters to your command:

| Parameter         | Explanation                                                     |
| ----------------- | --------------------------------------------------------------- |
| `--refine`        | Refine assets instead of converting                             |
| `--relaxed`       | Enable relaxed mode - auto fixes and less strict checks         |
| `-f`              | Override files without prompt                                   |
| `-jN`             | Set the number of threads to N (default: 10), for example `-j8` |
| `--fail-on-error` | Fail on the first error                                         |

Example: 
```powershell
C:\AlchemistCli.exe C:\input C:\output -j5 -f --fail-on-error
```

At the end of the conversion, if it is successful, you will see a message similar to the following:
```powershell
Converting C:\input\folderName\assetName.yft to C:\output\folderName\assetName.yft
Converting C:\input\folderName\assetName.ytd to C:\output\folderName\assetName.ytd
Converting C:\input\folderName\assetName.yft to C:\output\folderName\assetName.yft
Conversion completed in 60ms
```
