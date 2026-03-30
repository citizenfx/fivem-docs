---
title: Part 7 - Map Animation Creation
weight: 70
---

{{% youtube id="11EXhLYfJLs" %}}

## What We'll Cover in This Part

- Introduction to simple animations
- Creating UV animations
- Creating animated props

## Step 1: Setting Up UV Animation

1. Have your model and textures ready before you begin. In this example, we'll create a scrolling UV animation for a billboard prop.
2. To begin, go to **Sollumz Tools > Animations > Create Clip Dictionary Template**.
3. Rename the Clip Dictionary. In this case, we'll name it **anim@ook3d_uvanim_test**.
4. Select the Animations empty, and in the Sollumz Tools menu click **Create Animation**, then select the Clip and click **Create Clip**.
5. Rename the created Animation and Clip to match your animated object.
6. Open the Animation properties, set the Hash to the object name, set the Target to Materials, and select the proper material.
7. Open the Clip properties, set the Hash to the object name, and set Name to the same value with **.clip** at the end.
8. Duration is calculated as frames divided by 30. For example, 30 frames equals a 1-second duration.
9. Expand the **Linked Animation** tab, click **New**, and select the Animation from above, ensuring the proper Frame Range is set.
10. Convert your animated prop to a Drawable, and return to the Clip properties and ensure the Hash is recalculated.

## Step 2: Animating the UVs

1. Select your mesh, go to the Material tab, and expand the **Animation Tracks** tab under the Sollumz material properties.
2. Click + to create a new UV Transformation.
3. Insert your keyframes and values as necessary for the XY values.
4. Return to your Animation properties and set the **Action** to the new Material UV action.
5. Export your Drawable and Clip Dictionary.
6. Create a new YTYP, auto-create your archetype, and set the **Clip Dictionary** to our clip dictionary object name **anim@ook3d_uvanim_test**.
7. Go to the Archetype flags tab and enable **UV Anims (YCD)** and **Auto Start Anim**.

## Step 3: Creating Animated Props

1. Create a new Armature object, set the Sollumz Type to **Drawable**.
2. Rename your armature to your drawable name, convert your mesh to a Drawable, and parent it to the Armature.
3. Add a Copy Transforms constraint to the mesh and set the Target to your Drawable / Armature, and set the Bone.
4. Create a new Clip Dictionary Template, and rename it. For example: **anim@ook3d_prop_anim_test**.
5. Select the Animations empty, and click **Create Animation**, do the same for the Clips, **Create Clip**.
6. Rename your created Animation and Clip to the same name as your Drawable.
7. Open the Animation properties and set the Hash to your drawable name, and set the Target to your Drawable.
8. Set the Clip Hash property to your Drawable name, and set Name to your Drawable name + **.clip**.
9. Duration is calculated as frames divided by 30. For example, 30 frames equals a 1-second duration.
10. Expand the **Linked Animation** tab, click **New**, and select the Animation from above, ensuring the proper Frame Range is set.
11. Now enter pose mode on your Armature and insert your keyframes.
12. Return to your Animation properties and assign the **Action** to your new animation action.
13. Export both your Clip Dictionary and Drawable.
14. Create a new YTYP, auto-create your archetype, and set the **Clip Dictionary** to our clip dictionary object name **anim@ook3d_prop_anim_test**.
15. Go to the Archetype flags tab and enable **Has Anims (YCD)** and **Auto Start Anim**.

{{% article-nav %}}
