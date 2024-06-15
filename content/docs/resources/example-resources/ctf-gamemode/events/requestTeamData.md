---
title: requestTeamData
---

Name
----------
```
requestTeamData
```

Parameters
----------

None

Description
----------

This is triggered by the client via [TriggerServerEvent](/docs/scripting-reference/runtimes/lua/functions/TriggerServerEvent/). It's used to call another event that sends the team data to the client. We trigger a local event (registered on the server) named [sendTeamDataToClient](./sendTeamDataToClient).
