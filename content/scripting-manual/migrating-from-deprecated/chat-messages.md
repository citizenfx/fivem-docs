---
title: Creating chat messages
weight: 431
---

Commonly found in tutorials and older resources, the `chatMessage` event is used to create a chat message. This method is now deprecated and people are encouraged to use the `chat:addMessage` event.

## chatMessage (The deprecated method)
The old `chatMessage` event had 3 parameters (`author`[string], `color`[array] and `text`[string])

### Example
```lua
TriggerEvent("chatMessage", GetPlayerName(PlayerId()), {255, 255, 255}, "Hello, this is the message that will show in chat.")
```

## `chat:addMessage` (The recommended method)
This event has an object parameter which consists of 3 properties (`color`[array], `multiline`[boolean] and `args`[array])

### Example
```lua
TriggerEvent("chat:addMessage", {
    color = {255, 255, 255},
    multiline = true,
    args = { GetPlayerName(PlayerId()), "Hello, this is the message that will show in chat" }
})
```

For further documentation of this event, see the [`chat:addMessage` section](../../../resources/chat/events/chat-addMessage).
