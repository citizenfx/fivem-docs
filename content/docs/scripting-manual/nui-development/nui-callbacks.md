---
title: NUI Callbacks
weight: 20
---

NUI is the way we send data to/from the User Interface (CEF) to the Game.

The data sent or received here **MUST** be JSON encodable.

Data returned in the `cb` will be sent back to the UI.

It is expected that you always return data via the callback, if you fail to do so, the request will timeout and fail causing an error to bubble up in to the calling `fetch` code in the UI.

You register NUI callbacks using {{% native_link "REGISTER_NUI_CALLBACK" %}}.

## Registering a NUI callback in Lua

```lua
RegisterNuiCallback('getItemInfo', function(data, cb)
    -- POST data gets parsed as JSON automatically
    local itemId = data.itemId

    if not itemCache[itemId] then
        cb({ error = 'No such item!' })
        return
    end

    -- and so does callback response data
    cb(itemCache[itemId])
end)
```

## Registering a NUI callback in JS

```js
RegisterNuiCallback('getItemInfo', (data, cb) => {
    // POST data gets parsed as JSON automatically
    const itemId = data.itemId;

    if (!itemCache[itemId]) {
        cb({ error: 'No such item!' });
        return;
    }

    // and so does callback response data
    cb(itemCache[itemId]);
});
```

## Registering a NUI callback in C#

```csharp
// register the event handler with manual marshaling
RegisterNuiCallback("getItemInfo", new Action<IDictionary<string, object>, CallbackDelegate>((data, cb) =>
{
    // get itemId from the object
    // alternately you could use `dynamic` and rely on the DLR
    if (!data.TryGetValue("itemId", out var itemIdObj))
    {
        cb(new
        {
            error = "Item ID not specified!"
        });

        return;
    }

    // cast away
    var itemId = (itemIdObj as string) ?? "";

    // same as above
    if (!ItemCache.TryGetValue(itemId, out Item item))
    {
        cb(new
        {
            error = "No such item!"
        });

        return;
    }

    cb(item);
}));
```

## Invoking the NUI callback

```js
// browser-side JS
fetch(`https://${GetParentResourceName()}/getItemInfo`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({
        itemId: 'my-item'
    })
}).then(resp => resp.json()).then(resp => console.log(resp));
```

To prevent requests from stalling, you **have to** return the callback at all times - even if containing just an empty
object, or `{"ok":true}`, or similar.

## NUI Callback Strict Mode

Without strict mode, a resource's NUI callbacks can be invoked from *any* other resource's NUI. If a callback exposes sensitive data or management functionality, a malicious resource could tap into it. Enabling **NUI Callback Strict Mode** ensures that only NUI belonging to the resource that registered a callback may invoke it.

Strict mode is set in the resource manifest, and its default depends on the platform:

| Platform                | Default  | To change                                         |
| ----------------------- | -------- | ------------------------------------------------- |
| FiveM for GTAV Enhanced | Enabled  | add `nui_callback_strict_mode 'false'` to opt out |
| FiveM Legacy            | Disabled | add `nui_callback_strict_mode 'true'` to opt in   |

### Blocked requests

A blocked request doesn't reject the `fetch` promise. It resolves with an unsuccessful response (`response.ok` is `false`) and an empty body, so `response.json()` throws.

- **FiveM for GTAV Enhanced:** HTTP `403` with status text `The requested NUI callback was forbidden.`; nothing is printed to the console. Check the Network tab in the NUI dev tools.
- **FiveM Legacy:** HTTP `404`, the same as a missing callback. The console shows:

  ```text
  call to 'nui_sample_provider/getItemId' from 'nui_sample_consumer' has been blocked by NUI Callback Strict Mode
  ```

### Cross-resource communication

With strict mode, a resource's NUI can no longer call another resource's callbacks directly. If your resource relies on this, move the shared logic into an [export](/docs/scripting-manual/runtimes/lua/#using-exports) in the providing resource. Then register a proxy NUI callback in the consuming resource that calls the export and passes the result back to its own NUI.

Events can be used the same way, but they're broadcast globally and any resource can listen to them, so only use them for non-sensitive data.

#### Example using exports

Convert the provider's data-processing callback into an export:

```lua
-- nui_sample_provider

-- Original NUI callback
RegisterNuiCallback('getItemId', function(data, cb)
    local resultData = data.itemId
    cb(resultData)
end)

-- Provider data as an export
exports("getItemId", function(data)
    return data.itemId
end)
```

Then register a proxy callback in the consumer resource that calls the export and returns the result to its own NUI:

```lua
-- nui_sample_consumer

-- Proxy NUI callback
RegisterNuiCallback('getItemIdProxy', function(data, cb)
    local resultData = exports.nui_sample_provider:getItemId(data)
    cb(resultData)
end)
```

#### Updating the fetch URL

Because the callback now lives inside the consumer resource, change the request's domain to the consumer resource and use the proxy callback name. For example:

`https://nui_sample_provider/getItemId` -> `https://nui_sample_consumer/getItemIdProxy`

The browser-side code that handles the response doesn't need any changes.
