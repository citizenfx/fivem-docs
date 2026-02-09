---
title: Part 5 - Collision Editing and Creation
weight: 50
---

{{% youtube id="UN7iaK5ADpk" %}}

## What We'll Cover in This Part

- Introduction to collision models
- Creating simple collisions in Blender
- Exporting and testing collisions in-game
- Creating embedded collision models

## Editing World Collisions

1. Open the CodeWalker World View, navigate to the right-side panel, and in the top-left go to the 'Selection' tab to change from Entity to Collision.
2. Find the collisions you want to edit and copy the .ybn filename when selecting the collision.
3. Go to Tools → RPF Explorer and export the .ybn as XML.
4. Import the XML into Blender.
5. Make any edits you wish, then export the .ybn file.
6. If you wish to add new collision objects, position them in **World Coordinates** and create a new collision material for each mesh object.
7. Set the **Sollumz Type** for the new collision object to "Bound Poly Box" under object properties in the Sollumz tab.
8. Ensure you parent the new collision object to the correct Bound GeometryBVH that has the proper flags.
9. Export your .ybn file.

## Embedded Model Collisions

1. Select your drawable object, go to Collisions -> Create Bounds, and click "Create Bound."
2. Select the created Bound Composite and, in the drop-down, change it from "Bound Composite" to "Bound GeometryBVH," then click Create Bounds.
3. Select the Bound GeometryBVH, and in the viewport, press V and select "Apply Flag Preset."
4. Create a collision mesh or basic primitive shapes, then parent them to the BVH object and set the **Sollumz types** using the drop-down menu.
5. Ensure each collision object has the correct Sollumz type (Bound Poly Mesh for geometry, Bound Poly Box for boxes) and a proper collision material.

{{% article-nav %}}
