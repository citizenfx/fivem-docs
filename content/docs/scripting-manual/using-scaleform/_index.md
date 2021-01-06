---
title: Using Scaleform
weight: 460
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

You can interface with scaleforms by performing native calls from the [GRAPHICS namespace](https://runtime.fivem.net/doc/natives/#n_GRAPHICS) with `scaleform` in their name.

{{% alert theme="warning" %}}The game expects a .gfx to have a `TIMELINE` variable in the global scope. {{% /alert %}}

This variable serves as a kind of public API of the .gfx.

### Boilerplate

It'd be pretty time consuming to explain in details how to bootstrap your first gfx thing, so instead please use the boilerplate:

{{%attachments title="Related files" pattern=".*(zip)"/%}}

### Loading

1. Use {{% native_link "REQUEST_SCALEFORM_MOVIE" %}} with the name of the desired gfx (without file extension), for example `mp_car_stats`.
2. Use {{% native_link "HAS_SCALEFORM_MOVIE_LOADED" %}} in a loop, to prevent using a non-loaded Scaleform asset.

### Invoking functions in GFx

Please note that this is a low-level api, the C\# runtime has an [easy-to-use high-level abstraction](https://github.com/citizenfx/fivem/blob/master/code/client/clrcore/External/Scaleform.cs); and even if you don't know C\# you can use it as a reference usage of function calling natives.

**&gt;** Call {{% native_link "BEGIN_SCALEFORM_MOVIE_METHOD" %}} to initialize the function call, pass it the `handle` of the GFx, and a function name string, which **should be a member of the global TIMELINE variable** in ActionScript.

**&gt;** Define arguments, using one of the following functions depending on what type of argument you want to pass:

-   {{% native_link "SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT" %}}
-   {{% native_link "SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT" %}}
-   {{% native_link "SCALEFORM_MOVIE_METHOD_ADD_PARAM_BOOL" %}}
-   {{% native_link "_PUSH_SCALEFORM_MOVIE_METHOD_PARAMETER_STRING" %}} **(only use for short strings like texture names)**
-   A pair of {{% native_link "BEGIN_TEXT_COMMAND_SCALEFORM_STRING" %}}, {{% native_link "ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME" %}}, and {{% native_link "END_TEXT_COMMAND_SCALEFORM_STRING" %}} for normal strings

**&gt;** Call {{% native_link "END_SCALEFORM_MOVIE_METHOD" %}} to finish function call.

### Drawing

You can draw scaleform using one of these comamnds, **red, green, blue, alpha and unk parameters can be omitted as they don't affect anything**:

-   {{% native_link "DRAW_SCALEFORM_MOVIE" %}} for drawing gfx in 2D on a specific position
-   {{% native_link "DRAW_SCALEFORM_MOVIE_FULLSCREEN" %}} also draws gfx in 2D, however in fullscreen
-   {{% native_link "DRAW_SCALEFORM_MOVIE_3D" %}} **do note that if you have blackout enabled this will be drawn with “solarized” and shifted to yellow colours**.

Masking
-------

Can be faked using the function {{% native_link "DRAW_SCALEFORM_MOVIE_FULLSCREEN_MASKED" %}}, where the first gfx is what you want to render, and the second gfx is a mask for it.

This masking has no antialising, it doesn't perform “smooth” masking, if a particular pixel of masking gfx is not fully transparent, then the underlying pixel will be fully shown.

Using textures
--------------

In normal Flash you can simply load an image into MovieClip (see MovieClipLoader class in AS2 docs) using its (http\[s\]) url, however in-game you need the `img` protocol.

Example of correct image url: `img://mpcarhud/albany`, where `mpcarhud` is the name of a texture dictionary and `albany` is the texture name in said TXD.

Useful links
------------

- ~~[Official AS2 reference](http://help.adobe.com/en_US/AS2LCR/Flash_10.0/help.html?content=Part2_AS2_LangRef_1.html)~~
- [AS2 reference](http://demo.ligams.free.fr/AS2LR/)
- [Extra Scaleform documentation](https://forum.cfx.re/t/99874)

Extra Information
------------

Some scaleforms also allow the use of certain html elements, such as `<b>` and `<br>`. You can also set certain fonts for some using `<FONT FACE='$[fontName]'>` for example, `<FONT FACE='$Font2'>`. Here's a list of usable fonts (Not all work for every scaleform):
```
$Font2
$Font2_cond
$Font2_cond_NOT_GAMERNAME
$Font5
$Machine
$Stencil
$Lubalin
$Bookman
$Stenberg
$Mistral
$HelveticaBLK
$HelveticaBLKI
$Times
$TradeGothic
$AnnaSC
$EngraversOldEnglish
$Bauhaus
$Redemption
```
Image and size can also be set, with size being `<FONT SIZE='[fontSize]'>` and image being `<img src='img://txd/tn'>`

Example
------------

```lua
Citizen.CreateThread(function()
  local ScaleformHandle = RequestScaleformMovie("mp_big_message_freemode") -- The scaleform you want to use
  while not HasScaleformMovieLoaded(scaleform) do -- Ensure the scaleform is actually loaded before using
    Citizen.Wait(0)
  end

  BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE") -- The function you want to call from the AS file
  PushScaleformMovieMethodParameterString("Big Text") -- bigTxt
  PushScaleformMovieMethodParameterString("Smaller Text") -- msgText
  PushScaleformMovieMethodParameterInt(5) -- colId
  EndScaleformMovieMethod() -- Finish off the scaleform, it returns no data, so doesnt need "EndScaleformMovieMethodReturn"
  
  while true do -- Draw the scaleform every frame
    Citizen.Wait(0)
    DrawScaleformMovieFullscreen(ScaleformHandle, 255, 255, 255, 255) -- Draw the scaleform fullscreen
  end
end)
```
