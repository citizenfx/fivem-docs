---
title: Working with events
weight: 430
---

Events are used by resources to execute code based on certain events. Events can have (optional) parameters that will be
passed on to the event handler function when the event is triggered.

A resource can trigger and listen for existing events, or create new events and trigger or listen for those events as
well. This is the same for both server events and client events.

Client events can only be listened for on a client script, but they can be triggered from a client and server side
script. Server events can only be listened for on a server side script, but they can be triggered from a client script
and a server side script.

- [Listening for events](/docs/scripting-manual/working-with-events/listening-for-events)
- [Triggering events](/docs/scripting-manual/working-with-events/triggering-events)

<!-- TODO
- [Using events](/docs/scripting-manual/working-with-events/using-events)
- [Creating new events](/docs/scripting-manual/working-with-event/creating-new-events)
- [Server-client communication](/docs/scripting-manual/working-with-event/server-client-communication)
-->
