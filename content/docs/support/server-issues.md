---
title: Server issues
weight: 840
---

My server does not show up in the server list
---------------------------------------------

When this happens, make sure other people can connect to your server using
direct connect. This issue usually is a result of bad port forwarding or some
firewall issue. Make sure your network configuration is correct.

Server configuration is also important. Your server is listed in the server list if you use the [default server.cfg example][servercfg]. It's possible that you have removed the `#` in front of the following line in your server.cfg.

```yaml
#sv_master1 ""
```

Please make sure to add the `#` in front of that line like shown in the example above. If this `#` is already added in front of the line, then try the following steps.

#### Check if server is reachable

1. Make sure your server is running
2. In your browser, go to http://ip:port/info.json (fill in your ip and port) - example http://127.0.0.1:30120/info.json
3. Check whether it resolves, showing information about your server

Alternatively, use [canyouseeme.org](http://canyouseeme.org). Only works if you're on a Windows server or a Linux machine with a GUI.

1. In your browser, visit [canyouseeme.org](http://canyouseeme.org)
2. Fill in your server port (default: 30120)
3. Check your port

##### Could it see the service?

- A server can take up to 8 minutes to be shown in the server list after initially launching, if no other heartbeats are
  sent. Please be patient.
- In very rare cases, there might be an issue with the server listing services, please be patient, chances are very high
  that our team is already hard at work trying to resolve this issue.
- You might be using a NAT/gateway that masks UDP source ports. Here's a few guides on resolving this issue for certain
  firewall applications:
  - [pfSense][pfsensenat]

##### Could it NOT see your service?

There could be a lot of different problems, most likely it has something to do with one (or both) of the following:

- Your ports aren't properly forwarded.
- You have a firewall (or AV) that blocks (external) connections.

My server can't use 64, 128, or more than 32 slots
---------------------------------

Using more than 32 slots requires OneSync. The maximum slot count supported with OneSync is 128 slots. OneSync was publicly released in April 2018 as early access and made available for everyone in June 2019. However, the support of 32+ slots did not leave early access, yet. Hence, you still require an active FiveM Element Club Argentum (or higher) Patreon pledge tier or be part of the manually granted OneSync EAP.

To use more than 32 slots follow these steps.

1. Use a license key with OneSync access
2. Use the latest [server artifact][setting-up-server]
2. Activate OneSync - add `onesync_enabled 1` to your server.cfg
3. Set `sv_maxclients` in your server.cfg to a value higher than 32
4. Restart your server

If you are not seeing the changes in the server list, be patient until the server list updates. You will see the changes already in Direct Connect.

My server's name doesn't have colors
---------------------------------

You may be experiencing this in different cases. For example, the server colors show in Direct Connect, but not on the server list. Or it doesn't show at all. There are a couple of reasons why this may happen.

1. No active [Patreon][patreon] pledge with the requirement minimum tier - FiveM Element Club Argentum 💿 or higher
2. Incorrect usage of [server name formatting][chat-formatting]
3. Didn't save and/or restart server
4. Server list cache hasn't updated, be patient

Help! I can't find my issue here!
---------------------------------

We are more than happy to help you out!
Please post a topic on the [forums][forum] so we can take a look at your issue.
You can also join our [Discord][discord] and have a chat with us.

[patreon]: https://patreon.com/fivem
[forum]: https://forum.cfx.re/
[discord]: https://discord.gg/fivem
[pfsensenat]: https://www.netgate.com/docs/pfsense/nat/static-port.html
[servercfg]: /docs/server-manual/setting-up-a-server/#a-name-servercfgexample-a-server-cfg
[chat-formatting]: https://forum.cfx.re/t/67641
[setting-up-server]: /docs/server-manual/setting-up-a-server