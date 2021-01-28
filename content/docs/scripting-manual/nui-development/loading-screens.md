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

## Handover data
Server scripts can specify data pairs to send to the client loading screen using the `handover` function in the playerConnecting
event. This data will be passed to the loading screen in the `window.nuiHandoverData` property.

In addition to data specified by the server, a field named `serverAddress` is also added with the current IP/port used for
the client->server connection.

### Example
```lua
-- Server script
AddEventHandler('playerConnecting', function(_, _, deferrals)
    local source = source

    deferrals.handover({
        name = GetPlayerName(source)
    })
end)
```

```html
<!-- loading screen page -->
<h1 id="namePlaceholder">Welcome, <span></span></h1>

<script type="text/javascript">
window.addEventListener('DOMContentLoaded', () => {
    console.log(`You are connecting to ${window.nuiHandoverData.serverAddress}`);

    // a thing to note is the use of innerText, not innerHTML: names are user input and could contain bad HTML!
    document.querySelector('#namePlaceholder > span').innerText = window.nuiHandoverData.name;
});
</script>
```

## Lifetime
By default, the loading screen will show until {{% native_link "SHUTDOWN_LOADING_SCREEN" %}} is called. However, you can also
manually control exit lifetime by setting the `loadscreen_manual_shutdown 'yes'` directive in your resource manifest.

When doing so, the following natives become available once scripts start (after game load and connection to network):

* {{% native_link "SEND_LOADING_SCREEN_MESSAGE" %}}
* {{% native_link "SHUTDOWN_LOADING_SCREEN_NUI" %}}

This can be used to, say, add a custom fade-out effect from the loading screen to an in-game view, or integrate NUI events
with early-game spawn selection UI.

[resource-manifest]: /docs/scripting-reference/resource-manifest/resource-manifest