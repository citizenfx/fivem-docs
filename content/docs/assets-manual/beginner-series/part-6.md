---
title: Part 6 - LODs (Level of Detail)
weight: 60
---

{{% youtube id="dVkvYm4eDeI" %}}

## What We'll Cover At a Glance

- Introduction to LODs (Level of Detail)
- Creating and exporting HD and LOD models in Blender with Sollumz
- Setting up LODs in CodeWalker
- Linking HD and LOD entities through YMAP hierarchy
- Generating manifests and validating your setup

---

## Setting up LOD Model(s)

1. Prepare two versions of the same asset:
	- **HD model** (full-detail version)
	- **LOD model** (simplified geometry and materials)
2. In Blender, rename both objects clearly so they are easy to identify in CodeWalker.
3. Convert both objects to **Drawables** using Sollumz.
4. Export both assets using **Export RAGE Assets**.
5. Create a **YTYP** and add both drawables as archetypes using default settings.
6. Import the exported files into your target RPF archive in **CodeWalker RPF Explorer**.

## Creating HD / LOD YMAPs

1. Open the **Project Window** in CodeWalker and create a new YMAP for the **HD** object.
2. Place the HD entity and set:
	- **Flags**: `LOD in Parent Map`
	- **LodLevel**: `LODTYPES_DEPTH_HD`
3. Save the HD YMAP.
4. Create a second YMAP for the **LOD** object.
5. Place the LOD entity at the **exact same coordinates** as the HD entity.
6. Set the LOD entity values:
	- **ChildLodDist** = HD entity **LodDist**
	- **LodDist** = increased value based on desired streaming distance
	- **LodLevel** = `LODTYPES_DEPTH_LOD`
7. Save the LOD YMAP.

## Parenting YMAPs:

1. Copy the LOD YMAP filename and set it as the **Parent** for the HD YMAP.
2. Select the HD entity and, in the **LOD Hierarchy** tab, set **ParentIndex** from `-1` to `0`.
3. Select the LOD entity and, in the **LOD Hierarchy** tab, set **NumChildren** to `1`.
4. In the project window, open **Tools > Manifest Generator**, click **Generate**, and save the `_manifest.ymf` file.

## Summary

You now have a full HD/LOD setup for a custom asset:

- HD and LOD drawables created in Blender
- Archetypes added to a YTYP
- HD and LOD entities split into linked YMAPs
- LOD hierarchy configured correctly
- Manifest generated for proper in-game loading

{{% article-nav %}}
