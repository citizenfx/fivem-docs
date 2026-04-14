---
title: Static IPs
weight: 1004
description: >
  This guide explains how https://static.cfx.re/ips.txt is used
---

## What is `ips.txt`?

Cfx.re infrastructure uses a set of IP addresses to communicate with game servers. These IPs are used to poll servers for data (such as player counts) that is displayed on the server browser.

The full list of IP addresses currently in use is published at [https://static.cfx.re/ips.txt](https://static.cfx.re/ips.txt). If your server has a strict firewall or DDoS protection, you **must** allow traffic from all IPs listed in this file.

## How updates work

From time to time, new IP addresses are added to `ips.txt`. The update process follows a predictable rollout:

1. **New IPs are added** to `ips.txt`.
2. **A grace period of at least one month** passes before any traffic is sent from the new addresses.
3. **Traffic begins** originating from the new IPs after the grace period.

This gives server owners enough time to update their firewall rules before the new IPs go live. We recommend checking the file periodically or automating the process of syncing your firewall allow-list with its contents.

## "Could not contact the server browser" error

If your server logs show an error indicating it could not contact the FiveM server browser, it means your server is unable to communicate with Cfx.re infrastructure. An occasional occurrence is usually harmless, but if it happens **continuously**, your server will stop appearing in the server browser.

### Resolving the issue

1. **Restart your Server** — this can resolve transient networking issues.
2. **Verify port forwarding and firewall rules** — make sure the required ports are forwarded correctly and not blocked by your firewall.
3. **Allow all Cfx.re IP addresses** — if you use DDoS protection, custom firewall rules, or any resources/anti-cheat options that whitelist Cfx IP addresses, update them to include **all** addresses listed at [https://static.cfx.re/ips.txt](https://static.cfx.re/ips.txt).
4. **Localhost servers** — if you are running a local development server, add the following to your server configuration:
   ```cfg
   sv_master1 ""
   ```
