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
