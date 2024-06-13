---
title: Example resources
---

## About
These resources adds a variety of gamemodes. They also cover the following topics:
- Usage of [natives](https://docs.fivem.net/natives/)
- Use of [events](/docs/scripting-reference/events/)
- Use of [spawn manager](/docs/resources/spawnmanager/)
- [State bags](/docs/scripting-manual/networking/state-bags/)

## ctf-gamemode
A game mode that involves capturing an objective by taking it from point A to B.
### Events
#### Client
- [`SendClientHudNotification`](./events/ctf-gamemode/SendClientHudNotification)
#### Server
- [`playerJoining`](./events/ctf-gamemode/playerJoining)
- [`requestTeamData`](./events/ctf-gamemode/requestTeamData)
- [`sendTeamDataToClient`](./events/ctf-gamemode/sendTeamDataToClient)
- [`assignPlayerTeam`](./events/ctf-gamemode/assignPlayerTeam)

## tdm-gamemode
A simple team death match game mode where players are put in teams and are allowed to compete against each other.
### Events
#### Client
- [`SendClientHudNotification`](./events/tdm-gamemode/SendClientHudNotification)
#### Server
- [`tdm:onPlayerKilled`](./events/tdm-gamemode/onPlayerKilled)
