---
title: "[ANCIENT INFO] Two new experimental OneSync variables"
date: 2019-08-12T22:00:55.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **August 12, 2019**. Newer information may exist.
{{< /alert >}}

> Update (2022): Note that this post is _very_ old. Both settings are enabled by default with any server builds as of early 2020, for more variables you can check the [docs](https://docs.fivem.net/docs/server-manual/server-commands/#configuration-variables). It should also be noted that the default settings will usually be correct as well. If you're experiencing any issues, you may be hitting a bug or other environment issue and you should ask rather than 'try random things'.

Old post follows
----------------

In the latest Windows server release (1504 or higher), two experimental variables have been added to help troubleshooting problematic behavior and offer a 'workaround' for common problems.

### `onesync_distanceCullVehicles true`

This console variable (set it in your config, or in the console at runtime) will lead to player-occupied vehicles _also_ being subject to distance culling - that is, they won't exist if a player is more than _n_ units away from the entity.

Enabling the variable might help with game performance (FPS), and should help with bandwidth concerns as well as 'texture loss'/'city bug' streaming issues caused by loading larger amounts of custom addon player vehicles than usual.

Cons are that player-occupied vehicles will not be known to client scripts unless another player is nearby enough. This might affect 'teleport into player's vehicle' scripts, for instance.

### `onesync_forceMigration true`

This one forces any entity which has not received any clone sync updates for over _x_ seconds to be migrated to any other nearby player. While it doesn't fix the underlying cause for 'ghost vehicle/ped' migration failures, it should make them less painful and not require kicking the alleged owner anymore.

There should not be too many cons, but it's disabled by default lest it crash players when it's triggered, or worse.

---

*Original discussion thread: [https://forum.fivem.net/t/two-new-experimental-onesync-variables/713827](https://forum.fivem.net/t/two-new-experimental-onesync-variables/713827)*
