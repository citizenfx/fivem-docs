---
title: NUI callbacks
weight: 20
---

NUI can also send calls back to the game using NUI callbacks.

You can register NUI callbacks using the {{% native_link "REGISTER_NUI_CALLBACK" %}} native.

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

[registernuicallback]: /docs/scripting-reference/runtimes/lua/functions/RegisterNUICallback/
