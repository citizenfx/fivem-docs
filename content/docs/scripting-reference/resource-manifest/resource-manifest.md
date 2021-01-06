---
title: Resource manifest
weight: 505
---

The **resource manifest** is a file named `fxmanifest.lua` (or previously, `__resource.lua`), placed in a [resource folder](/docs/scripting-manual/introduction/introduction-to-resources) on the server.

It is a Lua file, ran in a separate runtime from the usual Lua scripts, using a special setup so that a semi-declarative syntax can be used for defining metadata.

Example
-------

An example resource manifest for a hypothetical resource looks as follows:

{{%  code file="/static/examples/manifest/fxmanifest.lua" language="lua"  %}}

Internally, this creates the following metadata entries:

-   **fx_version**: {{%  rmv2  %}}
-   **game**: gta5
-   **game**: rdr3
-   **client_script**: client.lua
-   **client_script**: client_two.lua
-   **client_scripts**: { client.lua, client_two.lua }
-   **server_script**: server.lua
-   **server_scripts**: { server.lua, server_two.lua }
-   **my_data**: one
-   **my_data**: three
-   **my_data**: nine
-   **my_data_extra**: `{"two":42}` (as JSON)
-   **my_data_extra**: `{"four":69}`
-   **my_data_extra**: `{"ninety":"nein"}`

Globbing
--------

Some entry types may support 'globbing' for multiple files. These take a pattern syntax as follows:

|    Example    |                    Matches                    |
| ------------- | --------------------------------------------- |
| `*.lua`       | `a.lua`, `b.lua` (non-recursively)            |
| `dir/*.dll`   | `dir/a.dll`, `b.dll` (non-recursively)        |
| `**/*.lua`    | `dir1/a.lua`, `dir2/b.lua`, `dir1/dir2/f.lua` |
| `**.lua`      | same as above                                 |
| `**/cl_*.lua` | `dir1/cl_hi.lua`, etc.                        |

Support for globbing is specified under each entry type.

Resource manifest entries
-------------------------

A list of built-in resource manifest entries follows. A resource can also contain custom metadata entries, which can be obtained using [GetNumResourceMetadata]({{% native "GET_NUM_RESOURCE_METADATA" %}}) and [GetResourceMetadata]({{% native "GET_RESOURCE_METADATA" %}}).

### fx_version

Defines the supported functionality for the resource. This has to be one of a specific set of words. Each entry inherits properties from the previous one. The current FXv2 resource version is **{{%  rmv2  %}}**.

### game

Defines the supported game API sets for the resource.

|  Name  |                                   Meaning                                    |
| ------ | ---------------------------------------------------------------------------- |
| common | Runs on any game, but can't access game-specific APIs - only CitizenFX APIs. |
| gta5   | Runs on FiveM.                                                               |
| rdr3   | Runs on RedM.                                                                |

### resource_manifest_version

{{% alert color="warning" title="Deprecated" %}}You should be using `fxmanifest.lua` and `fx_version` instead.{{% /alert %}}

Defines the supported functionality for the resource. This has to be one of a specific set of GUIDs. Each GUID inherits properties from the previous one. The current resource manifest version is **{{%  rmv  %}}**.

### client_script

{{% alert color="success" title="Note" %}}This directive supports globbing.{{% /alert %}}

Defines a script to be loaded on the client, and implicitly adds the file to the resource packfile. The extension determines which script loader will handle the file:

|  Extension   |       File handler       |                                        Meaning                                        |
| ------------ | ------------------------ | ------------------------------------------------------------------------------------- |
| **.lua**     | `citizen:scripting:lua`  | Lua source code                                                                       |
| **.net.dll** | `citizen:scripting:mono` | .NET assembly referencing [CitizenFX.Core.Client](https://nuget.org/packages/CitizenFX.Core.Client) |
| **.js**      | `citizen:scripting:v8`   | JavaScript source code (client only)                                                  |

### server_script

{{% alert color="success" title="Note" %}}This directive supports globbing. Reference [CitizenFX.Core.Server](https://nuget.org/packages/CitizenFX.Core.Server) for a .NET assembly.{{% /alert %}}

Defines a script to be loaded on the server. The extension determines which script loader will handle the file, as with [client_script](#client-script "wikilink").

### shared_script

{{% alert color="success" title="Note" %}}This directive supports globbing.{{% /alert %}}

Defines a script to be loaded on both sides, and adds the file to the resource packfile. The extension determines which script loader will handle the file, as with [client_script](#client-script "wikilink").

### export

Defines a global function to be exported by a client script. In Lua, this will export `_G[exportName]` as `exportName`. In C\#, this'll do absolutely nothing at this time.

#### Defining an export

##### Lua

```lua
exports {
    'setWidget',
    'getWidget'
}
```

```lua
local lastWidget

function setWidget(widget)
    lastWidget = widget
end

function getWidget()
    return lastWidget
end
```

#### Consuming an export

##### Lua

```lua
exports.myresource:setWidget(50)
```

##### C\#

```csharp
int widget = Exports["myresource"].getWidget();
```

</tab> </tabs>

### server_export

Defines a global function to be [exported](#export "wikilink") by a server script.

### ui_page

Sets the resource's [NUI]({{%  ref "/docs/scripting-manual/nui-development/full-screen-nui.md"  %}}) page to the defined file. This file (along with its dependencies) has to be referenced using [files](#file "wikilink").

```lua
ui_page 'html/index.html'
file 'html/index.html'
```

### before_level_meta

Loads the specified level meta in the resource before the primary level meta.

{{% alert color="warning" title="Deprecated" %}}Wherever possible you should use data files. {{% /alert %}}

### after_level_meta

Loads the specified level meta in the resource after the primary level meta.

{{% alert color="warning" title="Deprecated" %}}Wherever possible you should use data files. {{% /alert %}}

### replace_level_meta

Replaces the <abbr title="CDataFileMgr__ContentsOfDataFileXml">level meta</abbr> (usually `common:/data/levels/gta5/gta5.meta`) with the specified file in the resource. This has to be referenced using [files](#file "wikilink").

```lua
replace_level_meta 'mymap'
files {
    'mymap.meta'
}
```

### data_file

{{% alert color="success" title="Note" %}}This directive supports globbing in the filename field.{{% /alert %}}

Adds a [data file]({{%  ref "/docs/game-references/data-files.md"  %}}) of a specified type to the game extra content system.

```lua
files {
    'audio/mywaves/stupidcar.awc',
    'myvehicles.meta',
    'metas/*_handling.meta',
}

data_file 'AUDIO_WAVEPACK' 'audio/mywaves'
data_file 'VEHICLE_METADATA_FILE' 'myvehicles.meta'
data_file 'HANDLING_FILE' 'metas/*_handling.meta'
```

### this_is_a_map

Marks this resource as being a GTA map, and reloads the map storage when the resource gets loaded.

```lua
this_is_a_map 'yes' -- can be any value
```

### server_only

Marks the resource as being server-only. This stops clients from downloading anything of this resource.

```lua
server_only 'yes' -- can be any value
```

### loadscreen

Sets the HTML file specified as the game loading screen.

```lua
loadscreen 'html/loadscreen.html'
file 'html/loadscreen.html'
```

### file

Adds the specified file to the resource packfile, to be downloaded by clients upon loading the resource.

```lua
file 'main.net.dll.mdb'
```

### dependency

Requires the specified resource to load before the current resource.

```lua
dependency 'myresource-base'
```

### dependencies

Alias for [dependency](#dependency "wikilink"). This is not a typo, but rather an intentional alias specifically for pluralization.

```lua
dependencies {
    'myresource-base',
    'utility-resource'
}
```

### lua54

Enables Lua 5.4. You can read more about Lua 5.4 at http://www.lua.org/manual/5.4/manual.html

```lua
lua54 'yes'
```

### provide

Marks the current resource as a replacement for the specified resource. This means it'll start instead of the specified resource, if another resource requires it, and will act as if it is said resource if started.

```lua
provide 'mysql-async'
```

### disable_lazy_natives

{{% notice info %}}
Lazy loading of natives currently only happens in Lua.
{{% /notice %}}

By default, lazy loading of native functions is enabled to drastically reduce resource memory usage.
While not recommended, you can set this option to any value to disable lazy loading.

<!-- TODO: Link to lazy loading section in Lua runtime manual. -->

```lua
disable_lazy_natives 'yes'
```

### clr_disable_task_scheduler

When present, disables the custom C# task scheduler on the server. This will increase compatibility with third-party libraries using the .NET TPL, but make it more likely you'll have to `await Delay(0);` to end up back on the main thread.

```lua
clr_disable_task_scheduler 'yes'
```

## FXv2 versions

The resource manifest has to specify a particular FXv2 version for the resource to adhere to. A list of version names and features they are associated with is shown on this page.

Each manifest version includes all features from manifest versions above, except where they would overrule one another, in which case the latest version is used.

### FX version `cerulean` (2020-05)

-   Requires `https://` callbacks but supporting WASM and fetch.

### FX version `bodacious` (2020-02)

-   Implies `clr_disable_task_scheduler` being specified for server library compatibility.
-   Does not define `window` in JS contexts for library compatibility.

### FX version `adamant` (2019-12)

-   Equivalent to 44febabe-d386-4d18-afbe-5e627f4af937 in FXv1.
-   Requires a `game` to be specified, and is mandatory for RedM.

## Manifest versions

The resource manifest has to specify a particular version for the resource to adhere to. A list of version GUIDs and features they are associated with is shown on this page.

Each manifest version includes all features from manifest versions above, except where they would overrule one another, in which case the latest version is used.

### No manifest version

By default, no manifest version is used, which is equivalent to manifest GUID `00000000-0000-0000-0000-000000000000`. This (along with the empty GUID) will be **removed** in future releases of FXServer, and resources will be required to specify a manifest version.

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
-   {{% native_link "CREATE_VEHICLE" %}} and similar functions behave differently when passing `true, true` as network object flags.
