---
title: PerformHttpRequest
---

Performs a http request using the specified parameters and returns the http response in a callback.

Syntax
------

```lua
PerformHttpRequest(string url, function callback(number statusCode, string body, table headers, string errorData), string method = 'GET', string data = '', table headers = {}, table options = { followLocation = true })
```

### Required arguments
- **url**: A string of the URL to request.
- **callback**: The callback function to call after the request is finished.

### Optional arguments
- **method**: The HTTP method to use.
- **data**: A string of data to send with the request.
- **headers**: A table of request headers.

Examples
--------

```lua
PerformHttpRequest("http://some-cool-url.here/some-important-document.txt", function (errorCode, resultData, resultHeaders, errorData)
  print("Returned error code:" .. tostring(errorCode))
  print("Returned data:" .. tostring(resultData))
  print("Returned result Headers:" .. tostring(resultHeaders))
  print("Returned error data:" .. tostring(errorData))
end)
```
