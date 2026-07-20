---
title: Voice
weight: 70
---

FiveM has been using the [mumble](https://www.mumble.info/) client to handle in-game voice communication for a while now, below we will explain how you can use certain mumble natives, including a couple guides to handle submixes and NativeAudio.

## Console Variables

These variables can be enabled/disabled on the client by pressing `F8` while FiveM is running.

### `voice_inBitrate [bitrate]`

Allows you to set the voice [bitrate](https://en.wikipedia.org/wiki/Bit_rate), ranges from `16000` to `128000`. Default is `48000`. The greater the bitrate, the better the audio quality.

### `voice_use2dAudio [true/false]`

Uses 2D Audio exclusively. This is set to false by default.

### `voice_use3dAudio [true/false]`

Considered deprecated on FiveM, but available on RedM.  
Uses 3D (directional) Audio exclusively. This is set to false by default.
Currently, directional audio's position is relative to the game camera, a solution is being worked on so directional audio is relative to the player's ped entity instead.

### `voice_useSendingRangeOnly [true/false]`

A convar that can be used to only hear other clients within their range. This is set to false by default.

### `voice_useNativeAudio [true/false]`

Enables the game's native audio including filter support. This should be enabled if you plan to use submixes. This is set to false by default.

## Talker Proximity

You can use {{% native_link "MUMBLE_SET_TALKER_PROXIMITY" %}} to limit distance between players when communicating via voice chat.

An example can be shown down below:

```lua
MumbleSetTalkerProximity(15.0)
```

This method ought to be called from the client in order for it to work.

It's worth noting that there's another native named {{% native_link "NETWORK_SET_TALKER_PROXIMITY" %}}, which is only available on FiveM. The aforementioned native also [calls](https://github.com/citizenfx/fivem/blob/928bd19f886d66d3f85340e65df69ae97ab91dc7/code/components/gta-net-five/src/MumbleVoice.cpp#L1343) the original game native before setting mumble's audio distance.

## Submixes

Submixes allow you to apply effects to sounds, FiveM utilizes `rage::audDriver::GetMixer` to apply these effects. These can be set to clients to alter their outgoing audio (voice).
Below is an example of a submix being initialized (with audio effects being applied):

Submix effects have hashes, for the full list of hashes, check out {{% native_link "SET_AUDIO_SUBMIX_EFFECT_PARAM_INT" %}}.

### Initializing a submix

```lua
submixId = CreateAudioSubmix('myNewSubmix') -- Creates the audio submix, if one already exists, it will be returned
if submixId ~= -1 then -- If it's not -1 it means it created the submix successfully
    SetAudioSubmixEffectRadioFx(submixId, 1) -- Add a radio FX to submix FX slot number 1
    SetAudioSubmixEffectParamInt(submixId, 1, `default`, 1)
    SetAudioSubmixEffectParamFloat(submixId, 1, `freq_low`, 300.0)
    SetAudioSubmixEffectParamFloat(submixId, 1, `freq_hi`, 7500.0)
    AddAudioSubmixOutput(submixId, 1) -- Output to submix id 1
end
```

### Assigning a submix effect to everyone

```lua
ourNewSubmixId = CreateAudioSubmix('myNewSubmix') -- Creates the audio submix, if one already exists, it will be returned
if ourNewSubmixId ~= -1 then
    SetAudioSubmixEffectRadioFx(ourNewSubmixId, 1) -- Add a radio FX to submix FX slot number 1
    SetAudioSubmixEffectParamInt(ourNewSubmixId, 1, `default`, 1)
    SetAudioSubmixEffectParamFloat(ourNewSubmixId, 1, `freq_low`, 300.0)
    SetAudioSubmixEffectParamFloat(ourNewSubmixId, 1, `freq_hi`, 6000.0)
    AddAudioSubmixOutput(ourNewSubmixId, 1) -- Output to submix id 1
end

for playerId, player in ipairs(GetActivePlayers()) do
    MumbleSetSubmixForServerId(playerId, ourNewSubmixId) -- Assign using the submix id that got created (ourNewSubmixId)
end
```

### Making a submix play through the left channel only

You can change how a submix plays through different channels by using {{% native_link "SET_AUDIO_SUBMIX_OUTPUT_VOLUMES" %}} as described down below.
Let's create an audio submix, and then play it through the front left channel.

```lua
ourNewSubmixId = CreateAudioSubmix('myNewSubmix') -- Creates the audio submix, if one already exists, it will be returned
if ourNewSubmixId ~= -1 then
    AddAudioSubmixOutput(ourNewSubmixId, 1) -- Output to submix id 1
end

SetAudioSubmixOutputVolumes(
    ourNewSubmixId --[[ integer ]],
    0 --[[ outputSlot ]],
    1.0 --[[ frontLeftVolume ]],
    0.0 --[[ frontRightVolume ]],
    0.0 --[[ rearLeftVolume ]],
    0.0 --[[ rearRightVolume ]],
    1.0 --[[ channel5Volume ]],
    1.0 --[[ channel6Volume ]]
)

for playerId, player in ipairs(GetActivePlayers()) do
    MumbleSetSubmixForServerId(playerId, ourNewSubmixId) -- Assign using the submix id that got created (ourNewSubmixId)
end
```

### Removing assignment of a submix for a given player

You can stop a submix from applying to a player by sending `-1` as the submix id to {{% native_link "MUMBLE_SET_SUBMIX_FOR_SERVER_ID" %}}, for example:

```lua
MumbleSetSubmixForServerId(playerId, -1)
```

## Voice channels

Voice channels can be implemented if we want to add custom functionality, for example voice radios. Below we will find some examples on how to create a permanent channel, as well as how to create temporary ones.

### Creating a permanent voice channel

You can create a permanent voice channel the following way:

```lua
MumbleCreateChannel(6743) -- Creates a channel with channel id '6743' we can then join
```

The main difference between permanent voice channels and temporary ones, is that temporary channels get automatically removed once the last client leaves the channel.

### Using voice channels to create a Radio/Walkie-Talkie System

{{% alert color="warning" %}}
This is a simple example on how to join a channel and handle clients, doing this will cause the client to leave the default 'Root' channel, thus stopping proximity chat from working, proceed at your own discretion. [pma-voice](https://github.com/AvarianKnight/pma-voice) handles this by using [voice targets](https://github.com/AvarianKnight/pma-voice/blob/8868556ed86bfa299487b2a6ec760c72486bab8e/client/init/proximity.lua#L38) and proximity checks.
{{% /alert %}}

With that warning out of the way, let's write some code. We will be dividing the logic between server and client and the server will be broadcasting any channel changes to the connected clients, for example when a user leaves a channel.

#### Writing the code (server-side)

We will first declare a global named `clientsInChannel`, we will be using this table (array in other languages) to let the server know that we will have multiple clients connected to different channels. Each client can connect to one channel at a time.

A single channel, for example `clientsInChannel[911]` could look like the following `{1, 2, 3, 4}`, which indicates that the channel has four clients connected.

```lua
clientsInChannel = {} -- Will be used to define a list of clients per channel
```

`broadcastVoiceChange` will be used to communicate to clients that someone left a voice channel and resync them respectively.

```lua
function broadcastVoiceChange(source, channelIdx, state)
    -- source is the client that changed channels, broadcasting to other clients
    -- Let any other clients in this channel know that we changed
    -- Also send the list of clients, passed as the second argument at onPlayerChangeVoiceChannels
    -- to assign their volume and targets
    for _, clientInChannel in pairs(clientsInChannel[channelIdx]) do
        TriggerClientEvent('onPlayerChangeVoiceChannels', clientInChannel, clientsInChannel[channelIdx], channelIdx, state)
    end
end
```

We will use the `playerDropped` event to handle server disconnections and remove the user from a channel when needed

```lua
AddEventHandler('playerDropped', function (reason)
    leaveAnyOldChannels(source)
end)
```

This method will loop through all existing channels on the server and will find the matching player in one of the given channels, once found, the player index will be removed from the channel.

```lua
function leaveAnyOldChannels(source)
    for channelIdx, channel in pairs(clientsInChannel) do
        for clientKey, clientInChannel in pairs(channel) do
            if clientInChannel == source then
                removeClientFromChannel(source, clientKey, channelIdx)
            end
        end
    end
end
```

This will first broadcast who left to any connected channel clients and will then remove the given client from the table (`clientsInChannel[channelIdx]`) by its given key (`clientKey`).
```lua
function removeClientFromChannel(source, clientKey, channelIdx)
    broadcastVoiceChange(source, channelIdx, 'left')
    table.remove(clientsInChannel[channelIdx], clientKey)
end
```

This is where the magic happens, or at least it does, initially though! We will be using this command to leave any old channels (if we're already connected to any) and connect to a channel. We will then broadcast that change to any clients in the channel we joined.

```lua
RegisterCommand("joinchannel", function(source, args, rawCommand)
    local channelIdx = tonumber(args[1])
    -- Create the channel if it doesn't exist
    if not clientsInChannel[channelIdx] then
        clientsInChannel[channelIdx] = {}
    end

    leaveAnyOldChannels(source)

    -- Join the channel
    table.insert(clientsInChannel[channelIdx], source)
    broadcastVoiceChange(source, channelIdx, 'joined')
end, false)
```

#### Writing the code (client-side)

We will first register an event named `onPlayerChangeVoiceChannels`, we will be using this event to iterate through the list of clients we previously mentioned (which the server is sending us) and set their volume. We will also be setting our voice channel through here by calling {{% native_link "MUMBLE_SET_VOICE_CHANNEL" %}}.

```lua
RegisterNetEvent("onPlayerChangeVoiceChannels", function(clients, channel, state)
    -- Join the channel
    if state == 'joined' then
        MumbleSetVoiceChannel(channel)
    end

    -- Go through the list of clients we received from the given channel
    for _, client in pairs(clients) do
        -- We only want to know about other clients
        if client ~= GetPlayerServerId(PlayerId()) then
            Citizen.Trace(string.format('Syncing client: %d to channel (%s)\n', client, state))
        end

        -- Go through the states
        if state == 'joined' then
            MumbleSetVolumeOverrideByServerId(client, 1.0)
        elseif state == 'left' then
            if client ~= GetPlayerServerId(PlayerId()) then -- No point in handling this for ourselves
                MumbleSetVolumeOverrideByServerId(client, -1.0) -- Reset their volume levels back to normal
            end
        end
    end
end)
```

And that's it, we can now join and leave channels.

### Listening to channels

We can listen to channels by using the following native: {{% native_link "MUMBLE_ADD_VOICE_CHANNEL_LISTEN" %}}. The native allows us to 'spectate' any channel we want. We can find an example client implementation down below.

```lua
RegisterCommand("listenchannel", function(source, args, rawCommand)
    MumbleAddVoiceChannelListen(tonumber(args[1]))
end, false)
```

In order to remove ourselves as a listener, we can use {{% native_link "MUMBLE_REMOVE_VOICE_CHANNEL_LISTEN" %}}.

## FiveM for GTAV Enhanced

{{% alert theme="primary" %}}
The following information is for **FiveM for GTAV Enhanced**.
{{% /alert %}}

FiveM for GTAV Enhanced ships with a new voice implementation that replaces Mumble. The Mumble natives shown above are still implemented and route through the new system, but they are **deprecated** and will be removed in a future version. New scripts should use the natives documented below.

The new voice stack provides:

- Better voice quality under poor network conditions
- Noise cancellation
- Echo cancellation
- Graceful packet-loss handling

### Enabling the voice server

#### Internal voice server

Add the following to your `server.cfg`:

```cfg
voice_internal
```

#### External voice server

{{% alert color="warning" title="Experimental" %}}
The external voice server feature is very experimental.
{{% /alert %}}

An external voice server offloads voice processing to a separate FXServer instance. The game server synchronizes channel state (creations, deletions, and other changes) to the voice server automatically.

**Voice server `server.cfg`:**

```cfg
sv_licenseKey cfx...
voice_external_host 0.0.0.0:30123 gameServerIP:30122
```

| Parameter | Description |
| --------- | ----------- |
| First (`0.0.0.0:30123`) | Bind address of the external voice server. |
| Second (`gameServerIP:30122`) | Address of the gateway server specified in `voice_external_connect` on the game server. |

**Game server `server.cfg`:**

```cfg
voice_external_connect 0.0.0.0:30122 externalIP:30123
```

| Parameter | Description |
| --------- | ----------- |
| First (`0.0.0.0:30122`) | Starts a voice gateway server on this interface. |
| Second (`externalIP:30123`) | Address of the external voice server to connect to. |

The license key used on both the voice server and game server **must match**.

### Legacy Mumble compatibility

To keep the deprecated Mumble natives (everything documented above) working, set the following ConVar:

```cfg
setr sv_mumble true
```

{{% alert color="warning" title="Security" %}}
Enabling `sv_mumble` allows client-controlled voice channels. Any client can join any channel and listen to any conversation. Prefer migrating to the new server-side voice API.
{{% /alert %}}

#### Limitations of the compatibility layer

- `MUMBLE_CLEAR_VOICE_TARGET`, `MUMBLE_SET_VOICE_TARGET`, and any natives that accept voice targets behave as if there is only a single voice target.
- All Mumble natives are deprecated and will be removed in a future version.

#### Removed ConVars

The following ConVars from the Mumble system are **no longer available** in FiveM for GTAV Enhanced:

- `voice_use2dAudio`
- `voice_use3dAudio`
- `voice_useSendingRangeOnly`
- `voice_useNativeAudio`

`voice_inBitrate` continues to work the same as in Gen8.

### New voice API

All new voice natives are **server-side only**, which removes the security issues that came with client-controlled Mumble channels. The server fully owns channel membership, mute, and deaf state.

#### Migrating from Mumble natives

| Deprecated (client-side) | Replacement (server-side) |
| ------------------------ | ------------------------- |
| `MumbleCreateChannel(id)` | `CreateVoiceChannel(mode, maxDistance)` |
| `MumbleSetVoiceChannel(id)` (join) | `AddPlayerToVoiceChannel(channelID, clientID)` |
| Leaving a channel client-side | `RemovePlayerFromVoiceChannel(channelID, clientID)` |
| Channel cleanup (implicit) | `DeleteVoiceChannel(channelID)` |
| Client-side mute logic | `SetPlayerMutedInVoiceChannel(channelID, clientID, muted)` |
| Client-side deaf / listen logic | `SetPlayerDeafInVoiceChannel(channelID, clientID, deaf)` |

#### `CreateVoiceChannel`

```lua
int CreateVoiceChannel(int mode, float maxDistance)
```

Creates a new voice channel and returns its unique ID. Channel IDs start at `0`. When the maximum number of channels (`65535`) is reached, `65535` is returned.

When a player disconnects, they are automatically removed from all channels they were in.

##### Channel modes

| Mode | Name | Description |
| ---- | ---- | ----------- |
| `0` | Non-spatial | 2D voice channel. 2D output positioning must be controlled with the client voice API. Receiving clients are calculated based on channel membership. |
| `1` | Spatial | 3D voice channel. Clients are output in 3D automatically. Receiving clients are calculated based on proximity within `maxDistance`. |
| `2` | Custom | Requires custom streaming logic. No clients are automatically calculated. There is no API yet to feed custom streaming. |
| `3` | Temporary | Inherits all behavior from **spatial**, but the channel is automatically deleted when all players have left. |

Example (server-side):

```lua
-- A non-spatial radio channel
local radioChannel = CreateVoiceChannel(0, 0.0)

-- A 3D proximity channel that hears speakers within 15.0 units
local proximityChannel = CreateVoiceChannel(1, 15.0)
```

#### `DeleteVoiceChannel`

```lua
DeleteVoiceChannel(int channelID)
```

Deletes a channel by its unique ID. Works for both empty and non-empty channels.

```lua
DeleteVoiceChannel(radioChannel)
```

#### `AddPlayerToVoiceChannel`

```lua
AddPlayerToVoiceChannel(int channelID, int clientID)
```

Adds a client to a voice channel. Adding a client that is already in the channel **resets** their `muted` and `deaf` states.

```lua
RegisterCommand('joinradio', function(source)
    AddPlayerToVoiceChannel(radioChannel, source)
end, true)
```

#### `RemovePlayerFromVoiceChannel`

```lua
RemovePlayerFromVoiceChannel(int channelID, int clientID)
```

Removes a client from a voice channel. If the client is not in the channel, nothing happens.

```lua
RegisterCommand('leaveradio', function(source)
    RemovePlayerFromVoiceChannel(radioChannel, source)
end, true)
```

#### `SetPlayerMutedInVoiceChannel`

```lua
SetPlayerMutedInVoiceChannel(int channelID, int clientID, bool muted)
```

Sets the **muted** state for a client in a channel. A muted client **can hear but cannot speak**.

If the state already matches the requested value, nothing happens.

```lua
-- Temporarily silence a player on the radio channel
SetPlayerMutedInVoiceChannel(radioChannel, source, true)
```

#### `SetPlayerDeafInVoiceChannel`

```lua
SetPlayerDeafInVoiceChannel(int channelID, int clientID, bool deaf)
```

Sets the **deaf** state for a client in a channel. A deaf client **can speak but cannot hear**.

`muted` and `deaf` can be combined — a client that is both is in the channel but cannot hear or speak. If the state already matches the requested value, nothing happens.

```lua
SetPlayerDeafInVoiceChannel(radioChannel, source, true)
```

### Rewriting the Radio/Walkie-Talkie system

The Mumble example earlier in this page required syncing channel state between server and client. With the new API the server owns everything, so the implementation collapses to a single server-side script.

```lua
-- server.lua
local radioChannels = {} -- key: channel index supplied by the player, value: voice channel ID

local function getOrCreateChannel(channelIdx)
    if not radioChannels[channelIdx] then
        radioChannels[channelIdx] = CreateVoiceChannel(0, 0.0) -- non-spatial radio
    end
    return radioChannels[channelIdx]
end

local function leaveAllChannels(playerId)
    for idx, channelId in pairs(radioChannels) do
        RemovePlayerFromVoiceChannel(channelId, playerId)
    end
end

RegisterCommand('joinchannel', function(source, args)
    local channelIdx = tonumber(args[1])
    if not channelIdx then return end

    leaveAllChannels(source)
    AddPlayerToVoiceChannel(getOrCreateChannel(channelIdx), source)
end, false)

RegisterCommand('leavechannel', function(source)
    leaveAllChannels(source)
end, false)

AddEventHandler('playerDropped', function()
    -- The server automatically removes the player from every channel,
    -- so no manual cleanup is required here.
end)
```

#### Replacing `MumbleAddVoiceChannelListen`

Listening to (spectating) a channel is done by adding the listener as a deaf-but-not-muted member through the new API. Add the player with `AddPlayerToVoiceChannel` and then call `SetPlayerMutedInVoiceChannel(..., true)` if you want a pure listener that cannot transmit:

```lua
RegisterCommand('listenchannel', function(source, args)
    local channelIdx = tonumber(args[1])
    if not channelIdx or not radioChannels[channelIdx] then return end

    AddPlayerToVoiceChannel(radioChannels[channelIdx], source)
    SetPlayerMutedInVoiceChannel(radioChannels[channelIdx], source, true)
end, false)
```

To stop listening, remove the player from the channel:

```lua
RegisterCommand('unlistenchannel', function(source, args)
    local channelIdx = tonumber(args[1])
    if not channelIdx or not radioChannels[channelIdx] then return end

    RemovePlayerFromVoiceChannel(radioChannels[channelIdx], source)
end, false)
```
