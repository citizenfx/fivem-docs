---
title: Server issues
weight: 840
---

My server does not show up in the server list, or it shows up as "private"
---------------------------------------------

When this happens, make sure other people can connect to your server using
direct connect. This issue usually is a result of bad port forwarding or some
firewall issue. Make sure your network configuration is correct.

Server configuration is also important. Your server is listed in the server list if you use the [default server.cfg example][servercfg]. It's possible that you have removed the `#` in front of the following line in your server.cfg, doing so will make your server show up as private and users won't be able to join it by using the server browser (the connect button will be disabled), but they will still be able to see your server.

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

If the server still doesn't show up on the list, make sure the following vars are set (they should be, assuming you used the [default server.cfg example][servercfg]):

- `sv_projectName`
- `sv_projectDesc`

```yaml
# Set your server's Project Name
sets sv_projectName "My FXServer Project"

# Set your server's Project Description
sets sv_projectDesc "Default FXServer requiring configuration"
```

The server will display an error upon startup if they aren't set.

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

My server can only use 48 slots.
---------------------------------

Using more than 48 slots requires __at least__ `Cfx.re Element Club Argentum 💿`. The maximum slot count supported with OneSync is 2048 slots with `Cfx.re Element Club Platinum 🌟`.

To use more than 48 slots follow these steps.

1. Use a license key with OneSync access
2. Use the latest [server artifact][setting-up-server]
3. Activate OneSync - add `set onesync on` to your server.cfg
4. Set `sv_maxclients` in your server.cfg to a value higher than 48 (Depending on your [Element Club subscription](https://portal.cfx.re/subscriptions) tier)
5. Restart your server

To subscribe to Element Club, visit the subscriptions page on the [Cfx.re Portal](https://portal.cfx.re/subscriptions)

If you are not seeing the changes in the server list, be patient until the server list updates. You will see the changes already in Direct Connect.

Please note that [txAdmin](/docs/resources/txAdmin/) can handle onesync activation by the panel directly.

My server's name doesn't have colors
---------------------------------

You may be experiencing this in different cases. For example, the server colors show in Direct Connect, but not on the server list. Or it doesn't show at all. There are a couple of reasons why this may happen.

1. No active [Element Club subscription](https://portal.cfx.re/subscriptions) with the requirement minimum tier - FiveM Element Club Argentum 💿 or higher
2. Incorrect usage of [server name formatting][chat-formatting]
3. Didn't save and/or restart server
4. Server list cache hasn't updated, be patient

Troubleshooting Slow Server Startups on Windows
---------------------------------

On Windows, Microsoft Defender Antivirus can slow down server startups by scanning files within your FXServer directory. To mitigate this issue, you can add your server folder to the exclusion list. 

Launch PowerShell as an administrator and execute the following command, replacing `'C:\FXServer\'` with the actual path to your FXServer directory:

```
Add-MpPreference -ExclusionPath 'C:\FXServer\'
```

For more details on the `Add-MpPreference` command, refer to the [official documentation][add-mp-preference-docs].

Help! I can't find my issue here!
---------------------------------

We are more than happy to help you out!

For support, please check out our [support section][support-cfx-platform-server] for helpful resources. If you'd like to discuss your issue further, feel free to post a topic on our [forums][forum], and we'll be happy to take a look.

Additionally, you can join our [Discord][discord] community and have a chat with us.

[forum]: https://forum.cfx.re/
[discord]: https://discord.gg/fivem
[pfsensenat]: https://docs.netgate.com/pfsense/en/latest/nat/outbound.html#static-port
[servercfg]: /docs/server-manual/setting-up-a-server-vanilla/#servercfg
[chat-formatting]: https://forum.cfx.re/t/67641
[setting-up-server]: /docs/server-manual/setting-up-a-server
[support-cfx-platform-server]: https://support.cfx.re/hc/en-us/sections/8856844172188-Cfx-re-Platform-Server-FXServer
[add-mp-preference-docs]: https://learn.microsoft.com/en-us/powershell/module/defender/add-mppreference
