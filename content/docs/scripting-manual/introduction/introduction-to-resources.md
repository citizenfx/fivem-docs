---
title: Introduction to resources
weight: 411
---

Servers run on a collection of resources. A **resource** is a collection of files - such as client scripts, server
scripts, and streaming assets - that can be started, stopped and restarted at any time.

Resource directories
--------------------

In the server, resources are loaded from a folder called `resources/` in the server data directory. Any folder in
the `resources/` folder is parsed as a resource, except folders between `[brackets]` which are categories, which can
contain multiple resource folders.

Each resource folder also has to contain a [resource manifest reference][manifest-reference] called `fxmanifest.lua` (or previously, `__resource.lua`) to
be correctly parsed as a resource.

See this example directory tree:

```
server
└── resources
    ├── [category]
    │   ├── [another]
    │   │   └── thing
    │   │       └── fxmanifest.lua
    │   └── resource-1
    │       └── fxmanifest.lua
    └── main
        └── fxmanifest.lua
```

In this tree, the following resources exist:

-   main
-   resource-1
-   thing

The resource manifest
---------------------

Every resource is required to contain a resource manifest by the name of `fxmanifest.lua` defining what files/scripts
are used by the resource. A quick example manifest follows:

{{%  code file="/static/examples/manifest/fxmanifest.lua" language="lua"  %}}

See the [resource manifest reference][manifest-reference] for more details.

Standard resources
------------------

After you've installed your server, you'll notice you already have quite a few resources. These are the standard
resources that FiveM ships and maintains. It's advised to not change them unless you know what you're doing. Many of
these resources provide useful functionality to your server.

More information about the standard resources can be found in the [resource catalog][resource-catalog].

[manifest-reference]: /docs/scripting-reference/resource-manifest/resource-manifest/
[resource-catalog]: /docs/resources
