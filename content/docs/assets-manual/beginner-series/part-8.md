---
title: Part 8 - Door Creation
weight: 80
---

{{% youtube id="ajqNHqB8mYw" %}}

## What We'll Cover in This Part

- Setting up a standard swinging door
- Adapting the setup for sliding doors and gates
- Adapting the setup for vertical garage doors
- Correct YTYP values and door origin placement

## Swinging Door Setup

### Requirements

Before starting, ensure you have:

- Your custom door model completed
- All required textures prepared

### Template Model

Use the following GTA V model as your template:

**Template:** `v_ilev_bl_door_l.ydr`

### Steps

1. Select the door mesh and snap the 3D cursor to it:

   ```
   Mesh -> Snap -> Cursor to Selected
   ```

2. Switch to Object Mode and set the origin to the 3D cursor:

   ```
   Object -> Set Origin -> Origin to 3D Cursor
   ```

3. Make sure the origin is at the hinge point so the door rotates correctly.
4. Align your custom door with the vanilla template and apply all transforms.
5. Convert your custom model into a Drawable.
6. Delete the template door mesh, unparent your mesh, and parent it to the template Armature/Drawable.
7. Add a **Copy Transforms** constraint to your door mesh and set:
   - **Target:** Armature
   - **Bone:** Template door bone
8. If you edited collision scale or transforms, create a new **Bound Composite** and parent the collision to it.

If you skip step 8 after collision edits, collision behavior may break in-game.

### YTYP Settings

Create a new YTYP archetype and set:

| Setting | Value |
|----------|--------|
| Special Attribute | **Normal Door (7)** |
| Archetype Flags | **Dynamic** |
| Archetype Flags | **Enable Door Physics** |

## Sliding Door / Gate Setup

### Template Model

**Template:** `prop_facgate_07b.ydr`

### Differences From Swinging Doors

1. Repeat the Swinging Door workflow above.
2. Place the origin at the **bottom corner of the door** instead of the hinge side.
3. Use the following YTYP values:

| Setting | Value |
|----------|--------|
| Special Attribute | **Sliding Door (8)** |
| Archetype Flags | **Dynamic** |
| Archetype Flags | **Enable Door Physics** |

## Vertical Sliding Door / Garage Door Setup

### Template Model

**Template:** `lr_prop_supermod_door_01.ydr`

### Differences From Swinging Doors

1. Repeat the Swinging Door workflow above.
2. Place the origin at the **bottom center of the door**.
3. Use the following YTYP values:

| Setting | Value |
|----------|--------|
| Special Attribute | **Garage Door (5)** |
| Archetype Flags | **Dynamic** |
| Archetype Flags | **Enable Door Physics** |

## Origin Placement Reference

| Door Type | Origin Location | Special Attribute |
|------------|----------------|------------------|
| Swinging Door | Hinge point (side center) | Normal Door (7) |
| Sliding Door / Gate | Bottom corner | Sliding Door (8) |
| Vertical Sliding Door | Bottom center | Garage Door (5) |

{{% article-nav %}}