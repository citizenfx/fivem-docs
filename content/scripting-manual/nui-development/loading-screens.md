---
title: Loading screens
weight: 444
---

A special NUI frame is the frame called `loadingScreen`, which is shown during loading of FiveM, instead of the default
client-side loading screen or the game loading screen, after joining into a server.

It is specified similarly to `ui_page` using `loadscreen` in the [resource manifest][resource-manifest]:

```lua
loadscreen 'load.html'

file 'load.html'
```


```lua
loadscreen 'https://my-server.example.com/loadscreen/'
```

## Lifetime
By default, the loading screen will show until {{<native_link "SHUTDOWN_LOADING_SCREEN">}} is called. However, you can also
manually control exit lifetime by setting the `loadscreen_manual_shutdown 'yes'` directive in your resource manifest.

When doing so, the following natives become available once scripts start (after game load and connection to network):

<!-- #GAMETODO: maybe some sort of comms during load screen would be neat? or correlation to server state? -->

* {{<native_link "SEND_LOADING_SCREEN_MESSAGE">}}
* {{<native_link "SHUTDOWN_LOADING_SCREEN_NUI">}}

This can be used to, say, add a custom fade-out effect from the loading screen to an in-game view, or integrate NUI events
with early-game spawn selection UI.

[resource-manifest]: /scripting-reference/resource-manifest/resource-manifest