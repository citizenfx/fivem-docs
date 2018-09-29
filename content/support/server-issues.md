---
title: Server issues
weight: 840
---

Could not load sessionmanager
-----------------------------

This sometimes happens when you run your server for the first time, or after you
clear the cache folder. Run `restart sessionmanager` in your server console, or
restart your server once, and you're good to go.

My server does not show up in the server list
---------------------------------------------

When this happens, make sure other people can connect to your server using
direct connect. This issue usually is a result of bad port forwarding or some
firewall issue. Make sure your network configuration is correct.

Server configuration is also important.

Your server is listed in the server list if you use the default server.cfg example.

It's possible that you have removed the `#` in front of the following line in your server.cfg.

```yaml
#sv_master1 ""
```

Please make sure to add the `#` in front of that line like shown in the example above. 

If this `#` is already added in front of the line, then try the following steps.

1. Make sure your server is running
2. Go to [canyouseeme.org](http://canyouseeme.org)
3. Fill in your port (default: 30120)
4. Check your port

**Could it see the service?**

- A server can take up to 8 minutes to be shown in the server list after initially launching, if no other heartbeats are
  sent. Please be patient.
- In very rare cases, there might be an issue with the server listing services, please be patient, chances are very high
  that our team is already hard at work trying to resolve this issue.
- You might be using a NAT/gateway that masks UDP source ports. Here's a few guides on resolving this issue for certain
  firewall applications:
  - [pfSense][pfsensenat]

**Could it NOT see your service?**

There could be a lot of different problems, most likely it has something to do with one (or both) of the following:

- Your ports aren't properly forwarded.
- You have a firewall (or AV) that blocks (external) connections.



Help! I can't find my issue here!
---------------------------------

We are more than happy to help you out!
Please post a topic on the [forums][forum] so we can take a look at your issue.
You can also join our [Discord][discord] and have a chat with us.

[forum]: https://forum.fivem.net/
[discord]: https://discord.gg/GtvkUsc
[pfsensenat]: https://www.netgate.com/docs/pfsense/nat/static-port.html