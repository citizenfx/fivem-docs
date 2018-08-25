---
title: Introduction to resources
---

A **resource** is a collection of files - such as client scripts, server scripts, and streaming assets - that can be started, stopped and restarted at any time.

Resource directories
--------------------

In the server, resources are loaded from a folder called `resources/` in the server data directory. Any folder in the `resources/` folder is parsed as a resource, except folders between `[brackets]` which are categories, which can contain multiple resource folders. Each resource folder also has to contain a [resource manifest](/scripting-reference/resource-manifest/) called `__resource.lua` to be parsed as a resource.

See this example tree:

```
server
└── resources
    ├── [category]
    │   ├── [another]
    │   │   └── thing
    │   │       └── __resource.lua
    │   └── resource-1
    │       └── __resource.lua
    └── main
        └── __resource.lua
```

In this tree, the following resources exist:

-   main
-   resource-1
-   thing

The resource manifest
---------------------

Every resource is required to contain a resource manifest by the name of `__resource.lua` defining what files/scripts are used by the resource. A quick example manifest follows:

{{< code file="/static/examples/manifest/__resource.lua" language="lua" >}}
