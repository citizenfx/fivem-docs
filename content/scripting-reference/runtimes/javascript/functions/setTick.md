---
title: setTick
---

This allows you to create a timer that ticks every game frame / server tick. It can be used client-side or server-side acting like a loop that runs forever unless [cleared][clearTick].

Syntax
------

```ts
setTick(() => {});
```

Examples
--------
```ts
setTick(() => {
    console.log("I'm running every frame/tick!");
});
```

[clearTick]: /docs/scripting-reference/runtimes/javascript/functions/clearTick