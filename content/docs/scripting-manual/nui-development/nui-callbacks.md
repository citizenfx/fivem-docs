---
title: NUI callbacks
weight: 443
---

NUI can also send calls back to the game using so-called 'NUI callbacks'. These are currently only fully supported in
Lua, other languages can be used but need a bit of a [tricky workaround][workaround] as these predate function
references in codegen.

<!-- #GAMETODO: actually fix that? -->

Generally, you'll use the [RegisterNUICallback][registernuicallback] function in Lua, and the
{{% native_link "REGISTER_NUI_CALLBACK_TYPE" %}} native along with an event handler in other languages.

Both work very similarly, and we'll describe both below:

## Registering a NUI callback in Lua
```lua
RegisterNUICallback('getItemInfo', function(data, cb)
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

## Registering a NUI callback in C#/JS
```js
// JS
RegisterNuiCallbackType('getItemInfo') // register the type

// register a magic event name
on('__cfx_nui:getItemInfo', (data, cb) => {
    const itemId = data.itemId;

    if (!itemCache[itemId]) {
        cb({ error: 'No such item!' });
        return;
    }

    cb(itemCache[itemId]);
});
```

```csharp
// C#
RegisterNuiCallbackType("getItemInfo"); // register the type

// register the event handler with manual marshaling
EventHandlers["__cfx_nui:getItemInfo"] += new Action<IDictionary<string, object>, CallbackDelegate>((data, cb) =>
{
    // get itemId from the object
    // alternately you could use `dynamic` and rely on the DLR
    if (data.TryGetValue("itemId", out var itemIdObj))
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
});
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
[workaround]: https://github.com/citizenfx/fivem/blob/d911ecf638337c7c61fc6728110c92d84a217156/data/shared/citizen/scripting/lua/scheduler.lua#L958
