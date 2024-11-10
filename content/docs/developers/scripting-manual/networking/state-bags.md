---
title: State bags
weight: 427
---

In state awareness mode, entities can have an associated set of arbitrary key/value pairs associated with them known as 'state bags'.

## Use

State bags are exposed to scripting runtimes using runtime-specific APIs, which are detailed below.

### General guidelines

#### Shallow limitations
State getters and setters are naive: every get will return the full serialized state from the game, and only a _direct_ set operation will serialize the entire state back into the game.

That means you can _not_ do the following:

```lua
-- will *not* replicate
Entity(x).state.x.y = 'b'

-- slow! will deserialize `x` twice
local y = Entity(x).state.x.y
local z = Entity(x).state.x.z

-- more granular use is recommended instead
Entity(x).state['x:y'] = 'b'
```

### Lua

#### Getting state

```lua
local vehicle = GetVehiclePedIsIn(ped, false)
local state = Entity(vehicle).state
local mollis = state.mollis

print(mollis)
```

#### Setting state

```lua
-- you can only do this on the entity's owner, or the server
Entity(vehicle).state.mollis = 'vesuvius citrate'
```

#### Player state
Players also have state.

```lua
LocalPlayer.state.soviet = 'connection'
```

```lua
local bullshark = Player(source).state.testosterone
```

#### Global state
State global across the entire server, server-set, client-read.

```lua
GlobalState.moneyEnabled = true
```

#### Setting local state
By default, state set from the server _is_ replicated, and state set from clients is _not_ replicated.

This can be overridden on a case-by-case basis by using `set`:

```lua
-- on the server, we want to keep track of 'clone' being 600 only
Entity(vehicle).state:set('clone', 600, false)

-- on the client, we want to tell the server we've processed the task
Entity(enemy).state:set('taskAck', 'guard', true)
```

#### Change handlers
State bag change handlers are essentially method handlers utilized to track changes to a state bag.

Once a change is detected on either side i.e. server, its counterpart implementation (the one on the client) is called with the updated data.

An example implementation method can be found in the following native documentation [AddStateBagChangeHandler](/natives/?_0x5BA35AAF).

## Policy

Currently, the only policy limitation implemented is to filter _player_ state to be able to be written by the player and the server, _entity_ state to be written by the owning player and the server, and _global_ state to be able to be written by the server.

In the future, events and filter functionality may be added for further safeguarding of server-configured state.

<!-- other ScRTs todo -->