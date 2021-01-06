---
title: rconCommand
weight: 553
---

Parameters
----------

{{% alert color="warning" %}}
This event is deprecated. Please use {{% native_link "REGISTER_COMMAND" %}} instead, and use the `restricted` flag.
{{% /alert %}}

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
