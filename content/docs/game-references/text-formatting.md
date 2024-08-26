---
title: Text formatting
weight: 780
---

Text labels displayed in the game UI can be formatted using classical Rockstar North-style `~` formatting tags, which are
detailed below.

## Rockstar formatting codes

Rockstar formatting codes are typically found between two tildes (`~`), such as in the following examples:

```
[MY_LABEL]
Demolish the ~r~enemy.

[MY_HELP_LABEL]
Press ~INPUT_CONTEXT~ when near the ~r~enemies.
```

### Color codes

<table>
<thead>
<tr>
<th style="width: 100px">Special</th>
<th>Label</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr>
<td>&nbsp;</td>
<td><code>~HUD_COLOUR_...~</code></td>
<td>References an existing <a href="../hud-colors">HUD color</a>.</td>
<td><code>Find the ~HUD_COLOUR_FREEMODE~freemode ped!</code></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><code>~HC_...~</code></td>
<td>An alias for ~HUD_COLOUR</td>
<td><code>Find the ~HC_FREEMODE~freemode ped!</code></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><code>~HC_[number]~</code></td>
<td>Specifies a HUD color by index.</td>
<td><code>Get to ~HC_13~Davis.</code></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><code>~s~</code></td>
<td>Resets the color to the default for the current context.</td>
<td><code>After killing the ~r~enemies~s~, you win!</code></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><code>~v~</code></td>
<td><a href="../hud-colors#hud_colour_script_variable">HUD_COLOUR_SCRIPT_VARIABLE</a><br>This is a placeholder for the color set with <a href="/natives/?_0xD68A5FF8A3A89874">SET_SCRIPT_VARIABLE_HUD_COLOUR</a>.</td>
<td><code>Wait for your ~v~team~s~ to lose the Cops.</code></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><code>~u~</code></td>
<td><a href="../hud-colors#hud_colour_script_variable_2">HUD_COLOUR_SCRIPT_VARIABLE_2</a><br>This is a placeholder for the color set with <a href="/natives/?_0x16A304E6CB2BFAB9">_SET_SCRIPT_VARIABLE_2_HUD_COLOUR</a>.</td>
<td><code>Take out ~v~~a~~s~ & defend ~u~~a~~s~.</code></td>
</tr>
<tr>
<td style="background-color: rgba(240, 240, 240, 1)">&nbsp;</td>
<td><code>~w~</code></td>
<td><a href="../hud-colors#hud_colour_white">HUD_COLOUR_WHITE</a><br>Used together with ~s~ to reset text color.</td>
<td><code>Swoop on over to ~b~foreclosures.maze-bank.com~w~~s~ today</code></td>
</tr>
<tr>
<th style="width: 100px">Color</th>
<th>Label</th>
<th>Description</th>
<th>Example</th>
</tr>
<tr>
<td style="background-color: rgba(224, 50, 50, 1)">&nbsp;</td>
<td><code>~r~</code></td>
<td><a href="../hud-colors#hud_colour_red">HUD_COLOUR_RED</a><br>Used for enemy characters or vehicles.</td>
<td><code>Kill all the ~r~Vagos.</code></td>
</tr>
<tr>
<td style="background-color: rgba(114, 204, 114, 1)">&nbsp;</td>
<td><code>~g~</code></td>
<td><a href="../hud-colors#hud_colour_green">HUD_COLOUR_GREEN</a><br>Used for pickup-type objectives.</td>
<td><code>Pick up the ~g~flash drive.</code></td>
</tr>
<tr>
<td style="background-color: rgba(93, 182, 229, 1)">&nbsp;</td>
<td><code>~b~</code></td>
<td><a href="../hud-colors#hud_colour_blue">HUD_COLOUR_BLUE</a><br>Used for friendly characters or vehicles.</td>
<td><code>Defend ~b~Lamar.</code></td>
</tr>
<tr>
<td style="background-color: rgba(93, 182, 229, 1)">&nbsp;</td>
<td><code>~f~</code></td>
<td><a href="../hud-colors#hud_colour_friendly">HUD_COLOUR_FRIENDLY</a><br>An alternate (rare) version for friendly objectives.</td>
<td><code>Vehicle health can be restored by waiting in the ~f~pit stop area~s~.</code></td>
</tr>
<tr>
<td style="background-color: rgba(240, 200, 80, 1)">&nbsp;</td>
<td><code>~y~</code></td>
<td><a href="../hud-colors#hud_colour_yellow">HUD_COLOUR_YELLOW</a><br>Destination names.</td>
<td><code>Deliver the Special Cargo to the ~y~restricted area.</code></td>
</tr>
<tr>
<td style="background-color: rgba(140, 140, 140, 1)">&nbsp;</td>
<td><code>~c~</code></td>
<td><a href="../hud-colors#hud_colour_menu_grey">HUD_COLOUR_MENU_GREY</a><br>De-emphasized text used in subtitles, to indicate a character out of view.</td>
<td><code>~z~He's a bum! ~c~~n~Oh my God!</code></td>
</tr>
<tr>
<td style="background-color: rgba(140, 140, 140, 1)">&nbsp;</td>
<td><code>~t~</code></td>
<td><a href="../hud-colors#hud_colour_menu_grey">HUD_COLOUR_MENU_GREY</a><br>De-emphasized text used in subtitles, to indicate text spoken in a different language.</td>
<td><code>~z~those ~t~idiots.</code></td>
</tr>
<tr>
<td style="background-color: rgba(255, 133, 85, 1)">&nbsp;</td>
<td><code>~o~</code></td>
<td><a href="../hud-colors#hud_colour_orange">HUD_COLOUR_ORANGE</a><br>A team color indicator.</td>
<td><code>~o~The Cocks~s~ are mad.</code></td>
</tr>
<tr>
<td style="background-color: rgba(132, 102, 226, 1)">&nbsp;</td>
<td><code>~p~</code></td>
<td><a href="../hud-colors#hud_colour_purple">HUD_COLOUR_PURPLE</a><br>A team color indicator.</td>
<td><code>~p~The Boars~s~ are off the radar.</code></td>
</tr>
<tr>
<td style="background-color: rgba(203, 54, 148, 1)">&nbsp;</td>
<td><code>~q~</code></td>
<td><a href="../hud-colors#hud_colour_pink">HUD_COLOUR_PINK</a><br>Used for Arena War.</td>
<td><code>You are the active contender on your ~q~team~s~.</code></td>
</tr>
<tr>
<td style="background-color: rgba(100, 100, 100, 1)">&nbsp;</td>
<td><code>~m~</code></td>
<td><a href="../hud-colors#hud_colour_mid_grey_mp">HUD_COLOUR_MID_GREY_MP</a><br>Medium gray to de-emphasize or use for 'Silver'.</td>
<td><code>~m~Display Mini Map.</code></td>
</tr>
<tr>
<td style="background-color: rgba(0, 0, 0, 1)">&nbsp;</td>
<td><code>~l~</code></td>
<td><a href="../hud-colors#hud_colour_black">HUD_COLOUR_BLACK</a><br>Used when unable to set a color any other way to specify black.</td>
<td><code>~l~PLAYERS</code></td>
</tr>
<tr>
<td style="background-color: rgba(47, 92, 115, 1)">&nbsp;</td>
<td><code>~d~</code></td>
<td><a href="../hud-colors#hud_colour_bluedark">HUD_COLOUR_BLUEDARK</a><br>Used to specify a team objective occupied by a player.</td>
<td><code>Help your team deliver a ~d~vehicle ~s~to your ~b~base.</code></td>
</tr>
</tbody>
</table>

### Visual formatting codes

<table>
<thead>
<tr>
<th>Label</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>~n~</code></td>
<td>A line break, similar to &amp;lt;br> in HTML.</td>
<td><code>This text is~n~on two lines.</code></td>
</tr>
<tr>
<td><code>~h~</code></td>
<td><strong>Bold</strong> text.<br>Use a second time to unbold.</td>
<td><code>This is ~h~quite bold~h~ of you.</code></td>
</tr>
<tr>
<td><code>~bold~</code></td>
<td>An alias of <code>~h~</code>.</td>
<td><code>This is also pretty ~bold~bold~h~.</code></td>
</tr>
<tr>
<td><code>~italic~</code></td>
<td><i>Italic</i> text.<br>Use a second time to remove italics.</td>
<td><code>Text can be ~italic~written~italic~ in italics.</code></td>
</tr>
<tr>
<td><code>~ws~</code></td>
<td>A wanted star.</td>
<td><code>The ~ws~~ws~ on the top right indicates</code></td>
</tr>
<tr>
<td><code>~wanted_star~</code></td>
<td>A wanted star, equal to <code>~ws~</code>.</td>
<td><code>~wanted_star~~wanted_star~~wanted_star~</code></td>
</tr>
<tr>
<td><code>&amp;lt;C>...&amp;lt;/C></code></td>
<td>Condensed. Usually used for gamer tags.</td>
<td><code>&amp;lt;C>~a~&amp;lt;/C> is dominating you.</code></td>
</tr>
<tr>
<td><code>~nrt~</code></td>
<td>No Return Top. This would mean the padding or margin being added does not include any additional space related to the "return" or "top" of the previous element. Works similar to the ~n~ </td>
<td><code> ~nrt~ Added padding before (above) this text</code></td>
</tr>
<tr>
<td><code>~EX_R*~</code></td>
<td>A Rockstar logo, in fonts that support this character.</td>
<td><code>The ~EX_R*~ logo is a registered trademark</code></td>
</tr>
<tr>
<td><code>~BLIP_...~</code></td>
<td>In help messages and other supported contexts, shows the <a href="../blips">blip</a> with the specified name.</td>
<td><code>Benny's Original Motor Works is now available at ~HUD_COLOUR_YELLOW~~BLIP_BENNYS~~s~.</code></td>
</tr>
</tbody>
</table>

### Content formatting codes

<table>
<thead>
<tr>
<th>Label</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>~a~</code></td>
<td>A placeholder for a substring 'text component', such as ADD_TEXT_COMPONENT_SUBSTRING_TEXT_LABEL.</td>
<td><code>Fight the ~a~.</code></td>
</tr>
<tr>
<td><code>~1~</code></td>
<td>A placeholder for a numeric 'text component', such as ADD_TEXT_COMPONENT_INTEGER.</td>
<td><code>There are ~1~ enemies left.</code></td>
</tr>
<tr>
<td><code>~a_X~</code></td>
<td>For translations, refers to ~a~ placeholders out of the usual order.</td>
<td><code>Get the ~a_1~ from the ~a_0~.</code></td>
</tr>
<tr>
<td><code>~1_X~</code></td>
<td>For translations, refers to ~1~ placeholders out of the usual order.</td>
<td><code>There's ~1_1~ enemies left out of ~1_0~.</code></td>
</tr>
<tr>
<td><code>~x~</code></td>
<td>Unknown. Related to subtitles.</td>
<td></td>
</tr>
<tr>
<td><code>~z~</code></td>
<td>At the start of a string, makes the string hidden if subtitles are turned off.</td>
<td><code>~z~Fucking terrorists. There's been a big scare</code></td>
</tr>
</tbody>
</table>

### Input codes

<table>
<thead>
<tr>
<th>Label</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>~INPUT_...~</code></td>
<td>In help messages and other supported contexts, shows the current key for a specified <a href="../controls">control</a>.</td>
<td><code>Press ~INPUT_CONTEXT~ to stand up.</code></td>
</tr>
<tr>
<td><code>~INPUTGROUP_...~</code></td>
<td>In help messages and other supported contexts, shows a specified input group's hint.</td>
<td><code>If your car is upside down, try rocking ~INPUTGROUP_VEH_MOVE_ALL~ to flip it over.</code></td>
</tr>
<tr>
<td><code>~ACCEPT~</code></td>
<td>Shows the button to accept a prompt.</td>
<td></td>
</tr>
<tr>
<td><code>~CANCEL~</code></td>
<td>Shows the button to cancel a prompt.</td>
<td></td>
</tr>
<tr>
<td><code>~PAD_UP~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DOWN~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LEFT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RIGHT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_A~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_B~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_X~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_Y~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_START~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_BACK~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LB~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RB~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_UP~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_DOWN~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_LEFT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_RIGHT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_NONE~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_ALL~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_UPDOWN~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_DPAD_LEFTRIGHT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_UP~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_DOWN~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_LEFT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_RIGHT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_NONE~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_ALL~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_UPDOWN~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_LEFTRIGHT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_LSTICK_ROTATE~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_UP~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_DOWN~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_LEFT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_RIGHT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_NONE~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_ALL~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_UPDOWN~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_LEFTRIGHT~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr><tr>
<td><code>~PAD_RSTICK_ROTATE~</code></td>
<td>In supported contexts, shows a gamepad button or other control.</td>
<td></td>
</tr>
</tbody>
</table>

<!-- scaleform HTML? -->
