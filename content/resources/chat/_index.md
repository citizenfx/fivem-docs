---
title: chat
hidden: false
---


## About
The chat resource provides custom chat functionality for FiveM using a NUI-based interface.
It is included and maintained at the cfx-server-data repository.


## Exports
_This resource does not have any export functions._

## Events

### Client
- [chatMessage](./events/chatMessage) (deprecated, use chat:addMessage instead)
- [chat:addMessage](./events/chat-addMessage)
- [chat:addSuggestion](./events/chat-addSuggestion)
- [chat:addSuggestions](./events/chat-addSuggestions)
- [chat:removeSuggestion](./events/chat-removeSuggestion)
- [chat:addTemplate](./events/chat-addTemplate)
- [chat:clear](./events/chat-clear)

### Server
- [chatMessage](./events/chatMessage)
