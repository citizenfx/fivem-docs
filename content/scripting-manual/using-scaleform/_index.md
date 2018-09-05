---
title: Using Scaleform
weight: 440
---

Scaleform GFx is the native GUI for GTA V, based on Flash technology using ActionScript 2, which is a superset of ECMAScript (JavaScript) - read more on [Wikipedia](https://en.wikipedia.org/wiki/Scaleform_GFx).

Development environment
---------------

In order to develop custom .gfx assets (optimized SWF) you need to have Adobe Flash Pro CS6, use ActionScript 2 (version 3 has a different virtual machine which is not supported by the version GFx GTA uses) and target Flash Player 8.0.

To convert a .swf file produced by Adobe Flash into .gfx, you need the `gfxexport.exe` tool from the Scaleform GFx SDK (version 4.0 is fine).

Limitations
-----------

Scaleform doesn't implement some features from Flash:

-   No filters for shapes. **At all**.
-   No blur filter for text either. *Can be faked with a glow filter*.
-   No masking. *Will be discussed later on this page*.
-   No embedded raster graphics. *Will be discussed later on this page*.

Interfacing
-----------

You can interface with scaleforms by performing native calls from the [GRAPHICS namespace](https://runtime.fivem.net/doc/reference.html#_n_GRAPHICS) with `scaleform` in their name.

{{% alert theme="warning" %}}The game expects a .gfx to have a `TIMELINE` variable in the global scope. {{% /alert %}}

This variable serves as a kind of public API of the .gfx.

### Boilerplate

It'd be pretty time consuming to explain in details how to bootstrap your first gfx thing, so instead please use the boilerplate:

{{%attachments title="Related files" pattern=".*(zip)"/%}}

### Loading

1. Use {{<native_link "REQUEST_SCALEFORM_MOVIE">}}) with the name of the desired gfx (without file extension), for example `mp_car_stats`.
2. Use {{<native_link "HAS_SCALEFORM_MOVIE_LOADED">}}) in a loop, to prevent using a non-loaded Scaleform asset.

### Invoking functions in GFx

Please note that this is a low-level api, the C\# runtime has an [easy-to-use high-level abstraction](https://github.com/citizenfx/fivem/blob/master/code/client/clrcore/External/Scaleform.cs); and even if you don't know C\# you can use it as a reference usage of function calling natives.

**&gt;** Call {{<native_link "_PUSH_SCALEFORM_MOVIE_FUNCTION">}} to initialize the function call, pass it the `handle` of the GFx, and a function name string, which **should be a member of the global TIMELINE variable** in ActionScript.

**&gt;** Define arguments, using one of the following functions depending on what type of argument you want to pass:

-   {{<native_link "_PUSH_SCALEFORM_MOVIE_FUNCTION_PARAMETER_INT">}}
-   {{<native_link "_PUSH_SCALEFORM_MOVIE_FUNCTION_PARAMETER_FLOAT">}}
-   {{<native_link "_PUSH_SCALEFORM_MOVIE_FUNCTION_PARAMETER_BOOL">}}
-   {{<native_link "_PUSH_SCALEFORM_MOVIE_FUNCTION_PARAMETER_STRING">}} **(only use for short strings like texture names)**
-   A pair of {{<native_link "BEGIN_TEXT_COMMAND_SCALEFORM_STRING">}}, {{<native_link "ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME">}}, and {{<native_link "END_TEXT_COMMAND_SCALEFORM_STRING">}} for normal strings

**&gt;** Call {{<native_link "_POP_SCALEFORM_MOVIE_FUNCTION_VOID">}} to finish function call.

### Drawing

You can draw scaleform using one of these comamnds, **red, green, blue, alpha and unk parameters can be omitted as they don't affect anything**:

-   {{<native_link "DRAW_SCALEFORM_MOVIE">}} for drawing gfx in 2D on a specific position
-   {{<native_link "DRAW_SCALEFORM_MOVIE_FULLSCREEN">}} also draws gfx in 2D, however in fullscreen
-   {{<native_link "DRAW_SCALEFORM_MOVIE_3D">}} **do note that if you have blackout enabled this will be drawn with “solarized” and shifted to yellow colours**.

Masking
-------

Can be faked using the function {{<native_link "DRAW_SCALEFORM_MOVIE_FULLSCREEN_MASKED">}}, where the first gfx is what you want to render, and the second gfx is a mask for it.

This masking has no antialising, it doesn't perform “smooth” masking, if a particular pixel of masking gfx is not fully transparent, then the underlying pixel will be fully shown.

Using textures
--------------

In normal Flash you can simply load an image into MovieClip (see MovieClipLoader class in AS2 docs) using its (http\[s\]) url, however in-game you need the `img` protocol.

Example of correct image url: `img://mpcarhud/albany`, where `mpcarhud` is the name of a [texture dictionary](Glossary#File_types "wikilink"), and `albany` is the texture name in said TXD.

Useful links
------------

-   [Official AS2 reference](http://help.adobe.com/en_US/AS2LCR/Flash_10.0/help.html?content=Part2_AS2_LangRef_1.html)
