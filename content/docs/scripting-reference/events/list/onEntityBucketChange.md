---
title: onEntityBucketChange
---

Called when an entity changes routing bucket on the server.

Parameters
----------

```
int entity, int bucket, int oldBucket
```

- **entity**: The entity id that changed routing bucket.
- **bucket**: The new routing bucket the entity was moved into.
- **oldBucket**: The routing bucket the entity was previously in.

Examples
--------
This example prints the entity id, the new routing bucket, and the old routing bucket to the server console.

##### Lua Example:
```lua
AddEventHandler('onEntityBucketChange', function(entity, bucket, oldBucket)
    print('Entity ' .. entity .. ' changed routing bucket from ' .. oldBucket .. ' to ' .. bucket)
end)
```

##### C\# Example:
```csharp
// In class constructor
EventHandlers["onEntityBucketChange"] += new Action<int, int, int>(OnEntityBucketChange);

// Delegate method
private void OnEntityBucketChange(int entity, int bucket, int oldBucket)
{
    Debug.WriteLine($"Entity {entity} changed routing bucket from {oldBucket} to {bucket}.");
}
```

##### JavaScript Example:
```js
on("onEntityBucketChange", (entity, bucket, oldBucket) => {
    console.log(`Entity ${entity} changed routing bucket from ${oldBucket} to ${bucket}.`);
});
```
