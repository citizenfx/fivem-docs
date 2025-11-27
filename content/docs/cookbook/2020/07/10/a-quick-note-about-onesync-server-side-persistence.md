---
title: A quick note about OneSync server-side persistence
date: 2020-07-10T13:03:49.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **July 10, 2020**. Newer information may exist.
{{< /alert >}}

Starting at server build 2689 (unless backed out in a later build), when using OneSync, there's a few differences regarding entity lifetime compared to before.

*   Entities that **are** owned by a script (not marked as no-longer-needed, or re-assigned as mission entity) will now be able to be in an 'unowned' state in which the _server_ is the owner of the entity. This happens when no player is having the entity in scope (as in - the entity is out of range of any player), and this state ends when it goes in scope for a player.
*   Script ownership is now correctly synced across the board. No longer does the owning script ID vanish when an entity migrates or is recreated. **This should fix a lot of cases of mission entities getting deleted anyway.**
*   **Faraway entities are no longer controlled by their original owner.** This means that _any_ entity that would be out of scope will be culled and migrated/disowned. It might lead to a small number of script compatibility issues, but in return a lot of cases of unenterable vehicles (because the owner is too far and doesn't know you) especially with Infinity/Beyond modes should be fixed.
*   Entities that **aren't** owned by a script get reassigned and, when impossible, **culled** when out of scope. This is a difference from the old behavior where this was up to the game behavior of the owning client. Typically, the owning client would have cleaned up **non-script entities** early anyway, so this should not be a significant difference.

In addition to these changes, a number of improvements to 'entity RPC' are planned to allow for more robust server-side entity creation/initial configuration of entities by taking advantage of this 'unowned entity' state, resolving a large number of issues with current server-side CREATE\_VEHICLE/... calls.

---

*Original discussion thread: [https://forum.fivem.net/t/a-quick-note-about-onesync-server-side-persistence/1421860](https://forum.fivem.net/t/a-quick-note-about-onesync-server-side-persistence/1421860)*
