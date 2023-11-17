---
title: Proxy Setup
weight: 335
description: >
  A basic set of steps to configure a proxy frontend for the Cfx.re server.
---

At times, it may be desirable to have a reverse proxy in front of your Cfx.re server instance. This guide will discuss the requirements for such a setup.

## Connection process
The client->server connection process is as follows:

1. Client resolves the _connect endpoint_ from the join interaction. This can be any of the following:
   * The `connectEndPoints` field in the server listing output, which can be configured using `sv_listingHostOverride`.
   * The server address cached by the join URL subsystem, such as from history.
   * An IP, host or URL entered in a `connect` command. These get processed as follows:
     * Bare hosts/IPs: `host.example` will resolve to `http://host.example:30120/`.
     * Hosts with port: `host.example:30121` resolve to `http://host.example:30121/`.
     * URLs with scheme: `http://host.example/` and `https://host.example/` will be resolved as-is, using the default ports for HTTP and HTTPS (80/443).
2. Client retrieves general server metadata via a `GET /info.json` on the connect endpoint.
3. Client attempts an `initConnect` request to the connect endpoint's `POST /client`.
4. If server accepts client, it'll send a connection token to client.
5. Client requests `getEndpoints` on the connect endpoint, receiving one or more IP/port combos. If multiple are specified, it will pick one to use as the server endpoint.
6. Client requests `getConfiguration` on the server endpoint. This will then result in one or more requests to `GET /files/*` on either the server endpoint or a file server override.
7. Client sends a UDP info request to the server endpoint.
8. Client sends an ENet connect request, as well as a UDP handshake to the server endpoint. If accepted, the client now has an ENet peer.
9. Client starts loading the game.
10. Client potentially opens additional sideband TCP/UDP channels to the server endpoint, potentially using other protocols via the multiplex.

## Proxy types
There are two different reverse proxy types that would make sense in this system, and either can be set up independently from the other.

One is the **connect endpoint**, which can be replaced with any commodity HTTPS reverse proxy/load balancer on port `443`, leading to the actual server's TCP port. The other is the **server endpoint**, which needs a raw TCP/UDP proxy on matching ports leading to the actual server's TCP/UDP port.

### Connect proxy

For a connection proxy, a setup like the following could work (based on [a community guide](https://gist.github.com/nathanctech/e648f8312ad0d599fbb3a28db7e4c8f0)):

* Cloudflare set up with a domain you own, adding an entry for, say, `server1.example.com` as a proxied A/CNAME record to a machine you control.
* nginx installed on the user-controlled machine (which does not have to be the main server: it can be a budget VPS running Linux even for a Windows server), having a host entry for `server1.example.com`, as follows:
    ```
    upstream backend {
        # use the actual server IP here, or if separate, a proxy server
        server 100.64.1.2:30120;
    }

    # assuming this path exists
    proxy_cache_path /srv/cache levels=1:2 keys_zone=assets:48m max_size=20g inactive=2h;

    server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;

        server_name server1.example.com;

        # this can also be a Cloudflare origin certificate if you're using CF
        ssl_certificate /path/to/certificate.pem;
        ssl_certificate_key /path/to/privkey.pem;

        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $remote_addr;
            # required to pass auth headers correctly
            proxy_pass_request_headers on;
            # required to not make deferrals close the connection instantly
            proxy_http_version 1.1;
            proxy_pass http://backend;
        }

        # extra block for a caching proxy
        location /files/ {
            proxy_pass http://backend$request_uri;
            add_header X-Cache-Status $upstream_cache_status;
            proxy_cache_lock on;
            proxy_cache assets;
            proxy_cache_valid 1y;
            proxy_cache_key $request_uri$is_args$args;
            proxy_cache_revalidate on;
            proxy_cache_min_uses 1;
        }
    }
    ```
* The following values in your server configuration:
    ```bash
    # prevents the server list from advertising your server using its actual IP
    set sv_forceIndirectListing true

    # makes the server list backend request `https://server1.example.com/` instead of the default
    set sv_listingHostOverride "server1.example.com"

    # a space-separated list of IPv4 networks in CIDR notation to allow 'X-Real-IP'
    # from, as well as bypass the rate limiter
    set sv_proxyIPRanges "100.64.1.1/32"

    # the actual endpoint your server is hosted on, or one
    # or multiple server endpoint proxies as noted below
    set sv_endpoints "100.64.1.2:30120"

    # some guides also mention `sv_listingIpOverride`, this value is only needed if the server list backend
    # can't guess the IP to query itself, and is not provided to any front-end connection.
    #
    # this is usually the case for systems with multiple IPs, or if the server is firewalled off for all hosts except
    # a server proxy.
    ```
* If wanting to set up a caching proxy too, the following would be helpful as well:
    ```bash
    # obfuscates files with a global key, instead of a per-client key
    set adhesive_cdnKey "yourSecret"

    # adds a file server for 'all' resources
    fileserver_add ".*" "https://server1.example.com/files"
    ```

A working setup of this example would have the following URLs accessible correctly in the browser:
- https://server1.example.com/info.json
- https://server1.example.com/players.json
- https://server1.example.com/dynamic.json
- https://server1.example.com/client (should show '/client is POST only')

Note that, at this time, `connect` command usage has to use `connect "https://server1.example.com/"` or a join URL, it will not attempt to look up a bare domain as a URL.

### Server proxy

If you also wish to proxy the raw TCP/UDP endpoints, the Nginx 'stream' module can be used as follows (this is not valid in a typical `sites-enabled` file, it has to be directly in a `conf.d` or `nginx.conf`):

```
stream {
    upstream backend {
        server 100.64.1.2:30120;
    }
    server {
		listen 30120;
		proxy_pass backend;
	}
	server {
		listen 30120 udp reuseport;
		proxy_pass backend;
	}
}
```

When setting this up, also configure `sv_endpoints` appropriately.

## Advanced setups
This setup can have a few variations as well:

* One could add the load balancer to a Kubernetes cluster as a proper ingress.
* If specifying a proper `location` block (e.g. a regular expression), the domain could be shared with, say, a web site.
* Implementing a custom handler for `/client` initConnect requests and delegating a successful connection to the actual backend server's `initConnect` sequence. This could be used for a server picker or some other creative things.
