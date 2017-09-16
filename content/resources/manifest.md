---
title: "Resource manifest"
date: 2017-08-15T23:07:44+02:00
draft: false
---

The **resource manifest** is a file named `__resource.lua`, placed in a [resource folder]({{<ref "/resources/#resource-directories">}}) on the server.

It is a Lua file, ran in a separate runtime from the usual Lua scripts, using a special setup so that a semi-declarative syntax can be used for defining metadata.

Example
-------

An example resource manifest for a hypothetical resource looks as follows:

{{< code file="/static/examples/manifest/__resource.lua" language="lua" >}}

Internally, this creates the following metadata entries:

-   **resource\_manifest\_version**: {{< rmv >}}
-   **client\_script**: client.lua
-   **client\_script**: client\_two.lua
-   **server\_script**: server.lua
-   **my\_data**: one
-   **my\_data**: three
-   **my\_data**: nine
-   **my\_data\_extra**: `{"two":42}` (as JSON)
-   **my\_data\_extra**: `{"four":69}`
-   **my\_data\_extra**: `{"ninety":"nein"}`

Resource manifest entries
-------------------------

A list of built-in resource manifest entries follows. A resource can also contain custom metadata entries, which can be obtained using [GetNumResourceMetadata](GetNumResourceMetadata "wikilink") and [GetResourceMetadata](GetResourceMetadata "wikilink").

### resource\_manifest\_version

Defines the supported functionality for the resource. This has to be one of a specific set of GUIDs. Each GUID inherits properties from the previous one. The current resource manifest version is **{{< rmv >}}**.

### client\_script

Defines a script to be loaded on the client, and implicitly adds the [file](#file "wikilink") to the resource packfile. The extension determines which script loader will handle the file:

|  Extension   |       File handler       |                                        Meaning                                        |
| ------------ | ------------------------ | ------------------------------------------------------------------------------------- |
| **.lua**     | `citizen:scripting:lua`  | Lua source code                                                                       |
| **.net.dll** | `citizen:scripting:mono` | .NET assembly referencing [CitizenFX.Core](https://nuget.org/packages/CitizenFX.Core) |
| **.js**      | `citizen:scripting:v8`   | JavaScript source code (client only)                                                  |

### server\_script

Defines a script to be loaded on the server. The extension determines which script loader will handle the file, as with [client\_script](#client-script "wikilink").

### export

Defines a global function to be exported by a client script. In Lua, this will export `_G[exportName]` as `exportName`. In C\#, this'll do absolutely nothing at this time.

#### Defining an export

##### Lua

``` lua
exports {
    'setWidget',
    'getWidget'
}
```

``` lua
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

``` lua
exports.myresource:setWidget(50)
```

##### C\#

``` csharp
int widget = Exports["myresource"].getWidget();
```

</tab> </tabs>

### server\_export

Defines a global function to be [exported](#export "wikilink") by a server script.

### ui\_page

Sets the resource's [NUI](NUI "wikilink") page to the defined file. This file (along with its dependencies) has to be referenced using [files](#file "wikilink").

``` lua
ui_page 'html/index.html'
file 'html/index.html'
```

### before\_level\_meta

Loads the specified level meta in the resource before the primary level meta.

{{% alert theme="warning" %}}**Deprecated**: wherever possible you should use data files. {{% /alert %}}

### after\_level\_meta

Loads the specified level meta in the resource after the primary level meta.

{{% alert theme="warning" %}}**Deprecated**: wherever possible you should use data files. {{% /alert %}}

### replace\_level\_meta

Replaces the <abbr title="CDataFileMgr__ContentsOfDataFileXml">level meta</abbr> (usually `common:/data/levels/gta5/gta5.meta`) with the specified file in the resource. This has to be referenced using [files](#file "wikilink").

``` lua
replace_level_meta 'mymap'
files {
    'mymap.meta'
}
```

### data\_file

Adds a [data file]({{< ref "/game-references/data-files.md" >}}) of a specified type to the game extra content system.

``` lua
files {
    'audio/mywaves/stupidcar.awc',
    'myvehicles.meta'
}

data_file 'AUDIO_WAVEPACK' 'audio/mywaves'
data_file 'VEHICLE_METADATA_FILE' 'myvehicles.meta'
```

### this\_is\_a\_map

Marks this resource as being a GTA map, and reloads the map storage when the resource gets loaded.

``` lua
this_is_a_map 'yes' -- can be any value
```

### loadscreen

Sets the HTML file specified as the game loading screen.

``` lua
loadscreen 'html/loadscreen.html'
file 'html/loadscreen.html'
```

### file

Adds the specified file to the resource packfile, to be downloaded by clients upon loading the resource.

``` lua
file 'main.net.dll.mdb'
```

### dependency

Requires the specified resource to load before the current resource.

``` lua
dependency 'myresource-base'
```

### dependencies

Alias for [dependency](#dependency "wikilink"). This is not a typo, but rather an intentional alias specifically for pluralization.

``` lua
dependencies {
    'myresource-base',
    'utility-resource'
}
```