---
title: Using modified scenario files on FiveM
date: 2021-04-13T22:52:34.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **April 13, 2021**. Newer information may exist.
{{< /alert >}}

> Update: see [TayMcKenzieNZ's post on the forums](https://forum.cfx.re/t/streaming-overriding-scenario-ymt/136666/74?u=d-bubble) for additional information and hints.

A [forum post](https://forum.cfx.re/t/streaming-overriding-scenario-ymt/136666/27?u=deterministic_bubble) has been written detailing how to use modified scenarios on FiveM servers. The gist of the post is as follows:

However, what _should_ work is registering a replacement scenario point manifest:

1.  take sp\_manifest.#mt from update:/%platform%/levels/gta5/ **from 1604 if you use it! if you use the 2189 one on 1604 you'll crash with ERR\_STR\_PACK\_2 as island scenarios don't exist!**, ~~(contents of, as XML)~~ UPDATE: this file will break some stuff if used as XML verbatim and there's "hash\_" in there. use CodeWalker's 'save' option to save an edited file as PSO instead.
2.  specify it as data file:

    ```lua
    file 'sp_manifest.ymt'
    -- SCENARIO_POINTS_FILE may work, too
    data_file 'SCENARIO_POINTS_OVERRIDE_FILE' 'sp_manifest.ymt'
    ```

3.  edit it:

    ```xml
    <Item type="CScenarioPointRegionDef">
      <Name>compcache:/test_ymt/countryside_ne</Name> <!-- apparently VFSRagePackfile doesn't support RSC registration, so we use `compcache` instead of `resources` here -->
      <AABB>
       <min x="577.9417" y="-2190.842" z="1.645161" />
       <max x="2970.658" y="6642.504" z="355.7393" />
      </AABB>
    </Item>
    ```

4.  make sure `file 'countryside_ne.ymt'` is in your resource's stream/ folder
5.  yay!
