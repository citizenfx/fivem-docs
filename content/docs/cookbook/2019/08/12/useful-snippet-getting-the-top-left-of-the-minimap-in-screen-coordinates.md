---
title: "Useful snippet: getting the top left of the minimap in screen coordinates"
date: 2019-08-12T12:33:08.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **August 12, 2019**. Newer information may exist.
{{< /alert >}}

```lua
SetScriptGfxAlign(string.byte('L'), string.byte('B'))
local minimapTopX, minimapTopY = GetScriptGfxPosition(-0.0045, 0.002 + (-0.188888))
ResetScriptGfxAlign()

local w, h = GetActiveScreenResolution()

return { w * minimapTopX, h * minimapTopY }
```

This could be useful if you want to align things to NUI or other screen-space draws, and works on pretty much any aspect ratio. The magic numbers here are the `minimap` position from `common:/data/ui/frontend.xml`, as seen below:

```xml
<data name="minimap"           alignX="L"	alignY="B"	posX="-0.0045"		posY="0.002"		sizeX="0.150"		sizeY="0.188888" /> <!-- WARNING! Feed MUST match posX and PosY -->
```

This will likely also work for aligning to other positions, assuming you set the right sizes.

---

*Original discussion thread: [https://forum.fivem.net/t/useful-snippet-getting-the-top-left-of-the-minimap-in-screen-coordinates/712843](https://forum.fivem.net/t/useful-snippet-getting-the-top-left-of-the-minimap-in-screen-coordinates/712843)*
