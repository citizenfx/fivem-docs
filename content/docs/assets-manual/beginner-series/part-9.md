---
title: Part 9 - Asset Library Creation
weight: 90
---

{{% youtube id="GS-oTzWPREA" %}}

## What We'll Cover in This Part

- Setting up a Game Asset Library in Sollumz preferences
- Building the asset library from your GTAV game directory
- Using the library to auto-import assets from a YMAP

## Requirements

- Ensure you have **Sollumz 2.9.0** or newer installed.

## Creating the Asset Library

1. Open **Edit -> Preferences -> Add-ons -> Sollumz**.
2. Navigate to **General**.
3. Locate the **Game Asset Libraries** section.
4. Click the **+** button to add a new asset library.
5. Select an **empty directory** where the generated `.blend` files will be stored.

## Building the Library

1. Open the **Sollumz Tools** panel.
2. Switch to the **Asset Library** tab.
3. Click **Build Asset Library**.
4. Select your **GTAV game directory**.
5. Ensure you **do not have any custom RPFs** anywhere in the game directory, as these will break the extraction process.
6. *(Optional)* Use the **Regex** filter to limit which assets are extracted.
7. If extracting the entire game directory, expect the process to take **approximately 25 minutes to 1 hour**, depending on your PC.

## Using the Asset Library

Once the extraction has completed, you can import a single **YMAP** from any section of the map. Sollumz will automatically import all assets referenced by that YMAP, eliminating the need to manually locate and import individual models.

{{% article-nav %}}
