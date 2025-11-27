---
title: Using the new console key bindings
date: 2020-01-06T18:57:22.000+01:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **January 06, 2020**. Newer information may exist.
{{< /alert >}}

You're able to define keyboard bindings in a new way, as originally detailed in the 2018 design document "[Configuration &amp; Input - Redesigned](https://forum.cfx.re/t/configuration-input-redesigned/99532)".

Here's a sample snippet of a simple 'hands up' binding:

```lua
local handsUp = false

CreateThread(function()
    while true do
        Wait(0)

        if handsUp then
            TaskHandsUp(PlayerPedId(), 250, PlayerPedId(), -1, true)
        end
    end
end)

RegisterCommand('+handsup', function()
    handsUp = true
end, false)

RegisterCommand('-handsup', function()
    handsUp = false
end, false)

RegisterKeyMapping('+handsup', 'Hands Up', 'keyboard', 'i')
RegisterKeyMapping('say hi', 'Say hi', 'keyboard', 'o')
```

![](https://i.cfx.re/rage/fwuiComplexObjectDirectImpl/Contains/1836.png)

User-editable bindings.

These bindings will be editable by the user in the 'key bindings' option (only 1 binding per command yet, no secondary binding), and depending on user demand we'll add a helper for computing the right hashes to use with ~INPUT\_~-style display as well for help hints and similar.

In addition to that, a plethora of new console commands are added to the client F8 console, an example is below:

```
// bind a key to toggle the safe zone to an offscreen size and back
bind KEYBOARD F3 "+vstr hideHud showHud"
seta "hideHud" "profile_safezoneSize 500"
seta "showHud" "profile_safezoneSize 7"

// list all bindings
bind

// bind for a specific resource (similar to RegisterKeyMapping)
rbind runcode keyboard o "say hi"

// unbind
unbind keyboard f3

// set the volume way above the usual max
profile_sfxVolume 50

// ear rape?
profile_sfxVolume 9000

// toggle a variable
toggle strmem

// toggle a variable between two values
toggle con_miniConChannels * minicon:*

// see cmdlist to view all new and existing variables and commands
```

... and the fxd:/fivem.cfg (%appdata%\\citizenfx) file contains a lot of additional user settings now in a readable format.

---

*Original discussion thread: [https://forum.fivem.net/t/using-the-new-console-key-bindings/1467399](https://forum.fivem.net/t/using-the-new-console-key-bindings/1467399)*
