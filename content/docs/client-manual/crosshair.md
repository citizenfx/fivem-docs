---
title: Crosshair commands
weight: 270
---

# About the crosshair

The crosshair mimics the one seen in CS:GO, hence any existing CS:GO crosshair configs will work in FiveM.

*Example of a preset crosshair line:*

```
cl_customcrosshair 1;cl_crosshairstyle 5;cl_crosshairsize 3.5;cl_crosshair_drawoutline 1;cl_crosshairthickness 1;cl_crosshair_outlinethickness 0.4;cl_crosshairdot 0;cl_crosshairgap -1
```

*Existing documentation for CS:GO:* https://counterstrike.fandom.com/wiki/Crosshair

# Console Variables:

### cl_customCrosshair \<bool\>
Toggle the custom crosshair.

Usage: `cl_customCrosshair <true|false>`

### cl_crosshairdot \<bool\>
Controls whether the center dot is visible.

Usage: `cl_crosshairdot <true|false>`

### cl_crosshairsize \<float\>
Controls the length of the crosshair's lines.

Usage: `cl_crosshairsize 5.0`

### cl_crosshairstyle \<int\>
Controls the style of the crosshair.

Usage: `cl_crosshairstyle 0`

### cl_crosshairthickness \<float\>
Controls the thickness of the crosshair's center dot and lines.

Usage: `cl_crosshairthickness 0.5`

### cl_crosshairgap \<float\>
Controls the gap between the crosshair's center dot and the lines.

Usage: `cl_crosshairgap 1.0`

### cl_crosshair_drawoutline \<bool\>
Controls whether the crosshair should have outline or not. Used together with `cl_crosshair_outlinethickness`.

Usage: `cl_crosshair_drawoutline <true|false>`

### cl_crosshair_outlinethickness \<float\>
Controls the thickness of the crosshair outline.

Usage: `cl_crosshair_outlinethickness 1.0`

### cl_crosshaircolor \<int\>
Ranges from `0` to `5`, set this to `5` if you wish to use custom crosshair colors (those applied via `cl_crosshaircolor_r`, `cl_crosshaircolor_g`, `cl_crosshaircolor_b`)

#### Available color presets:
0. Red
1. Green
2. Yellow
3. Purple-Blueish
4. Cyan/Turquoise
5. Custom (those applied by `cl_crosshaircolor_r`, `cl_crosshaircolor_g`, `cl_crosshaircolor_b`) 

Usage: `cl_crosshaircolor 1`

### cl_crosshaircolor_r \<int\>
Controls the red component in the crosshair's RGB color value.

Usage: `cl_crosshaircolor_r 50`

### cl_crosshaircolor_g \<int\>
Controls the green component in the crosshair's RGB color value.

Usage: `cl_crosshaircolor_g 250`

### cl_crosshaircolor_b \<int\>
Controls the blue component in the crosshair's RGB color value.

Usage: `cl_crosshaircolor_b 50`

### cl_crosshairusealpha \<bool\>
Controls whether the crosshair should have transparency or not. Used together with `cl_crosshairalpha`. 

Setting this command to `false` will set the crosshair's alpha to `200`, making it almost opaque. Set to `true` if you want to use custom transparency values via `cl_crosshairalpha`.

Usage: `cl_crosshairusealpha <true|false>`

### cl_crosshairalpha \<int\>
Controls the crosshair's transparency. Valid values go from `0` to `255`.

Usage: `cl_crosshairalpha 200`

### cl_crosshair_dynamic_splitdist \<float\>
Unused, controls how far the crosshair's center spreads when moving or shooting.

Usage: `cl_crosshair_dynamic_splitdist 7.0`

### cl_crosshair_dynamic_splitalpha_innermod \<float\>
Unused, controls the transparency of the inner part of the crosshair's lines when moving or shooting.

Usage: `cl_crosshair_dynamic_splitalpha_innermod 1.0`

### cl_crosshair_dynamic_splitalpha_outermod \<float\>
Unused, controls the transparency of the outer part of the crosshair's lines when moving or shooting.

Usage: `cl_crosshair_dynamic_splitalpha_outermod 0.5`

### cl_crosshair_dynamic_maxdist_splitratio \<float\>
Unused, controls how long the inner and outer part of the crosshair's lines are when moving or shooting.

Usage: `cl_crosshair_dynamic_maxdist_splitratio 0.35`

# Disabling the crosshair
The crosshair can be disabled from the server by entering the following line in your `server.cfg` file:

```
setr cl_customCrosshair false
```

Entering said line will set the [convar](https://docs.fivem.net/docs/scripting-reference/convars/#standard-convars) (console variable) as a [replicated variable](https://docs.fivem.net/docs/scripting-reference/convars/#using-commands-1) set to `false`.