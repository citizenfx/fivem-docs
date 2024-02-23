---
title: Voice
weight: 450
---

FiveM has been using the [mumble](https://www.mumble.info/) client to handle in-game voice communication for a while now, below we will explain how you can use certain mumble natives, including a couple guides to handle submixes and NativeAudio.

# Console Variables

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

A Convar that can be used to only hear other clients within their range. This is set to false by default.

### `voice_useNativeAudio [true/false]`

Enables the game's native audio including filter support. This should be enabled if you plan to use submixes. This is set to false by default.

# Talker Proximity

You can use [`MUMBLE_SET_TALKER_PROXIMITY`](https://docs.fivem.net/natives/?_0x74E927B0) to limit distance between players when communicating via voice chat.  

An example can be shown down below:

```lua
MumbleSetTalkerProximity(15.0)
```

This method ought to be called from the client in order for it to work.

It's worth noting that there's another native named [`NETWORK_SET_TALKER_PROXIMITY`](https://docs.fivem.net/natives/?_0xCBF12D65F95AD686), which is only available on FiveM. The aforementioned native also [calls](https://github.com/citizenfx/fivem/blob/928bd19f886d66d3f85340e65df69ae97ab91dc7/code/components/gta-net-five/src/MumbleVoice.cpp#L1343) the original game native before setting mumble's audio distance.

# Submixes

Submixes allow you to apply effects to sounds, FiveM utilizes `rage::audDriver::GetMixer` to apply these effects. These can be set to clients to alter their outgoing audio (voice).
Below is an example of a submix being initialized (with audio effects being applied):

Submix effects have hashes, for the full list of hashes, check out this [native](https://docs.fivem.net/natives/?_0xAAA94D53).

## Initializing a submix

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

## Assigning a submix effect to everyone

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

## Making a submix play through the left channel only

You can change how a submix plays through different channels by using [`SET_AUDIO_SUBMIX_OUTPUT_VOLUMES`](https://docs.fivem.net/natives/?_0x825DC0D1) as described down below.  
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

## Removing assignment of a submix for a given player

You can stop a submix from applying to a player by sending `-1` as the submix id to [`MUMBLE_SET_SUBMIX_FOR_SERVER_ID`](https://docs.fivem.net/natives/?_0xFE3A3054), for example:

```lua
MumbleSetSubmixForServerId(playerId, -1)
```

# Voice channels

Voice channels can be implemented if we want to add custom functionality, for example voice radios. Below we will find some examples on how to create a permanent channel, as well as how to create temporary ones.

## Creating a permanent voice channel

You can create a permanent voice channel the following way:

```lua
MumbleCreateChannel(6743) -- Creates a channel with channel id '6743' we can then join
```

The main difference between permanent voice channels and temporary ones, is that temporary channels get automatically removed once the last client leaves the channel.

## Using voice channels to create a Radio/Walkie-Talkie System

{{% alert color="warning" %}}
This is a simple example on how to join a channel and handle clients, doing this will cause the client to leave the default 'Root' channel, thus stopping proximity chat from working, proceed at your own discretion. [pma-voice](https://github.com/AvarianKnight/pma-voice) handles this by using [voice targets](https://github.com/AvarianKnight/pma-voice/blob/8868556ed86bfa299487b2a6ec760c72486bab8e/client/init/proximity.lua#L38) and proximity checks.
{{% /alert %}}

With that warning out of the way, let's write some code. We will be dividing the logic between server and client and the server will be broadcasting any channel changes to the connected clients, for example when a user leaves a channel.

### Writing the code (server-side)

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

### Writing the code (client-side)

We will first register an event named `onPlayerChangeVoiceChannels`, we will be using this event to iterate through the list of clients we previously mentioned (which the server is sending us) and set their volume. We will also be setting our voice channel through here by calling [`MUMBLE_SET_VOICE_CHANNEL`](https://docs.fivem.net/natives/?_0x8737EEE8).

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

## Listening to channels

We can listen to channels by using the following native: [`MUMBLE_ADD_VOICE_CHANNEL_LISTEN`](https://docs.fivem.net/natives/?_0xC79F44BF). The native allows us to 'spectate' any channel we want. We can find an example client implementation down below.

```lua
RegisterCommand("listenchannel", function(source, args, rawCommand)
    MumbleAddVoiceChannelListen(tonumber(args[1]))
end, false)
```

In order to remove ourselves as a listener, we can use [`MUMBLE_REMOVE_VOICE_CHANNEL_LISTEN`](https://docs.fivem.net/natives/?_0x231523B7).

# Not the end

Thank you for reading, this guide isn't final in any way, and it will still be updated, remember that you can leave any suggestions in the docs issue [section](https://github.com/citizenfx/fivem-docs/issues).
