---
title: Our work on supporting emoji in Scaleform GFx
date: 2019-06-09T09:37:38.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **June 09, 2019**. Newer information may exist.
{{< /alert >}}

In a [recent commit](https://github.com/citizenfx/fivem/commit/62f47d86a34719b97c7c99efadbc960225f822df) to the canary branch, we've added support for embedding standard emoji in _nearly_ all cases where text is rendered by Scaleform GFx. This post details a bit of the effort that went on behind this, and where future changes may be headed.

### Where does GTA use Scaleform GFx?

You might already know the use of Scaleform GFx (hereafter, GFx) for playing back some of the built-in Flash movies that R\* created, to look more like the stock game interface. Some of you might even have been so adventurous as to use an ancient version of Flash that can generate bytecode supported by GFx v3 (v4 refactored a lot of components, including AS3 support and a new renderer, but V does not use this version) to create your own movie clips.

However, GFx also offers a functionality for drawing 'immediate-mode' text, which is used as backing API for a lot of text-related script commands (including the ever-popular BEGIN\_TEXT\_COMMAND\_DISPLAY\_TEXT, core to many servers' custom HUD draws), to allow these commands to use the same font support that actual Flash movies played in GFx have.

### On emoji

For rendering emoji in a text rendering engine, a few approaches can be used, and there have been a few [competing systems](https://medium.com/making-faces-and-other-emoji/emoji-fonts-technically-40f3fdc0869e) in the past. The 'lazy' solution would be to use a simple emoji font that uses TTF glyphs (like Microsoft's "Segoe UI Emoji") and render the black-and-white fallback glyphs into a normal SWF font. This works fine, but you don't have nice-looking emoji like that - they're just black-and-white outlines.

![](/cookbook/2019/06/ddepfi.png)

Windows uses this emoji style in a few places.

These really are hard to distinguish - the potato is already hard to recognize, but at this size, who can see the second one is a pineapple?

A simple approach to get these emoji rendered with colors would be to layer these glyphs in different colors at the same position, but of course the SWF DefineFont3 specification (which is the latest one existent - GFx defines a custom "compressed font" as well, which is even more trivial) doesn't allow more than one shape to be placed for a specific glyph, let alone specifying colors for these non-existent multiple shapes.

Now, it was thought of to simply enable HTML text formatting for _all_ text fields and immediate text draws, since Flash (and, to a limited extent, GFx) supports a HTML-like formatting system: tags like `&lt;B&gt;`, `&lt;I&gt;`, `&lt;IMG&gt;`, `&lt;FONT&gt;` and a few other basic ones are existent and usable. Especially `&lt;IMG&gt;` is interesting: this is already an approach used on the web to support emoji for systems that either do not support emoji or have an incomplete set of emoji.

However, as it later turned out, GFx' `&lt;IMG&gt;` tag did not support vector images (Flash 'sprites', which are actually an independent movie clip which can have multiple frames and recursively-placed sprites, shapes and other objects, are the closest it gets to multi-layer vector images), and looking at the GFx SDK documentation showed almost no hope as the renderer was deemed too complex to even integrate this functionality in, and more tauntingly, a header file indicated that 'sprite image' support _was_ implemented at one point.

### SVGs in Flash

First, a quick digression: we in fact were looking for a way to convert Twemoji's SVG images to SWF easily for use in this case, but most conversion software was either _even more_ outdated than Flash itself, just simply didn't work, produced incorrect results, or all of the former facts. Eventually, however, we found out that the Adobe Flex compiler had a fairly decent import functionality for SVG images, however it also added a _lot_ of arbitrary AS3 bytecode, which would have massively tripped up the GFx Flash converter/loader.

![](/cookbook/2019/06/yrhavj.png)

All those useless scripts...

However, from back when Flash was relevant, a lot of parties defined an XML representation for SWF which allowed us to quickly process the (by then 130 MB) XML file to remove all these definition tags using a standard streaming XML reader/writer, and then import the now-stripped XML data into a functionally equivalent SWF file, only containing the sprite and shape definitions we needed.

Except - as above, there was no sprite support.

### The solution in the end

Eventually, we ended up looking at the GFx SDK for the _right_ version - we'd been looking at version 4 before, and GTA uses version 3, and eventually stumbled on a much simpler renderer backend. However, sprites were still not implemented, but some leftover code was found that pointed the way towards handling sprites in text rendering, and an effort started to end up supporting creating temporary instances of sprites (parented to a dummy movie clip - as GFx expects a movie clip), and eventually drawing them inline in the text formatting renderer.

![](/cookbook/2019/06/hfjrjk.png)

An early attempt at getting formatting of a few random emoji.

Eventually, we got closer...

![](/cookbook/2019/06/pnllae.png)

... much better formatting and replacement.

... and added support for DrawTextManager and not only text fields, since for some reason GFx had nearly the same code duplicated twice...

![](/cookbook/2019/06/vtwuur.png)

vMenu, with all strings replaced for testing

... and using a few different emoji showed not all of them were square...

![](/cookbook/2019/06/grmnyc.png)

Not square.

... which eventually was fixed!

![](/cookbook/2019/06/ynqjto.png)

Aspect ratio! Spacing!

And, finally, even weird emoji combiners worked:

![](/cookbook/2019/06/rhybkp.png)

That's a SHRUG + EMOJI MODIFIER FITZPATRICK TYPE-1-2 + MALE SIGN, with a [crazy amount of combiners](https://unicode.org/emoji/charts/full-emoji-modifiers.html#1f937_1f3fb_200d_2642_fe0f) in between.

Which shows - it finally works!

### The road to shipping

At this time, there are a few issues left preventing this from being put on the production channel - HTML support 'everywhere' led to some code to escape non-HTML text input, but this also incorrectly escaped some actual text input; and we're still working on changing around some emoji alignment positions to make larger text not get layouted incorrectly just because an emoji is present in the input.

Once that's done, you'll probably be able to use emoji _everywhere_ - both in NUI, as well as in anything rendered by GFx.

As to international font support - this is a completely unrelated issue, but rest assured that we are planning on adding more scripts to the built-in font libraries - however, we can't easily (or at all) implement certain so-called 'complex scripts' like Arabic, since a) GFx has no support for these, at all and b) implementing a script processor for these is a project by itself, and not something that can be easily done by people without years upon years of experience in Unicode script processing.

---

*Original discussion thread: [https://forum.fivem.net/t/our-work-on-supporting-emoji-in-scaleform-gfx/571817](https://forum.fivem.net/t/our-work-on-supporting-emoji-in-scaleform-gfx/571817)*
