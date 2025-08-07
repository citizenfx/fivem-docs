---
title: Server issues
weight: 840
---

## Server not showing in server list or marked as private

This issue is usually caused by **bad port forwarding** or **firewall configuration problems**. Ensure that your network setup is correct and confirm that others can connect to your server using **Direct Connect**.

### Direct Connect Test

To check whether others can connect directly:

1. Press **F8** in FiveM to open the game client console.
2. Enter the command: `connect IP:Port`<br/>Replace `IP:Port` with your server's actual IP and port, e.g.: `connect 127.0.0.1:30120`.
3. Press **Enter** to attempt the connection.

If a direct connection fails, the issue is likely related to incorrect port forwarding or a firewall blocking connections.

### Comment Out `sv_master1`

Check your `server.cfg` for the following line:

```yaml
#sv_master1 ""
```

If the `#` is **missing**, your server might appear as **private** in the server list. This will disable the connect button for users trying to join through the server browser.

**To fix this**, ensure the line is commented out.

If this line is missing, you don't have to add it, as it is disabled by default.

1. Make sure your server is running
2. In your browser, go to `http://ip:port/info.json` (fill in your ip and port) - example `http://127.0.0.1:30120/info.json`
3. Check whether it resolves, showing information about your server

Ensure your server is running and accessible externally.

1. In your browser, visit:  
   ```
   http://ip:port/info.json
   ```
   Replace `ip:port` with your server's public IP and port number, e.g.:
   ```
   http://127.0.0.1:30120/info.json
   ```
2. This page should return a JSON object containing your server's info.

Replace `127.0.0.1` with your server's external (public) IP address to ensure it is reachable from outside the local network.

Alternatively, you can use a port checking service:

1. Visit [canyouseeme.org](http://canyouseeme.org)
2. Enter your server's port (default port: **30120**)
3. Click **Check Port**

If the port is open, the site will confirm visibility from the outside.

### Verify Required Server Variables

If your server is reachable but still does not appear in the server list, confirm that the following variables are set in `server.cfg`:

```yaml
# Set your server's Project Name
sets sv_projectName "My FXServer Project"

# Set your server's Project Description
sets sv_projectDesc "Default FXServer requiring configuration"
```

If **either** variable is missing, the server will display an error upon startup and may not appear on the list.

### Additional Troubleshooting

- It can take **up to 8 minutes** for a server to appear in the list after launch if no other heartbeats are sent.
- There may be an issue with the server listing service itself. Be patient - chances are our team is already working on it.
- If you're behind a **NAT or gateway** that **masks UDP source ports**, your server may not show up. Consult your firewall/router documentation or check [pfSense’s guide][pfsensenat] for resolving this.

## Other Related Issues

### My Server Can Only Use 48 Slots

Using more than 48 slots requires a [Cfx.re Element Club Argentum 💿](https://portal.cfx.re/subscriptions) subscription or higher.

To raise the maximum player cap:

1. Use the latest [server artifact][setting-up-server].
2. Set `sv_maxclients` to a value higher than 48 (based on your [subscription tier](https://portal.cfx.re/subscriptions)).
3. Restart your server.

### My Server's Name Doesn't Have Colors

Possible reasons:

1. No active [Element Club subscription](https://portal.cfx.re/subscriptions) with at least **Argentum** tier.
2. Incorrect [server name formatting][chat-formatting].
3. Configuration changes weren’t saved or server wasn’t restarted.

### Troubleshooting Slow Server Startups

**Microsoft Defender Antivirus** may slow down server startup by scanning FXServer files on Windows servers.

To resolve:

1. Press **Start** or hit the **Windows key**.
2. Type `PowerShell` into the search bar.
3. Right-click on **Windows PowerShell** in the search results.
4. Click **Run as administrator**.
5. If prompted by **User Account Control (UAC)**, click **Yes** to confirm.
6. Run this command (replace `C:\FXServer\` with your actual path):

```powershell
Add-MpPreference -ExclusionPath 'C:\FXServer\'
```

For more details on the `Add-MpPreference` command, refer to the [official documentation][add-mp-preference-docs].

Note that adding resources to your server increases the startup time.
If you experience unusually long startup times, check the server console for errors or warning messages.

### Help! I Can't Find My Issue Here!

We're happy to help.

- Post on our [forums][forum]
- Join our [Discord][discord]
- Visit our [support section][support-cfx-platform-server]

[forum]: https://forum.cfx.re/
[discord]: https://discord.gg/fivem
[pfsensenat]: https://docs.netgate.com/pfsense/en/latest/nat/outbound.html#static-port
[chat-formatting]: https://forum.cfx.re/t/67641
[setting-up-server]: /docs/server-manual/setting-up-a-server
[support-cfx-platform-server]: https://support.cfx.re/hc/en-us/sections/8856844172188-Cfx-re-Platform-Server-FXServer
[add-mp-preference-docs]: https://learn.microsoft.com/en-us/powershell/module/defender/add-mppreference