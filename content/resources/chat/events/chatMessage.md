---
title: chatMessage
---

## About
This event is available both in the client and in the server.  
In the client this event is **deprecated**! Use [chat:addMessage](../chat-addMessage) instead.  
Triggering this event in the client allows you to send a chat message to this client.  
Listening for this event in the server allows you to read/log/reply the message.  

## Name
```
chatMessage
```

Parameters
----------

##### Client side:
```
string author, array color, string text
```
- **author**: The name of the player that sent the message.
- **color**: The color array. Color syntax: `{255, 255, 255} ( {r, g, b} )`
- **text**: The message

##### Server side:
```
source, string author, string text
```
- **source**: The source of the chat message
- **author**: The name of the player that sent the message.
- **text**: The message


Examples
--------

##### Server-side JS Example:
```javascript
onNet('chatMessage', (src, author, text)=>{
    // Log the message
    let ts = new Date().toLocaleString();
    console.log(`[${ts}] ${author}: ${text}`);

    //Check for '/ping' and reply with 'Pong!'
    if(src && text.startsWith('/ping')){
        setImmediate(()=>{
            emitNet('chat:addMessage', src, {
                color: [255, 20, 147],
                args: ["Server", "Pong!"]
            });
        })
    }
})
```
**Note:** We are using `setImmediate()` otherwise the reply (`Pong!`) will show up in the chat before the command (`/ping`).
