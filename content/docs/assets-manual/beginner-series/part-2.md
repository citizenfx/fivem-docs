---
title: Part 2 - Initial Tools Setup 2
weight: 20
---

{{% youtube id="fCQ5JlbWcSE" %}}

In this part, we'll be covering:

- Basic CodeWalker usage
- Finding models in CodeWalker
- Exporting models
- Importing models with Sollumz
- Basic Sollumz overview

## Step 1: Launching CodeWalker

1. Open your **CodeWalker** folder.
2. Find and run **CodeWalker.exe**.
3. Wait for the application to fully load.

Expand the panel in the top-right corner, then press **T** to open the toolbar.

## Step 2: Setting Up CodeWalker

1. In the right-side panel, locate the **DLC Level** dropdown.
2. Ensure the **bottommost** option is selected.
3. Check **Enable DLCs**.
4. Go to **Options -> Save Settings** (top-right corner).

## Step 3: Navigating in CodeWalker

- **Pan camera:** Left-click and drag.
- **Move camera:** Use **WASD** keys.
- **Adjust movement speed:** Scroll the mouse wheel.

## Step 4: Selecting and Exporting Models

1. Enable **Select Object** and **Move Tool** on the toolbar.
2. Find and select a model you want to export.
3. In the top-right panel, **copy the object name**.
4. Go to **Tools -> RPF Explorer**.
5. Search for the model name.
6. Right-click it and choose **Export XML**.
7. Double-click the model to open it.
8. In the left panel, go to the **Materials** tab and click **Save All Textures**.

## Step 5: Importing into Blender (Sollumz)

1. Open **Blender**.
2. Press **N** to open the side toolbar.
3. Locate the **Sollumz Tools** tab.
4. In the **General** tab, click **Import CodeWalker XML**.
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
