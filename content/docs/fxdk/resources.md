---
title: Resources
weight: 910
---

Resources in FxDK are no different from normal resources, you can put all your good old resources right into FxDK project, enable them and they'll work the same.

Like any other asset in FxDK you can enable/disable resources, enabled resources won't be loaded and won't participate in project builds.


## Current limitations

### No player identifiers
In FxDK environment you don't have access to player identifiers, **yet**, see this GitHub issue for more information: https://github.com/citizenfx/fivem/issues/865.

Until it gets implemented, please use `sv_fxdkMode` convar to tweak your code so it can distinguish if player identifiers available. It will be set to integer `1` when running in FxDK.

Use it like this:
```lua
local fxdkMode = GetConvarInt('sv_fxdkMode', 0) == 1
```

Just as with {{% native_link "GET_PLAYER_IDENTIFIER" %}} and {{% native_link "GET_NUM_PLAYER_IDENTIFIERS" %}} this check can only be performed in server-side code.


## Autorestart on change

One key feature of FxDK is that changing files that are part of resource will restart them automatically on the fly so you'll see changes taking effect almost immediately and completely automatically, no more Alt+Tab to server, F8, `> restart my_resource`.

This feature can be toggled on/off as well, in project explorer you'll notice this `A` letter next to resource - this is an indicator for autorestart, green if enabled, white if not, clicking on it will toggle state as well as from context menu.


## Convars

Resource can declaratively tell FxDK what [convars](/docs/scripting-reference/convars/) it is able to consume, they'll appear in project settings under `Variables` section with matching UI for each convar kind.

Definitions take place in `fxmanifest.lua` of resource, you can specify as many categories as you need:

```lua
convar_category 'Category title' {
    'Category description',
    {
        {'Convar title', 'my_resource_convar', 'CV_BOOL', true},
        {'Fill color, red component', 'my_resource_color_r', 'CV_INT', 100, 0, 255},
        {'Fill color, green component', 'my_resource_color_g', 'CV_SLIDER', 10, 0, 255},
        {'Fill color, blue component', 'my_resource_color_b', 'CV_COMBI', 150, 0, 255},
        {'Convar title', 'my_resource_text', 'CV_STRING', 'I am the text, I am the vengeance'},
        {'Convar title', 'my_resource_pwd', 'CV_PASSWORD', '123456'},

        {'Informational convar', '#my_resource_info', 'CV_STRING', 'hi there'},

        {'Replicated convar', '$my_resource_info', 'CV_STRING', 'hi there'}
    }
}
```

General schema for `convar_category` entry:
```lua
convar_category 'Category name' {
    'Category description', -- required entry, so don't miss it
    {
        ... -- convar entries
    }
}
```

General schema for convar entry:
```lua
{
 -- Only visible in project settings UI
    'Convar title',

 -- Convar name to use when calling convar natives
 -- prepend name with # for `information`
 -- or $ for `replicated`
 --
 -- It is important that you namespace your convar names
 -- this will help eliminating convar conflicts with other resources
    'convar_name',

 -- Default value, depends on convar kind
    value,

 -- CV_INT, CV_SLIDER, CV_COMBI accept optional min and max values
    min, -- optional
    max, -- optional
}
```


### Types

Convar of any kind can be of 3 types:

 - [`Server only`](/docs/scripting-reference/convars/#standard-convars)
 - [`Information`](/docs/scripting-reference/convars/#server-information-convars) - name starts with `#` symbol, `#my_resource_info` convar from example above.
 - [`Replicated`](/docs/scripting-reference/convars/#server-replicated-convars) - name starts with `$` symbol, `$my_resource_repl` convar from example above.


### Kinds

#### `CV_BOOL`: `boolean`
Renders checkbox UI control.

In code use {{% native_link "GET_CONVAR" %}} native to read the value.

**Despite it's name, actual value will be `'true'` or `'false'` strings.**

#### `CV_INT`: `integer`
Renders number input UI control.

In code use {{% native_link "GET_CONVAR_INT" %}} native to read the value.

#### `CV_SLIDER`: `integer`
Same as `CV_INT`, but adds slider UI control, value can only be changed with slider UI control.

#### `CV_COMBI`: `integer`
Same as `CV_SLIDER`, but value can be changed both via slider and input UI controls.

#### `CV_STRING`: `string`
Render string input UI control.

In code use {{% native_link "GET_CONVAR" %}} native to read the value.

#### `CV_PASSWORD`: `string`
Same as `CV_STRING`, but value will be hidden behind dots in UI.

**It's worth nothing to mention that if this is an actual secret, this should not be of replicated or information convar type.**

#### `CV_MULTI`: `string`
Renders select UI control.

In code use {{% native_link "GET_CONVAR" %}} native to read the value.

**Default value** of such convar entry is an array of possible value string, where actual default value is the first array item.

For example, consider such definition:
```lua
convar_category 'Test' {
    'Description',
    {
        {'Jacket color', '#my_resource_jacket_color', 'CV_MULTI', {
            'brown',
            'red',
            'white',
            'rebeccapurple'
        }}
    }
}
```

In UI you'll be able select one of these colors.

### Watch and build commands
If your resource needs to be built before server can consume it, i.e. for TypeScript or C# resources, you can instruct FxDK to run build tools for you.

As for convars, this takes place in `fxmanifest.lua` of resource:
```lua
fxdk_watch_command 'command', { ...arguments }
fxdk_build_command 'command', { ...arguments }
```

#### Watch
These commands will be started by FxDK if resource is enabled **and** autorestart is enabled.

For example, you have TS resource, you're using Yarn and there's `watch` script entry in your `package.json`, then you let FxDK know of this:
```lua
fxdk_watch_command 'yarn' { 'watch' }
```

This is basically equivalent of how'd run it from terminal:
```
$ yarn watch
```

Do note that in terminal you split arguments with space, while here you split them in separate strings in arguments array.

Let's take a look at C# resource example, that was generated with C# template:
```lua
fxdk_watch_command 'dotnet' {'watch', '--project', 'Client/my-resource.Client.csproj', 'publish', '--configuration', 'Release'}
```

In terminal it'd look like this:
```
$ dotnet watch --project Client/my-resource.Client.csproj publish --configuration Release
```

#### Build
Build commands are the same as watch ones, except that they'll run only when building project, so if resource requires building, make sure to add matching build command in addition to watch command.


## Resource building

By default, when [building project](/docs/fxdk/project-building), FxDK will run build commands (if any), copy whole resource content to respective resource folder in project build folder, this means that even source file will be copied over there.

You can limit what exactly gets copied in the `.fxdkignore` file in resource root. It behaves the same way as `.gitignore` files and pretty much follows it's syntax. However, for a now, this file will be taken into account only in resource root, having it in any subfolder won't have any effect.
