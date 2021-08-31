---
title: Direct-rendered UI
weight: 442
---

In FiveM, you can also render NUI to a runtime texture, which is called DUI for 'direct NUI'. The following natives help
with this:

* {{% native_link "CREATE_DUI" %}}
* {{% native_link "CREATE_RUNTIME_TEXTURE_FROM_DUI_HANDLE" %}}
* {{% native_link "DESTROY_DUI" %}}
* {{% native_link "GET_DUI_HANDLE" %}}
* {{% native_link "IS_DUI_AVAILABLE" %}}
* {{% native_link "SEND_DUI_MESSAGE" %}}
* {{% native_link "SEND_DUI_MOUSE_DOWN" %}}
* {{% native_link "SEND_DUI_MOUSE_MOVE" %}}
* {{% native_link "SEND_DUI_MOUSE_UP" %}}
* {{% native_link "SEND_DUI_MOUSE_WHEEL" %}}
* {{% native_link "SET_DUI_URL" %}}

The native documentation contains information for each of these, but here are some creative use cases for this:

* Rendering in 2D space using {{% native_link "DRAW_SPRITE" %}}
* Rendering to a game render target object using similar natives.
* Rendering arbitrarily in world space using a specialized Scaleform, like in this 
  [forum topic](https://forum.cfx.re/t/131208).

This can be used to make cinema screens, asynchronous in-game hint overlays, etc. fairly trivially.