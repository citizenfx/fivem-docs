---
title: Making a console key bind wait between commands
date: 2021-12-21T19:44:13.000+01:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **December 21, 2021**. Newer information may exist.
{{< /alert >}}

Someone recently asked in a chat room if it were possible to delay executing multiple different commands when using the `bind` command in the F8 console to make custom key binds.

This is, of course, entirely possible using a variant of the `wait` command taken from Quake:

```
# this will run 'say hello', wait 1.5 second (1500 milliseconds), and run 'e wave'
bind keyboard F11 "say hello; wait 1500; e wave"
```

---

*Original discussion thread: [https://forum.fivem.net/t/making-a-console-key-bind-wait-between-commands/4791223](https://forum.fivem.net/t/making-a-console-key-bind-wait-between-commands/4791223)*
