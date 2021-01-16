---
title: Client events
weight: 541
layout: single
---

**A list of client side events you can use in your scripts.**

Core events
-----------
These events are part of FiveM and do not require any resource.

{{% events "client" %}}

spawnmanager events
-------------------
These events are part of the [spawnmanager](/docs/resources/spawnmanager) resource.

- [playerSpawned](/docs/resources/spawnmanager/events/playerSpawned)

mapmanager events
-----------------
These events are part of the [mapmanager](/docs/resources/mapmanager) resource.

- [onClientMapStart](/docs/resources/mapmanager/events/onClientMapStart)
- [onClientGameTypeStart](/docs/resources/mapmanager/events/onClientGameTypeStart)
- [onClientMapStop](/docs/resources/mapmanager/events/onClientMapStop)
- [onClientGameTypeStop](/docs/resources/mapmanager/events/onClientGameTypeStop)
- [getMapDirectives](/docs/resources/mapmanager/events/getMapDirectives)

baseevents events
-----------------
These events are part of the [baseevents](/docs/resources/baseevents) resource.

- [onPlayerDied](/docs/resources/baseevents/events/onPlayerDied)
- [onPlayerKilled](/docs/resources/baseevents/events/onPlayerKilled)

sessionmanager events
---------------------
These events are part of the [sessionmanager](/docs/resources/sessionmanager) resource.

- [playerActivated](/docs/resources/sessionmanager/events/playerActivated)
- [sessionInitialized](/docs/resources/sessionmanager/events/sessionInitialized)

chat events
-----------
These events are part of the [chat](/docs/resources/chat) resource.

- [chatMessage](/docs/resources/chat/events/chatMessage)
- [chat:addMessage](/docs/resources/chat/events/chat-addMessage)
- [chat:addTemplate](/docs/resources/chat/events/chat-addTemplate)
- [chat:addSuggestion](/docs/resources/chat/events/chat-addSuggestion)
- [chat:removeSuggestion](/docs/resources/chat/events/chat-removeSuggestion)
- [chat:clear](/docs/resources/chat/events/chat-clear)
