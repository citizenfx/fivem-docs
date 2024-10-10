---
title: PerformHttpRequestAwait
---

This function is an synchronous wrapper around [PerformHttpRequest](/docs/scripting-reference/runtimes/lua/functions/PerformHttpRequest) which will await the data internally, preventing the need for callbacks. **It's available on server build 9515 and newer**

Syntax
------

```lua
PerformHttpRequestAwait(string url, string method = 'GET', string data = '', table headers = {}, table options = { followLocation = true })
```

### Required arguments
- **url**: A string of the URL to request.

### Optional arguments
- **method**: The HTTP method to use.
- **data**: A string of data to send with the request.
- **headers**: A table of request headers.
- **options**: A table of options
  - **followLocation**: Makes cURL [follow the redirects](https://curl.se/libcurl/c/CURLOPT_FOLLOWLOCATION.html) of the URL

Examples
--------

```lua
local errorCode, resultData, resultHeaders, errorData = PerformHttpRequestAwait("http://some-cool-url.here/some-important-document.txt")

print("Error Code: " .. errorCode)
print("Result Data: " .. resultData)
print("Result Headers: " .. resultHeaders)
print("Error Data: " .. errorData)
```
