---
title: Resource manifest
weight: 505
---

The **resource manifest** is a file named `fxmanifest.lua` (or previously, `__resource.lua`), placed in a [resource folder](/docs/scripting-manual/introduction/introduction-to-resources) on the server.

It is a Lua file, ran in a separate runtime from any Lua scripts in the resource, set up with a semi-declarative syntax to be used for defining metadata.

Example
-------

An example resource manifest for a hypothetical resource looks as follows:

{{%  code file="/static/examples/manifest/fxmanifest.lua" language="lua"  %}}

Internally, this creates the following metadata entries:

-   **fx_version**: {{%  rmv2  %}}
-   **game**: gta5
-   **game**: rdr3
-   **author**: John Doe \<j.doe@example.com\>
-   **description**: Example resource
-   **version**: 1.0.0
-   **client_script**: client.lua
-   **client_script**: client_two.lua (note the `s` table being expanded)
-   **server_script**: server.lua
-   **my_data**: one
-   **my_data**: three
-   **my_data**: nine
-   **my_data_extra**: `{"two":42}` (as JSON)
-   **my_data_extra**: `{"four":69}`
-   **my_data_extra**: `{"ninety":"nein"}`
-   **pizza_topping**: pineapple

You can also obtain this metadata from scripts using [GetNumResourceMetadata]({{% native "GET_NUM_RESOURCE_METADATA" %}}) and [GetResourceMetadata]({{% native "GET_RESOURCE_METADATA" %}}).

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

A list of built-in resource manifest entries follows. A resource can also contain custom metadata entries, which can be useful for script.

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

Defines a global function to be exported by a client script for Lua/JS. In Lua, this will export `_G[exportName]` as `exportName`.

Instead of using this, try using the `exports('name', ..)` or `Exports.Add` functions.

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

Sets the resource's [NUI]({{%  ref "/docs/scripting-manual/nui-development/full-screen-nui.md"  %}}) page to the defined file or URL. If specifying a file, the file (along with its dependencies) has to be referenced using [files](#file "wikilink").

```lua
ui_page 'html/index.html'
file 'html/index.html'
```

```lua
-- this also supports absolute URLs
ui_page 'https://ui-frontend.cfx.example.com/b20210501/index.html'
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

### loadscreen_manual_shutdown

Replacement for unsupported `SET_MANUAL_SHUTDOWN_LOADING_SCREEN_NUI` native.

```lua
loadscreen_manual_shutdown 'yes'
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

dependencies {
    'myresource-base',
    'utility-resource'
}
```

#### Runtime constraints
The `dependency` field can also be used to specify requirements for the resource to run, such as a minimum server version,
a server policy value, or a game build. These are specified using the following syntax:

```lua
dependencies {
    '/server:4500',                -- requires at least server build 4500
    '/policy:subdir_file_mapping', -- requires the server key to have 'subdir_file_mapping' granted
    '/onesync',                    -- requires state awareness to be enabled
    '/gameBuild:h4',               -- requires at least game build 2189
    '/native:0xE27C97A0',          -- requires native 0xE27C97A0 to be supported
}
```

The valid constraint types are as follows:

|   Type    |                     Requirement                     |                      Values                      |
| --------- | --------------------------------------------------- | ------------------------------------------------ |
| server    | A minimum server version (build >= [arg])           | Any number.                                      |
| policy    | A specific policy being granted.                    | subdir_file_mapping ('clothing support'), others |
| onesync   | State awareness not being disabled.                 | No value.                                        |
| gameBuild | Game build being set to at least this build.        | The same values as sv_enforceGameBuild.          |
| native    | The specified native being supported on the server. | Any server-side native hash.                     |


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

### use_experimental_fxv2_oal

This will enable the usage of OAL (One Argument List) for Lua. This aims to correct return-types of natives and provide better performance via faster native calls.

```lua
use_experimental_fxv2_oal "yes"
```

{{% alert color="warning" %}}
This feature is still experimental and **requires** [Lua 5.4](#lua54) to be used.
{{% /alert %}}

#### Vector unpacking

Vector unpacking does not work when using OAL, this means that you will have to manually unpack coordinates instead of providing the `vector3`.

```lua
local coords = vector3(1, 2, 3)

SetEntityCoords(ped, coords) -- would normally work, but NOT with OAL
SetEntityCoords(ped, coords.x, coords.y, coords.z) -- works both with OAL, and without
```

#### Downsides

OALs main downside is that it cannot be used if the parameter type is wrong, as internally it will be converted to whatever the underlying type is.

This means that for natives that are undocumented or don't have the right types OAL will break in unexpected ways, or likely just not working at all.

### clr_disable_task_scheduler

When present, disables the custom C# task scheduler on the server. This will increase compatibility with third-party libraries using the .NET TPL, but make it more likely you'll have to `await Delay(0);` to end up back on the main thread.

This is already enabled by default if using `fx_version` of `bodacious` or higher.

```lua
clr_disable_task_scheduler 'yes'
```

### convar_category

When present adds the specified convars to the 'Project Settings' page in FxDK.

#### Convar types:

`CV_STRING`: Normal text input.
`title, convar_name, "CV_STRING", default`

`CV_BOOL`: True / False input in the form of a checkbox.
`title, convar_name, "CV_BOOL", default[, "label"]`

`CV_INT`: Manual number input with optional minimum and maximum.
`title, convar_name, "CV_INT", default[, min, max]`

`CV_SLIDER`: Slider number input.
`title, convar_name, "CV_SLIDER", default, min, max`

`CV_COMBI`: Number input with slider and manual input.
`title, convar_name, "CV_COMBI", default, min, max`

`CV_PASSWORD`: Masked text input.
`title, convar_name, "CV_SLIDER", default`

`CV_MULTI`: A drop-down selection menu, the first entry in Items is the default value.
`title, convar_name, "CV_MULTI", items[{name, value}]`

If your convars are replicated (`setr`) you will need to prepend `$` to the convar name:
`{ "foo", "$my_convar", "CV_STRING", "bar" }`

If your convars are server info (`sets`) you will need to prepend `#` to the convar name:
`{ "Discord", "#my_convar", "CV_STRING", "discord.gg/fivem" }`

Example:
```lua
convar_category 'MySQL' {
    "GHMattiMySQL Configuration Options",
    {
        { "Connection String", "mysql_connection_string", "CV_STRING", "" },
        { "Debug Mode", "mysql_debug", "CV_MULTI", {
            { "None", "None" },
            { "Console", "Console" },
            { "File", "File"},
            { "FileAndConsole", "FileAndConsole" }
        }},
        { "Slow Query Warning", "mysql_slow_query_warning", "CV_COMBI", 100, 0, 5000 },
        { "Log Level", "mysql_log_level", "CV_INT", 15, 1, 15 },
        { "Log File Format", "mysql_log_file_format", "CV_STRING", "%s-%d.log" },
    }
}
```

## FXv2 versions

The resource manifest has to specify a particular FXv2 version for the resource to adhere to. A list of version names and features they are associated with is shown on this page.

Each manifest version includes all features from manifest versions above, except where they would overrule one another, in which case the latest version is used.

### FX version `cerulean` (2020-05)

-   Loads NUI resources in a 'secure context' to support WASM and fetch APIs, but requires callbacks to be changed to `https://` instead of `http://`.

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
