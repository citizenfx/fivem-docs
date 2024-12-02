---
title: Citizen.Trace
---


Syntax
------

```lua
Citizen.Trace(message)
```

Outputs the passed message to any trace listeners, including the console output and the log file. Does not add a newline
by itself, therefore suffix a message with `"\n"`.

Examples
--------

This example will print "Hello, World!".

```lua
Citizen.Trace("Hello, World!\n")
```

<!--
is this function even exclusive to lua? and where is it defined?
alias: RconPrint
-->
