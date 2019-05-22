---
title: Exports
---

Use this to export functions so they can be called from other resources.\
Read more on [exports](https://docs.fivem.net/scripting-manual/runtimes/javascript/#using-exports)

## Signature

```ts
function exports(exportedName: string, fn: Function) => void
```

### Required arguments

- **exportedName**: The function name you want to export.
- **fn**: The function to execute when the export get called.

## Examples

```ts
exports("printSomething", () => {
  console.log("Something");
});
```

```ts
exports("dropPlayer", (src: string, reason: string) => {
  DropPlayer(src, reason);
});

// OR

exports("dropPlayer", DropPlayer);
```
