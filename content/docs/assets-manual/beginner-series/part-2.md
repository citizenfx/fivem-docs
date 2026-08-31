---
title: Part 2 - Exploring & Exporting GTAV Assets
weight: 20
---

{{% youtube id="fCQ5JlbWcSE" %}}

## What We'll Cover in This Part

- Basic CodeWalker usage
- Finding models in CodeWalker
- Exporting models
- Importing models with Sollumz
- Basic Sollumz overview

## Step 1: Launching CodeWalker

1. Open your CodeWalker folder and double-click **CodeWalker.exe** to launch the program:\
   ![CodeWalker Launch](/assets-manual/codewalker_launch.png)
Wait for the application to fully load its assets.
2. Click the **expand arrow** and press the **T key** to open the main toolbar.

## Step 2: Setting Up CodeWalker

1. In the right-side panel, locate the **DLC Level** dropdown.
2. Ensure the **bottommost** option is selected.\
   ![CodeWalker DLC Level](/assets-manual/codewalker_dlc_level.png)
3. Check **Enable DLCs**.
   ![CodeWalker Enable DLCs](/assets-manual/codewalker_enable_dlcs.png)
4. Go to **Options -> Save Settings** (top-right corner).

## Step 3: Navigating in CodeWalker

- **Pan camera:** Left-click and drag.
- **Move camera:** Use **WASD** keys.
- **Adjust movement speed:** Scroll the mouse wheel.

## Step 4: Selecting and Exporting Models

1. Enable **Select Object** and **Move Tool** on the toolbar.
2. Find and select a model you want to export.
3. In the top-right panel, **copy the object name**.\
   ![Codewalker Copy Object Name](/assets-manual/codewalker_copy_object_name.png)
4. Go to **Tools -> RPF Explorer**.
5. Search for the model name.
6. Right-click it and choose **Export XML**.
7. Double-click the model to open it.
8. In the left panel, go to the **Materials** tab and click **Save All Textures**.

## Step 5: Importing into Blender (Sollumz)

1. Open **Blender**.
2. Press **N** to open the side toolbar.
3. Locate the **Sollumz Tools** tab.\
   ![Sollumz Tab](/assets-manual/sollumz_tab.png)
4. In the **General** tab, click **Import CodeWalker XML**.
   ![Import CodeWalker XML](/assets-manual/sollumz_import_codewalker_xml.png)
5. Use the default import settings.

## Step 6: Fixing Missing Textures

1. Press **V** in the viewport.
2. Select **Find Missing Textures**.
3. Choose the folder where you saved all textures earlier.

## Step 7: Exporting Back to CodeWalker

1. In the **Sollumz Tools -> General** tab, click **Export CodeWalker XML**.
2. Open **CodeWalker RPF Explorer** again.
3. Navigate to your **3dmods RPF archive**.
4. Drag the exported `.XML` file into it.

You've successfully imported and exported your first GTAV model using CodeWalker and Sollumz!

{{% article-nav %}}
