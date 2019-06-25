---
title: rconCommand
weight: 551
---

Parameters
----------

{{% alert theme="warning" %}}This event is deprecated. Please use [REGISTER_COMMAND]({{<native "REGISTER_COMMAND">}})
instead, and use the `restricted` flag.{{% /alert %}}

```
string command, table/array arguments
```

- **command**: A string containing the command name that was executed.
- **arguments**: A list containing all arguments passed to the command.

Examples
--------

##### JavaScript Example:

```js
on('rconCommand', (command, args) => {
    console.log(`${command} called over RCON with ${args}`)
});
```
