---
title: Convars
weight: 570
---

Convars can be very powerful for defining configuration variables on the server. A convar is basically a configuration variable that you can _set_ and _get_ from any resource. You don't have to use a resource to get or set these values, you can also use commands in the (server) console or through a RCON client.

There are a couple of different convar types, we'll cover all of them on this page.

## Standard convars
The most common of them all is just the 'standard' convar type. 

#### Using commands
You can set such convar by executing the following command:

```yaml
set convar_name convar_value
```

If you want to set the value to a string that contains spaces, you can surround the _`convar_value`_ argument with quotation marks, like this: 

```yaml
set convar_name "This is a convar value that contains spaces!"
```

To _get_ the value, simply type the convar name into the console, the value will then be printed to the console and will look something like this:

```
cfx> convar_name
 "convar_name" is "This is a convar value that contains spaces!"
 default: ""
 type: string
```

If the convar has not been setup yet, typing `convar_name` into the console will return the following message:

```
No such command convar_name.
```

#### Using resources
You can also set and get convars using CFX API Set natives.

To set a basic convar value, you can either run `ExecuteCommand()` with the command from the section above as the argument, this will require that the resource has the `command.set` ace (permission) allowed.

Alternatively you can use the CFX API Set natives to set and get the values of convars. To set a value, use the following function, this example uses Lua, but it will work the same way in JS or C# resources:
```lua
SetConvar("convar_name", "This is a convar value that contains spaces!")
```

To _get_ the convar value after it has been set, use the following function:
```lua
local convarValue = GetConvar("convar_name", "Default convar value.")
```

As you might have spotted already, you will need to provide a default value. This is because if the convar has not been set yet, the default value that you provided will be returned by the GetConvar value.

If you are _sure_ that a convar will only contain an integer value, you may also use `GetConvarInt("convar_name", 0)` in a similar way of the `GetConvar()` function mentioned above. The second parameter being the default return value here as well.

**Note, standard convars can only be used in server-side scripts. They can not be obtained or set from a client script.**


## Server replicated convars
If you want your convars to be synced between server and client scripts, then you will need to make the convar server replicated. This means that the convar will be available on the client side to _get_ the value, but you will only be able to change the convar value from the server side.

### Using commands
Similar to the standard convars, you can make server replicated convars by using the following command:
```yaml
setr convar_name convar_value
```

### Using resources
Use the following function to _set_ a server replicated convar in a server script:
```lua
SetConvarReplicated("convar_name", "convar value")
```

To get the server replicated convar either from a server script or client script, use the same function that was used in the previous example:
```lua
local convarValue = GetConvar("convar_name", "Default convar value.")
```

## Server information convars
These convars will act like 'standard' convars, however their name and value will appear on the server connect details/info page, on the server list, and will be exposed in the ``http://<server_ip>:<server_port>/info.json`` server info file.

### Using commands
To set a server information convar, use the following command.
```yaml
sets convar_name "Convar value."
```

A common example for this would be to have a server information convar named "Discord", and it's value set to the discord server related to your FiveM server.
```yaml
sets Discord "Your discord link here"
```

This will look something like this on the server info page:
![](https://i.imgur.com/bBi2K43.png)

### Using resources
```lua
SetConvarServerInfo("convar_name", "Convar Value")
```


## List of convar functions

Here's a list of all CFX API set functions that you can use to get or set convars.

- {{% native_link "GET_CONVAR" %}}
- {{% native_link "GET_CONVAR_INT" %}}
- {{% native_link "SET_CONVAR" %}}
- {{% native_link "SET_CONVAR_REPLICATED" %}}
- {{% native_link "SET_CONVAR_SERVER_INFO" %}}

