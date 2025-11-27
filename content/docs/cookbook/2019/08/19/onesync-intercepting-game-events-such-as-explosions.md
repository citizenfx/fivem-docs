---
title: "OneSync: intercepting game events (such as explosions)"
date: 2019-08-19T18:32:58.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **August 19, 2019**. Newer information may exist.
{{< /alert >}}

The latest version of the server (1543+) added support for parsing and preventing routing of game events. This currently only supports parsing `CExplosionEvent`, but this might be a fairly useful one to prevent routing of 'excessive' explosions, or explosions that are 'too close' to a player and not of the correct weapon type.

Here's an example:

```lua
-- SERVER script, requires OneSync!
AddEventHandler('explosionEvent', function(sender, ev)
    print(GetPlayerName(sender), json.encode(ev))
end)
```

This'll show JSON data similar to the following:

```json
{"explosionType":0,"isAudible":true,"posX":742.84313964844,"cameraShake":1.0,"isInvisible":true,"ownerNetId":0,"posY":-1808.2889404297,"damageScale":1.0,"posZ":33.105224609375}
```

If you want to, say, make an explosion-free zone:

```lua
AddEventHandler('explosionEvent', function(sender, ev)
    if ev.posX > 2000.0 and ev.posY > 2000.0 and ev.posX < 3000.0 and ev.posY < 3000.0 then
        CancelEvent()
    end
end)
```

This can be used in a variety of ways - rate limiting, automatic warning/kicking, disabling routing of bad explosions, etc.

---

*Original discussion thread: [https://forum.fivem.net/t/onesync-intercepting-game-events-such-as-explosions/730511](https://forum.fivem.net/t/onesync-intercepting-game-events-such-as-explosions/730511)*
