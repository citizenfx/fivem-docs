---
title: Part 3 - Basic Asset Creation
weight: 400
layout: single
---

{{% youtube id="FOBlazpGIhA" %}}

In this part, we'll be covering:

- Creating new assets with Sollumz
- Adding materials
- Adding vertex colours
- Proper UV Map naming
- Creating a ytyp file
- Exporting assets back to CodeWalker

## Step 1: Preparing Your Model

1. You'll need a mesh of some kind.
2. Textures compressed in the .dds format.
3. NVTT (Nvidia Texture Tools) is a great tool to create .dds textures.

Depending on which texture maps you have, you'll be using different shaders.
In this example, we have a Diffuse, Normal and Specular texture, so we will be using the normal_spec shader.

## Step 2: Applying Your Textures

1. Go to **Sollumz Tools panel, Drawables -> Shader Tools** and in the list press CTRL + F to find the **normal_spec** shader.
2. Select it and click create shader material with the object selected.
3. Go to the material tab, find the Sollumz tab and expand the Texture Parameters tab.
4. Apply each of your textures to each Sampler option.
5. Enable Embedded for each texture if you do not wish to create a texture dictionary.

## Step 3: UV Maps and Vertex Colors

1. Go to the Data properties tab, and open the Color Attribute tab.
2. Remove the existing attribute, and click the + to create a new attribute, set the name to **Color 1**, the domain to **Face Corner**, the Data Type to **Byte Color**.
3. Depending on whether this asset is for an interior or exterior project, set the color to red for exterior and green for interior.
4. Go to the UV Maps tab, and ensure the UV Map is named **UVMap 0**, Sollumz will warn you if there are any issues.

## Step 4: Creating Your Drawable

1. Select your mesh object, in the viewport press V, and select **Convert to Drawable**.
2. Press V again and select **Export RAGE Assets**.
3. Change the export options to Native and Gen8.

## Step 5: YTYP Creation

1. In the Sollumz tools, go to **Archetype Definition**.
2. Create a new YTYP with the + button, rename the created ytyp.
3. Select your Drawable and click **Auto-Create From Selected**.
4. Click **Export YTYP**.

## Step 6: Importing Files to CodeWalker

1. Drag all exported files into our RPF we created.
2. Once imported, restart CodeWalker.
3. You can now view the Drawable, all textures should be applied correctly.
