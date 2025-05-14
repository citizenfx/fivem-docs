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

## Cursor/input
The loading screen will always be focused for both mouse and keyboard input, however the cursor is not shown by default
for legacy reasons.

The NUI cursor can be enabled by adding a `loadscreen_cursor` entry to the resource manifest that contains the loading screen:

```lua
loadscreen_cursor 'yes'
```

## Busy spinner
You can hide the default busy spinner in the bottom right corner of the screen by adding the following command to your `server.cfg`:

```
setr sv_showBusySpinnerOnLoadingScreen false
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

## Events
The loading screen will receive data about various events through the `message` event.
You can handle these events by setting `window.onmessage` or by using `window.addEventListener` with `'message'` as the first argument, and checking the `eventName` value inside the event's `data` field.

### Example
```html
<!-- loading screen bar -->
<progress id="loading-bar" value="0" max="1"></progress>

<script type="text/javascript">
window.addEventListener('message', (event) => {
    // ensure that we are handling the loadProgress event
    if (event.data.eventName !== 'loadProgress') return;

    // use the event's data to fill up the loading bar
    document.getElementById('loading-bar').value = event.data.loadFraction;
});
</script>
```

### Event List
- [loadProgress](../loadProgress)
- [onLogLine](../onLogLine)
- [startDataFileEntries](../startDataFileEntries)
- [onDataFileEntry](../onDataFileEntry)
- [performMapLoadFunction](../performMapLoadFunction)
- [endDataFileEntries](../endDataFileEntries)
- [startInitFunction](../startInitFunction)
- [startInitFunctionOrder](../startInitFunctionOrder)
- [initFunctionInvoking](../initFunctionInvoking)
- [initFunctionInvoked](../initFunctionInvoked)
- [endInitFunction](../endInitFunction)

[resource-manifest]: /docs/scripting-reference/resource-manifest/resource-manifest