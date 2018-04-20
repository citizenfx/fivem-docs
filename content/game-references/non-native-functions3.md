---
title: "Non-Native Functions (Client)"
---

Here is a list of some of the functions that you can use specifically in **client** side lua scripts. This list does not contain [shared non-native functions]({{< ref "game-references/non-native-functions.md" >}}). These functions are **not** documented in the [FiveM Native Reference List](https://runtime.fivem.net/doc/reference.html).

- **`TriggerServerEvent(eventName, ...)`**

Triggers the `eventName` event on the server, and passes on `...` arguments.

- **`RegisterNetEvent(eventName)`**

Marks the event safe for network use. Aka, allows you to trigger the `eventName` event on the client, from a server side script.
Use `AddEventHandler()` to listen for the event after registering it.