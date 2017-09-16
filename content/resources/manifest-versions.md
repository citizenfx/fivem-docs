---
title: "Manifest versions"
---

The [resource manifest]({{< relref "manifest.md" >}}) has to specify a particular [version]({{< relref "manifest.md" >}}#resource-manifest-version) for the resource to adhere to. A list of version GUIDs and features they are associated with is shown on this page.

Each manifest version includes all features from manifest versions above, except where they would overrule one another, in which case the latest version is used.

No manifest
-----------

By default, no manifest version is used, which is equivalent to manifest GUID `00000000-0000-0000-0000-000000000000`. This (along with the empty GUID) will be **removed** in future releases of FXServer, and resources will be required to specify a manifest version.

Manifest versions
-----------------

### Manifest version 00000000-0000-0000-0000-000000000000 (no date)

-   The natives.lua file `natives_21e43a33.lua` will be used for client-side Lua.

### Manifest version 77731fab-63ca-442c-a67b-abc70f28dfa5 (2016-12)

-   No changes. This is the minimum operating level for FXServer.

### Manifest version f15e72ec-3972-4fe4-9c7d-afc5394ae207 (2017-04-08)

-   The natives.lua file `natives_0193d0af.lua` will be used for client-side Lua. This represents the state of NativeDB in early April of 2017.

### Manifest version 44febabe-d386-4d18-afbe-5e627f4af937 (2017-06-07)

-   The natives.lua file `natives_universal.lua` will be used for client-side Lua. This is a universal natives.lua file, which should be able to be switched to without having to change your scripts. It also represents a more recent (2017-06-05) snapshot of NativeDB.

### Manifest version 05cfa83c-a124-4cfa-a768-c24a5811d8f9 (2017-06-04)

-   Scripts will now be registered as a game network script. This is required for networking entities.
-   [CREATE\_VEHICLE](n:AF35D0D2583051B0 "wikilink") and similar functions behave differently when passing `true, true` as network object flags. See [network objects](network_objects "wikilink") for more information.
