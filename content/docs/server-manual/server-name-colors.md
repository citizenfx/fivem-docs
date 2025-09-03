---
title: Server Name Colors
weight: 955
description: >
  Information about colored server names.
---

You can customize your server's name by using the `sv_projectName` variable in your `server.cfg`.
This allows you to create a unique and visually appealing server name that stands out in the server list.
The `sv_hostname` variable can be used to set a colored text for the server detail page (which shows up after clicking the server in the server list).

### How to Set Up a Colored Server Name & Server Page Text

> Make sure to be subscribed to the [Element Club](https://portal.cfx.re/subscriptions/element-club) if you want to use colors in your server name or server page!

1. Open the `server.cfg` file.
2. Locate the `sv_projectName` variable.
3. Set the value of `sv_projectName` to your desired server name, including the color codes.
4. To set a colored text for the server detail page, locate the `sv_hostname` variable and change it to your liking.

### Example

```plaintext
sv_hostname "The hostname can be ^1c^2o^3l^4o^5r^6f^7u^8l"
sets sv_projectName "^1This is for the server list"
sets sv_projectDesc "Descriptions do not support colors"
```

Text for the server page (sv_hostname):

![Text for the server page](/colored-servername/serverpage_text.png)

Server name for the server list (sv_projectName):

![Server name for the server list](/colored-servername/serverlist_name.png)

### Available Color Codes

| Code | Color      | Hex       |
|------|------------|-----------|
| ^0   | White      | #FFFFF0   |
| ^1   | Red        | #F44336   |
| ^2   | Green      | #4CAF50   |
| ^3   | Yellow     | #FFEB3B   |
| ^4   | Blue       | #42A5F5   |
| ^5   | Light Blue | #03A9F4   |
| ^6   | Purple     | #9C27B0   |
| ^7   | White      | #FFFFF0   |
| ^8   | Orange     | #FF5722   |
| ^9   | Grey       | #9E9E9E   |

### Restrictions

- Color codes must be placed before the text you want to color.
- You can combine multiple color codes in the hostname (server detail page).
- You can only use a single color for the project name (server list).
- The server description does not support colors.
