---
title: fireEvent
weight: 551
---

This native is a server side native which requires [OneSync](https://forum.cfx.re/t/the-onesync-eap-and-you/165931) enabled to run it. It gets triggered when a fire is created.

Parameters
----------

```
int v1, bool v2, int v3, bool v4, int v5X, int v5Y, int v5Z, int posX, int posY, int posZ, int v7, bool v8, int maxChildren, int v10, int v11, bool v12, int v13, int fireId
```

- **v1**: Unknown.
- **v2**: Unknown.
- **v3**: Unknown.
- **v4**: Unknown.
- **v5X**: X component of an unknown vector.
- **v5Y**: Y component of an unknown vector.
- **v5Z**: Z component of an unknown vector.
- **posX**: X component of the fire's position.
- **posY**: Y component of the fire's position.
- **posZ**: Z component of the fire's position.
- **v7**: Unknown.
- **v8**: Unknown.
- **maxChildren**: Maximum amount of children fires allowed to be created by this fire.
- **v10**: Unknown.
- **v11**: Unknown.
- **v12**: Unknown.
- **v13**: Unknown
- **fireId**: Fire Id.

Examples
--------
This example prints the fire id and maximum children of each fire created.

##### Lua Example:
```lua
AddEventHandler("fireEvent", function(player, content)
    for i, list in ipairs(content) do
        for j, fire in ipairs(list) do
            print("Fire of id " .. tostring(fire.fireId) .. " created with a maximum of " .. tostring(fire.maxChildren) .. " children")
        end
    end
end)
```

##### C# Example:
```cs
EventHandlers["fireEvent"] += new Action<int, dynamic>(OnFireEvent);

private void OnFireEvent(int player, dynamic content)
{
    foreach (dynamic list in content)
    {
        foreach (dynamic fire in list)
        {
            Debug.WriteLine($"Fire of id {fire.fireId} created with a maximum of {fire.maxChildren} children");
        }
    }
}
```