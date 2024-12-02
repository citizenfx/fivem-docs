---
title: Citizen.InvokeNative
---

## What is Citizen.InvokeNative?

`Citizen.InvokeNative` can invoke a native from a hex, It should primarily be used for undocumented natives or in situations where the provided documentation is incorrect.

### Using Native Hashes

Every native function has a unique hash, which is a numeric identifier. You can use this hash to call the native function directly with `Citizen.InvokeNative`. This is particularly useful for undocumented natives or when you encounter issues with the documented parameters.

For example:
```lua
local nativeHash = 0x8E3222B7 -- This is the hash for the native function
local health = Citizen.InvokeNative(nativeHash, PlayerPedId())
print(health) -- returns the health of the entity (https://docs.fivem.net/natives/?_0xEEF059FAD016D209)
```
In this example, `0x8E3222B7` is the hash for the native function we want to call. We pass this hash along with the required parameters to `Citizen.InvokeNative`.

### Documented Natives

For most documented native functions, you don't need to use `Citizen.InvokeNative`. Instead, you can call them directly using their provided names and parameters. This is the preferred method as it is simpler and more clear.

### Handling Incorrect Parameters

Sometimes, the documentation for a native function might have incorrect or incomplete information about the parameters it expects. In these cases, you can use `Citizen.InvokeNative` to bypass the issues and call the native function directly with the parameters you have determined to be correct.

### Using Structures and Complex Parameters

In some cases, you might need to pass complex parameters or structures. This can be done by carefully packing the parameters according to what the native function expects.

```lua
local entityHandle = PlayerPedId() -- Example: Get the handle of the player's ped
local coords = Citizen.InvokeNative(0x1647F1CB, entityHandle) -- GET_ENTITY_COORDS native
if not coords then return end -- Check if coords have been returned or it will stop the code
print("GetEntityCoords success:", coords)
```

## Best Practices

1. **Use Documented Natives**: Always prefer using documented natives directly with their provided names and parameters when possible. This makes your code more readable and maintainable. It is posssible that some natives haven't been discovered yet.

2. **Understand the Native Function**: Before using `Citizen.InvokeNative`, ensure you understand what the native function does and what parameters it requires. This will help you avoid unexpected behavior.

3. **Validate Parameters**: When passing parameters to `Citizen.InvokeNative`, validate them to ensure they meet the expected types and ranges. This helps prevent crashes and unintended side effects.

4. **Use Hashes Carefully**: When using hashes, double-check that you are using the correct one. Incorrect hashes can lead to calling the wrong functions, which might cause game instability or crashes.

5. **Debugging**: When debugging issues with `Citizen.InvokeNative`, print out the parameters and return values to understand what's happening. This can help you identify and fix problems more quickly.
