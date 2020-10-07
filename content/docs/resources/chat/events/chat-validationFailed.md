---
title: chat:validationFailed
---

## About
Sender validation cross-checks the received message author with the 
`source`'s player name. If the author mismatches the `source` name,
the message get's dropped and this event is being triggered on the server.

To enable sender validation, the convar `chat_senderValidation` 
must be set to `"true"`.

## Name
```
chat:validationFailed
```

Parameters
----------

```
int senderId
string author
string message
```

Examples
--------

This example sends a chat message to a player locally from a client script (only the executing client will see it).

##### Lua Example:
```lua
AddEventHandler('chat:validationFailed', function(src, author, message)
    print("Player " .. GetPlayerName(src) .. " has tried to send a message as author " .. author)
end)
```

##### C\# Example:
```csharp
EventHandlers["chat:validationFailed"] += new Action<int, string, string>((src, author, message) => {
    Debug.WriteLine($"Player {Players[src].Name} has tried to send a message as author {author}");
});
```

##### JavaScript Example:
```javascript
on('chat:validationFailed',(src, author, message) => {
    console.log("Player", GetPlayerName(src), "has tried to send a message as author", author)
});
```
