---
title: Optimizing resource downloads using a caching proxy
date: 2019-10-29T07:29:41.000+01:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **October 29, 2019**. Newer information may exist.
{{< /alert >}}

Server builds starting at pipeline ID 1679 added the ability to configure the fileServer field used for resource downloading using a set of commands:

```
# Set the file server for the specified resource regex.
# The URL should *not* end with a slash.
fileserver_add ".*" "http://10.10.0.1/files"

# Remove the file server associated with a resource regex.
fileserver_remove ".*"

# List all registered file server patterns.
fileserver_list

# Old command, but **required** to not get corrupted cache entries.
adhesive_cdnKey "someSecurePassphrase"
```

There's currently no cache invalidation logic based on hashes (this'll need yet another server update due to the file server not ignoring query strings + a client update), so make sure to clear your proxy's cache before you modify/restart a resource.

Here's an example NGINX configuration for setting this up (but you should, for example, run this behind yet another proxy which offers HTTP/2 over TLS, or otherwise set this up properly - we're expecting the community to provide fleshed-out examples on the forums):

### default.template

```
proxy_cache_path /srv/cache levels=1:2 keys_zone=assets:48m max_size=10g ;
log_format asset '$remote_addr - [$time_local] "$request" $status $body_bytes_sent $upstream_cache_status';

server {
        listen 80;

        location /files/ {
                access_log /dev/stdout asset;
                add_header X-Cache-Status $upstream_cache_status;
                proxy_cache_lock on;
                proxy_pass $REMOTE$request_uri;
                proxy_cache assets;
                proxy_cache_valid 1y;
                proxy_cache_key $request_uri$is_args$args;
        }
}
```

### Dockerfile

```
FROM nginx:alpine
COPY default.template /etc/nginx/conf.d/default.template
CMD sh -c "envsubst \"`env | awk -F = '{printf \" \\\\$%s\", $1}'`\" < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
```

### Start command

```
docker build -t fxproxy .
docker run -d --name=fxproxy -e REMOTE=http://10.10.0.2:30120 -p 80:80 -v $PWD/cache:/srv/cache fxproxy
```

---

*Original discussion thread: [https://forum.fivem.net/t/optimizing-resource-downloads-using-a-caching-proxy/851508](https://forum.fivem.net/t/optimizing-resource-downloads-using-a-caching-proxy/851508)*
