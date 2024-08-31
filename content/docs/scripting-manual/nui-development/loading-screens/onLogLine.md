---
title: onLogLine
toc_hide: true
---

Triggered to log the initialization of resources.

Event Data
----------

This is the `data` provided to the message event:

```ts
interface EventData {
    eventName: 'onLogLine',
    message: string,
}
```

- **eventName**: The event name.
- **message**: The log message.

Examples
--------
```html
<!-- loading screen bar -->
<p id="log"></p>

<script type="text/javascript">
window.addEventListener('message', (event) => {
    // ensure that we are handling the onLogLine event
    if (event.data.eventName !== 'onLogLine') return;

    // use the event's data to fill up the log line
    document.getElementById('log').innerText = event.data.message;
});
</script>
```
