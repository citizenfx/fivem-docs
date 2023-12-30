---
title: HUD colors
weight: 765
---

This page lists the default HUD colors as defined in `common:/data/ui/hudcolor.dat`, which can be overridden or obtained
using the following native commands:

* GET_HUD_COLOUR
* REPLACE_HUD_COLOUR
* REPLACE_HUD_COLOUR_WITH_RGBA

<style type="text/css">
td.color {
    background-image: linear-gradient(0deg, var(--color) 0%, var(--color) 100%), url('data:image/svg+xml,\
   <svg xmlns="http://www.w3.org/2000/svg" width="400" height="400" fill-opacity=".25" >\
            <rect x="200" width="200" height="200" />\
            <rect y="200" width="200" height="200" />\
            </svg>'), linear-gradient(0deg, #fff 0%, #fff 100%);
    background-size: 30px 30px;
    background-position: center;
}
</style>

## List of default colors

<table>
<thead>
<tr>
<th style="width: 200px">
Color
</th>
<th>
Index
</th>
<th>
Name
</th>
<th>
RGBA
</th>
</tr>
</thead>
    <tbody>
        <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_pure_white">&nbsp;</td>
        <td>0</td>
        <td>HUD_COLOUR_PURE_WHITE</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 240, 240, 1)" id="hud_colour_white">&nbsp;</td>
        <td>1</td>
        <td>HUD_COLOUR_WHITE</td>
        <td><abbr title="#f0f0f0">rgba(240, 240, 240, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 1)" id="hud_colour_black">&nbsp;</td>
        <td>2</td>
        <td>HUD_COLOUR_BLACK</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(155, 155, 155, 1)" id="hud_colour_grey">&nbsp;</td>
        <td>3</td>
        <td>HUD_COLOUR_GREY</td>
        <td><abbr title="#9b9b9b">rgba(155, 155, 155, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(205, 205, 205, 1)" id="hud_colour_greylight">&nbsp;</td>
        <td>4</td>
        <td>HUD_COLOUR_GREYLIGHT</td>
        <td><abbr title="#cdcdcd">rgba(205, 205, 205, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(77, 77, 77, 1)" id="hud_colour_greydark">&nbsp;</td>
        <td>5</td>
        <td>HUD_COLOUR_GREYDARK</td>
        <td><abbr title="#4d4d4d">rgba(77, 77, 77, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(224, 50, 50, 1)" id="hud_colour_red">&nbsp;</td>
        <td>6</td>
        <td>HUD_COLOUR_RED</td>
        <td><abbr title="#e03232">rgba(224, 50, 50, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 153, 153, 1)" id="hud_colour_redlight">&nbsp;</td>
        <td>7</td>
        <td>HUD_COLOUR_REDLIGHT</td>
        <td><abbr title="#f09999">rgba(240, 153, 153, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(112, 25, 25, 1)" id="hud_colour_reddark">&nbsp;</td>
        <td>8</td>
        <td>HUD_COLOUR_REDDARK</td>
        <td><abbr title="#701919">rgba(112, 25, 25, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 182, 229, 1)" id="hud_colour_blue">&nbsp;</td>
        <td>9</td>
        <td>HUD_COLOUR_BLUE</td>
        <td><abbr title="#5db6e5">rgba(93, 182, 229, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(174, 219, 242, 1)" id="hud_colour_bluelight">&nbsp;</td>
        <td>10</td>
        <td>HUD_COLOUR_BLUELIGHT</td>
        <td><abbr title="#aedbf2">rgba(174, 219, 242, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(47, 92, 115, 1)" id="hud_colour_bluedark">&nbsp;</td>
        <td>11</td>
        <td>HUD_COLOUR_BLUEDARK</td>
        <td><abbr title="#2f5c73">rgba(47, 92, 115, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 200, 80, 1)" id="hud_colour_yellow">&nbsp;</td>
        <td>12</td>
        <td>HUD_COLOUR_YELLOW</td>
        <td><abbr title="#f0c850">rgba(240, 200, 80, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(254, 235, 169, 1)" id="hud_colour_yellowlight">&nbsp;</td>
        <td>13</td>
        <td>HUD_COLOUR_YELLOWLIGHT</td>
        <td><abbr title="#feeba9">rgba(254, 235, 169, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(126, 107, 41, 1)" id="hud_colour_yellowdark">&nbsp;</td>
        <td>14</td>
        <td>HUD_COLOUR_YELLOWDARK</td>
        <td><abbr title="#7e6b29">rgba(126, 107, 41, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 133, 85, 1)" id="hud_colour_orange">&nbsp;</td>
        <td>15</td>
        <td>HUD_COLOUR_ORANGE</td>
        <td><abbr title="#ff8555">rgba(255, 133, 85, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 194, 170, 1)" id="hud_colour_orangelight">&nbsp;</td>
        <td>16</td>
        <td>HUD_COLOUR_ORANGELIGHT</td>
        <td><abbr title="#ffc2aa">rgba(255, 194, 170, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(127, 66, 42, 1)" id="hud_colour_orangedark">&nbsp;</td>
        <td>17</td>
        <td>HUD_COLOUR_ORANGEDARK</td>
        <td><abbr title="#7f422a">rgba(127, 66, 42, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(114, 204, 114, 1)" id="hud_colour_green">&nbsp;</td>
        <td>18</td>
        <td>HUD_COLOUR_GREEN</td>
        <td><abbr title="#72cc72">rgba(114, 204, 114, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(185, 230, 185, 1)" id="hud_colour_greenlight">&nbsp;</td>
        <td>19</td>
        <td>HUD_COLOUR_GREENLIGHT</td>
        <td><abbr title="#b9e6b9">rgba(185, 230, 185, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(57, 102, 57, 1)" id="hud_colour_greendark">&nbsp;</td>
        <td>20</td>
        <td>HUD_COLOUR_GREENDARK</td>
        <td><abbr title="#396639">rgba(57, 102, 57, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(132, 102, 226, 1)" id="hud_colour_purple">&nbsp;</td>
        <td>21</td>
        <td>HUD_COLOUR_PURPLE</td>
        <td><abbr title="#8466e2">rgba(132, 102, 226, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(192, 179, 239, 1)" id="hud_colour_purplelight">&nbsp;</td>
        <td>22</td>
        <td>HUD_COLOUR_PURPLELIGHT</td>
        <td><abbr title="#c0b3ef">rgba(192, 179, 239, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(67, 57, 111, 1)" id="hud_colour_purpledark">&nbsp;</td>
        <td>23</td>
        <td>HUD_COLOUR_PURPLEDARK</td>
        <td><abbr title="#43396f">rgba(67, 57, 111, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(203, 54, 148, 1)" id="hud_colour_pink">&nbsp;</td>
        <td>24</td>
        <td>HUD_COLOUR_PINK</td>
        <td><abbr title="#cb3694">rgba(203, 54, 148, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(53, 154, 71, 1)" id="hud_colour_radar_health">&nbsp;</td>
        <td>25</td>
        <td>HUD_COLOUR_RADAR_HEALTH</td>
        <td><abbr title="#359a47">rgba(53, 154, 71, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 182, 229, 1)" id="hud_colour_radar_armour">&nbsp;</td>
        <td>26</td>
        <td>HUD_COLOUR_RADAR_ARMOUR</td>
        <td><a href="#hud_colour_blue">HUD_COLOUR_BLUE</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(235, 36, 39, 1)" id="hud_colour_radar_damage">&nbsp;</td>
        <td>27</td>
        <td>HUD_COLOUR_RADAR_DAMAGE</td>
        <td><abbr title="#eb2427">rgba(235, 36, 39, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(194, 80, 80, 1)" id="hud_colour_net_player1">&nbsp;</td>
        <td>28</td>
        <td>HUD_COLOUR_NET_PLAYER1</td>
        <td><abbr title="#c25050">rgba(194, 80, 80, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(156, 110, 175, 1)" id="hud_colour_net_player2">&nbsp;</td>
        <td>29</td>
        <td>HUD_COLOUR_NET_PLAYER2</td>
        <td><abbr title="#9c6eaf">rgba(156, 110, 175, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 123, 196, 1)" id="hud_colour_net_player3">&nbsp;</td>
        <td>30</td>
        <td>HUD_COLOUR_NET_PLAYER3</td>
        <td><abbr title="#ff7bc4">rgba(255, 123, 196, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(247, 159, 123, 1)" id="hud_colour_net_player4">&nbsp;</td>
        <td>31</td>
        <td>HUD_COLOUR_NET_PLAYER4</td>
        <td><abbr title="#f79f7b">rgba(247, 159, 123, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(178, 144, 132, 1)" id="hud_colour_net_player5">&nbsp;</td>
        <td>32</td>
        <td>HUD_COLOUR_NET_PLAYER5</td>
        <td><abbr title="#b29084">rgba(178, 144, 132, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(141, 206, 167, 1)" id="hud_colour_net_player6">&nbsp;</td>
        <td>33</td>
        <td>HUD_COLOUR_NET_PLAYER6</td>
        <td><abbr title="#8dcea7">rgba(141, 206, 167, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(113, 169, 175, 1)" id="hud_colour_net_player7">&nbsp;</td>
        <td>34</td>
        <td>HUD_COLOUR_NET_PLAYER7</td>
        <td><abbr title="#71a9af">rgba(113, 169, 175, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(211, 209, 231, 1)" id="hud_colour_net_player8">&nbsp;</td>
        <td>35</td>
        <td>HUD_COLOUR_NET_PLAYER8</td>
        <td><abbr title="#d3d1e7">rgba(211, 209, 231, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(144, 127, 153, 1)" id="hud_colour_net_player9">&nbsp;</td>
        <td>36</td>
        <td>HUD_COLOUR_NET_PLAYER9</td>
        <td><abbr title="#907f99">rgba(144, 127, 153, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(106, 196, 191, 1)" id="hud_colour_net_player10">&nbsp;</td>
        <td>37</td>
        <td>HUD_COLOUR_NET_PLAYER10</td>
        <td><abbr title="#6ac4bf">rgba(106, 196, 191, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(214, 196, 153, 1)" id="hud_colour_net_player11">&nbsp;</td>
        <td>38</td>
        <td>HUD_COLOUR_NET_PLAYER11</td>
        <td><abbr title="#d6c499">rgba(214, 196, 153, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(234, 142, 80, 1)" id="hud_colour_net_player12">&nbsp;</td>
        <td>39</td>
        <td>HUD_COLOUR_NET_PLAYER12</td>
        <td><abbr title="#ea8e50">rgba(234, 142, 80, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(152, 203, 234, 1)" id="hud_colour_net_player13">&nbsp;</td>
        <td>40</td>
        <td>HUD_COLOUR_NET_PLAYER13</td>
        <td><abbr title="#98cbea">rgba(152, 203, 234, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(178, 98, 135, 1)" id="hud_colour_net_player14">&nbsp;</td>
        <td>41</td>
        <td>HUD_COLOUR_NET_PLAYER14</td>
        <td><abbr title="#b26287">rgba(178, 98, 135, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(144, 142, 122, 1)" id="hud_colour_net_player15">&nbsp;</td>
        <td>42</td>
        <td>HUD_COLOUR_NET_PLAYER15</td>
        <td><abbr title="#908e7a">rgba(144, 142, 122, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(166, 117, 94, 1)" id="hud_colour_net_player16">&nbsp;</td>
        <td>43</td>
        <td>HUD_COLOUR_NET_PLAYER16</td>
        <td><abbr title="#a6755e">rgba(166, 117, 94, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(175, 168, 168, 1)" id="hud_colour_net_player17">&nbsp;</td>
        <td>44</td>
        <td>HUD_COLOUR_NET_PLAYER17</td>
        <td><abbr title="#afa8a8">rgba(175, 168, 168, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(232, 142, 155, 1)" id="hud_colour_net_player18">&nbsp;</td>
        <td>45</td>
        <td>HUD_COLOUR_NET_PLAYER18</td>
        <td><abbr title="#e88e9b">rgba(232, 142, 155, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(187, 214, 91, 1)" id="hud_colour_net_player19">&nbsp;</td>
        <td>46</td>
        <td>HUD_COLOUR_NET_PLAYER19</td>
        <td><abbr title="#bbd65b">rgba(187, 214, 91, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(12, 123, 86, 1)" id="hud_colour_net_player20">&nbsp;</td>
        <td>47</td>
        <td>HUD_COLOUR_NET_PLAYER20</td>
        <td><abbr title="#0c7b56">rgba(12, 123, 86, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(123, 196, 255, 1)" id="hud_colour_net_player21">&nbsp;</td>
        <td>48</td>
        <td>HUD_COLOUR_NET_PLAYER21</td>
        <td><abbr title="#7bc4ff">rgba(123, 196, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(171, 60, 230, 1)" id="hud_colour_net_player22">&nbsp;</td>
        <td>49</td>
        <td>HUD_COLOUR_NET_PLAYER22</td>
        <td><abbr title="#ab3ce6">rgba(171, 60, 230, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(206, 169, 13, 1)" id="hud_colour_net_player23">&nbsp;</td>
        <td>50</td>
        <td>HUD_COLOUR_NET_PLAYER23</td>
        <td><abbr title="#cea90d">rgba(206, 169, 13, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(71, 99, 173, 1)" id="hud_colour_net_player24">&nbsp;</td>
        <td>51</td>
        <td>HUD_COLOUR_NET_PLAYER24</td>
        <td><abbr title="#4763ad">rgba(71, 99, 173, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(42, 166, 185, 1)" id="hud_colour_net_player25">&nbsp;</td>
        <td>52</td>
        <td>HUD_COLOUR_NET_PLAYER25</td>
        <td><abbr title="#2aa6b9">rgba(42, 166, 185, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(186, 157, 125, 1)" id="hud_colour_net_player26">&nbsp;</td>
        <td>53</td>
        <td>HUD_COLOUR_NET_PLAYER26</td>
        <td><abbr title="#ba9d7d">rgba(186, 157, 125, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(201, 225, 255, 1)" id="hud_colour_net_player27">&nbsp;</td>
        <td>54</td>
        <td>HUD_COLOUR_NET_PLAYER27</td>
        <td><abbr title="#c9e1ff">rgba(201, 225, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 240, 150, 1)" id="hud_colour_net_player28">&nbsp;</td>
        <td>55</td>
        <td>HUD_COLOUR_NET_PLAYER28</td>
        <td><abbr title="#f0f096">rgba(240, 240, 150, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(237, 140, 161, 1)" id="hud_colour_net_player29">&nbsp;</td>
        <td>56</td>
        <td>HUD_COLOUR_NET_PLAYER29</td>
        <td><abbr title="#ed8ca1">rgba(237, 140, 161, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(249, 138, 138, 1)" id="hud_colour_net_player30">&nbsp;</td>
        <td>57</td>
        <td>HUD_COLOUR_NET_PLAYER30</td>
        <td><abbr title="#f98a8a">rgba(249, 138, 138, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(252, 239, 166, 1)" id="hud_colour_net_player31">&nbsp;</td>
        <td>58</td>
        <td>HUD_COLOUR_NET_PLAYER31</td>
        <td><abbr title="#fcefa6">rgba(252, 239, 166, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 240, 240, 1)" id="hud_colour_net_player32">&nbsp;</td>
        <td>59</td>
        <td>HUD_COLOUR_NET_PLAYER32</td>
        <td><abbr title="#f0f0f0">rgba(240, 240, 240, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(159, 201, 166, 1)" id="hud_colour_simpleblip_default">&nbsp;</td>
        <td>60</td>
        <td>HUD_COLOUR_SIMPLEBLIP_DEFAULT</td>
        <td><abbr title="#9fc9a6">rgba(159, 201, 166, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(140, 140, 140, 1)" id="hud_colour_menu_blue">&nbsp;</td>
        <td>61</td>
        <td>HUD_COLOUR_MENU_BLUE</td>
        <td><abbr title="#8c8c8c">rgba(140, 140, 140, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(140, 140, 140, 1)" id="hud_colour_menu_grey_light">&nbsp;</td>
        <td>62</td>
        <td>HUD_COLOUR_MENU_GREY_LIGHT</td>
        <td><a href="#hud_colour_menu_blue">HUD_COLOUR_MENU_BLUE</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(40, 40, 40, 1)" id="hud_colour_menu_blue_extra_dark">&nbsp;</td>
        <td>63</td>
        <td>HUD_COLOUR_MENU_BLUE_EXTRA_DARK</td>
        <td><abbr title="#282828">rgba(40, 40, 40, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 160, 0, 1)" id="hud_colour_menu_yellow">&nbsp;</td>
        <td>64</td>
        <td>HUD_COLOUR_MENU_YELLOW</td>
        <td><abbr title="#f0a000">rgba(240, 160, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 160, 0, 1)" id="hud_colour_menu_yellow_dark">&nbsp;</td>
        <td>65</td>
        <td>HUD_COLOUR_MENU_YELLOW_DARK</td>
        <td><a href="#hud_colour_menu_yellow">HUD_COLOUR_MENU_YELLOW</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 160, 0, 1)" id="hud_colour_menu_green">&nbsp;</td>
        <td>66</td>
        <td>HUD_COLOUR_MENU_GREEN</td>
        <td><a href="#hud_colour_menu_yellow">HUD_COLOUR_MENU_YELLOW</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(140, 140, 140, 1)" id="hud_colour_menu_grey">&nbsp;</td>
        <td>67</td>
        <td>HUD_COLOUR_MENU_GREY</td>
        <td><abbr title="#8c8c8c">rgba(140, 140, 140, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(60, 60, 60, 1)" id="hud_colour_menu_grey_dark">&nbsp;</td>
        <td>68</td>
        <td>HUD_COLOUR_MENU_GREY_DARK</td>
        <td><abbr title="#3c3c3c">rgba(60, 60, 60, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(30, 30, 30, 1)" id="hud_colour_menu_highlight">&nbsp;</td>
        <td>69</td>
        <td>HUD_COLOUR_MENU_HIGHLIGHT</td>
        <td><abbr title="#1e1e1e">rgba(30, 30, 30, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(140, 140, 140, 1)" id="hud_colour_menu_standard">&nbsp;</td>
        <td>70</td>
        <td>HUD_COLOUR_MENU_STANDARD</td>
        <td><abbr title="#8c8c8c">rgba(140, 140, 140, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(75, 75, 75, 1)" id="hud_colour_menu_dimmed">&nbsp;</td>
        <td>71</td>
        <td>HUD_COLOUR_MENU_DIMMED</td>
        <td><abbr title="#4b4b4b">rgba(75, 75, 75, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(50, 50, 50, 1)" id="hud_colour_menu_extra_dimmed">&nbsp;</td>
        <td>72</td>
        <td>HUD_COLOUR_MENU_EXTRA_DIMMED</td>
        <td><abbr title="#323232">rgba(50, 50, 50, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(95, 95, 95, 1)" id="hud_colour_brief_title">&nbsp;</td>
        <td>73</td>
        <td>HUD_COLOUR_BRIEF_TITLE</td>
        <td><abbr title="#5f5f5f">rgba(95, 95, 95, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(100, 100, 100, 1)" id="hud_colour_mid_grey_mp">&nbsp;</td>
        <td>74</td>
        <td>HUD_COLOUR_MID_GREY_MP</td>
        <td><abbr title="#646464">rgba(100, 100, 100, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 39, 39, 1)" id="hud_colour_net_player1_dark">&nbsp;</td>
        <td>75</td>
        <td>HUD_COLOUR_NET_PLAYER1_DARK</td>
        <td><abbr title="#5d2727">rgba(93, 39, 39, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(77, 55, 89, 1)" id="hud_colour_net_player2_dark">&nbsp;</td>
        <td>76</td>
        <td>HUD_COLOUR_NET_PLAYER2_DARK</td>
        <td><abbr title="#4d3759">rgba(77, 55, 89, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(124, 62, 99, 1)" id="hud_colour_net_player3_dark">&nbsp;</td>
        <td>77</td>
        <td>HUD_COLOUR_NET_PLAYER3_DARK</td>
        <td><abbr title="#7c3e63">rgba(124, 62, 99, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(120, 80, 80, 1)" id="hud_colour_net_player4_dark">&nbsp;</td>
        <td>78</td>
        <td>HUD_COLOUR_NET_PLAYER4_DARK</td>
        <td><abbr title="#785050">rgba(120, 80, 80, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(87, 72, 66, 1)" id="hud_colour_net_player5_dark">&nbsp;</td>
        <td>79</td>
        <td>HUD_COLOUR_NET_PLAYER5_DARK</td>
        <td><abbr title="#574842">rgba(87, 72, 66, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(74, 103, 83, 1)" id="hud_colour_net_player6_dark">&nbsp;</td>
        <td>80</td>
        <td>HUD_COLOUR_NET_PLAYER6_DARK</td>
        <td><abbr title="#4a6753">rgba(74, 103, 83, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(60, 85, 88, 1)" id="hud_colour_net_player7_dark">&nbsp;</td>
        <td>81</td>
        <td>HUD_COLOUR_NET_PLAYER7_DARK</td>
        <td><abbr title="#3c5558">rgba(60, 85, 88, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(105, 105, 64, 1)" id="hud_colour_net_player8_dark">&nbsp;</td>
        <td>82</td>
        <td>HUD_COLOUR_NET_PLAYER8_DARK</td>
        <td><abbr title="#696940">rgba(105, 105, 64, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(72, 63, 76, 1)" id="hud_colour_net_player9_dark">&nbsp;</td>
        <td>83</td>
        <td>HUD_COLOUR_NET_PLAYER9_DARK</td>
        <td><abbr title="#483f4c">rgba(72, 63, 76, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(53, 98, 95, 1)" id="hud_colour_net_player10_dark">&nbsp;</td>
        <td>84</td>
        <td>HUD_COLOUR_NET_PLAYER10_DARK</td>
        <td><abbr title="#35625f">rgba(53, 98, 95, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(107, 98, 76, 1)" id="hud_colour_net_player11_dark">&nbsp;</td>
        <td>85</td>
        <td>HUD_COLOUR_NET_PLAYER11_DARK</td>
        <td><abbr title="#6b624c">rgba(107, 98, 76, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(117, 71, 40, 1)" id="hud_colour_net_player12_dark">&nbsp;</td>
        <td>86</td>
        <td>HUD_COLOUR_NET_PLAYER12_DARK</td>
        <td><abbr title="#754728">rgba(117, 71, 40, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(76, 101, 117, 1)" id="hud_colour_net_player13_dark">&nbsp;</td>
        <td>87</td>
        <td>HUD_COLOUR_NET_PLAYER13_DARK</td>
        <td><abbr title="#4c6575">rgba(76, 101, 117, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(65, 35, 47, 1)" id="hud_colour_net_player14_dark">&nbsp;</td>
        <td>88</td>
        <td>HUD_COLOUR_NET_PLAYER14_DARK</td>
        <td><abbr title="#41232f">rgba(65, 35, 47, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(72, 71, 61, 1)" id="hud_colour_net_player15_dark">&nbsp;</td>
        <td>89</td>
        <td>HUD_COLOUR_NET_PLAYER15_DARK</td>
        <td><abbr title="#48473d">rgba(72, 71, 61, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(85, 58, 47, 1)" id="hud_colour_net_player16_dark">&nbsp;</td>
        <td>90</td>
        <td>HUD_COLOUR_NET_PLAYER16_DARK</td>
        <td><abbr title="#553a2f">rgba(85, 58, 47, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(87, 84, 84, 1)" id="hud_colour_net_player17_dark">&nbsp;</td>
        <td>91</td>
        <td>HUD_COLOUR_NET_PLAYER17_DARK</td>
        <td><abbr title="#575454">rgba(87, 84, 84, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(116, 71, 77, 1)" id="hud_colour_net_player18_dark">&nbsp;</td>
        <td>92</td>
        <td>HUD_COLOUR_NET_PLAYER18_DARK</td>
        <td><abbr title="#74474d">rgba(116, 71, 77, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 107, 45, 1)" id="hud_colour_net_player19_dark">&nbsp;</td>
        <td>93</td>
        <td>HUD_COLOUR_NET_PLAYER19_DARK</td>
        <td><abbr title="#5d6b2d">rgba(93, 107, 45, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(6, 61, 43, 1)" id="hud_colour_net_player20_dark">&nbsp;</td>
        <td>94</td>
        <td>HUD_COLOUR_NET_PLAYER20_DARK</td>
        <td><abbr title="#063d2b">rgba(6, 61, 43, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(61, 98, 127, 1)" id="hud_colour_net_player21_dark">&nbsp;</td>
        <td>95</td>
        <td>HUD_COLOUR_NET_PLAYER21_DARK</td>
        <td><abbr title="#3d627f">rgba(61, 98, 127, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(85, 30, 115, 1)" id="hud_colour_net_player22_dark">&nbsp;</td>
        <td>96</td>
        <td>HUD_COLOUR_NET_PLAYER22_DARK</td>
        <td><abbr title="#551e73">rgba(85, 30, 115, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(103, 84, 6, 1)" id="hud_colour_net_player23_dark">&nbsp;</td>
        <td>97</td>
        <td>HUD_COLOUR_NET_PLAYER23_DARK</td>
        <td><abbr title="#675406">rgba(103, 84, 6, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(35, 49, 86, 1)" id="hud_colour_net_player24_dark">&nbsp;</td>
        <td>98</td>
        <td>HUD_COLOUR_NET_PLAYER24_DARK</td>
        <td><abbr title="#233156">rgba(35, 49, 86, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(21, 83, 92, 1)" id="hud_colour_net_player25_dark">&nbsp;</td>
        <td>99</td>
        <td>HUD_COLOUR_NET_PLAYER25_DARK</td>
        <td><abbr title="#15535c">rgba(21, 83, 92, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 98, 62, 1)" id="hud_colour_net_player26_dark">&nbsp;</td>
        <td>100</td>
        <td>HUD_COLOUR_NET_PLAYER26_DARK</td>
        <td><abbr title="#5d623e">rgba(93, 98, 62, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(100, 112, 127, 1)" id="hud_colour_net_player27_dark">&nbsp;</td>
        <td>101</td>
        <td>HUD_COLOUR_NET_PLAYER27_DARK</td>
        <td><abbr title="#64707f">rgba(100, 112, 127, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(120, 120, 75, 1)" id="hud_colour_net_player28_dark">&nbsp;</td>
        <td>102</td>
        <td>HUD_COLOUR_NET_PLAYER28_DARK</td>
        <td><abbr title="#78784b">rgba(120, 120, 75, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(152, 76, 93, 1)" id="hud_colour_net_player29_dark">&nbsp;</td>
        <td>103</td>
        <td>HUD_COLOUR_NET_PLAYER29_DARK</td>
        <td><abbr title="#984c5d">rgba(152, 76, 93, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(124, 69, 69, 1)" id="hud_colour_net_player30_dark">&nbsp;</td>
        <td>104</td>
        <td>HUD_COLOUR_NET_PLAYER30_DARK</td>
        <td><abbr title="#7c4545">rgba(124, 69, 69, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(10, 43, 50, 1)" id="hud_colour_net_player31_dark">&nbsp;</td>
        <td>105</td>
        <td>HUD_COLOUR_NET_PLAYER31_DARK</td>
        <td><abbr title="#0a2b32">rgba(10, 43, 50, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(95, 95, 10, 1)" id="hud_colour_net_player32_dark">&nbsp;</td>
        <td>106</td>
        <td>HUD_COLOUR_NET_PLAYER32_DARK</td>
        <td><abbr title="#5f5f0a">rgba(95, 95, 10, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(180, 130, 97, 1)" id="hud_colour_bronze">&nbsp;</td>
        <td>107</td>
        <td>HUD_COLOUR_BRONZE</td>
        <td><abbr title="#b48261">rgba(180, 130, 97, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(150, 153, 161, 1)" id="hud_colour_silver">&nbsp;</td>
        <td>108</td>
        <td>HUD_COLOUR_SILVER</td>
        <td><abbr title="#9699a1">rgba(150, 153, 161, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(214, 181, 99, 1)" id="hud_colour_gold">&nbsp;</td>
        <td>109</td>
        <td>HUD_COLOUR_GOLD</td>
        <td><abbr title="#d6b563">rgba(214, 181, 99, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(166, 221, 190, 1)" id="hud_colour_platinum">&nbsp;</td>
        <td>110</td>
        <td>HUD_COLOUR_PLATINUM</td>
        <td><abbr title="#a6ddbe">rgba(166, 221, 190, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(29, 100, 153, 1)" id="hud_colour_gang1">&nbsp;</td>
        <td>111</td>
        <td>HUD_COLOUR_GANG1</td>
        <td><abbr title="#1d6499">rgba(29, 100, 153, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(214, 116, 15, 1)" id="hud_colour_gang2">&nbsp;</td>
        <td>112</td>
        <td>HUD_COLOUR_GANG2</td>
        <td><abbr title="#d6740f">rgba(214, 116, 15, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(135, 125, 142, 1)" id="hud_colour_gang3">&nbsp;</td>
        <td>113</td>
        <td>HUD_COLOUR_GANG3</td>
        <td><abbr title="#877d8e">rgba(135, 125, 142, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(229, 119, 185, 1)" id="hud_colour_gang4">&nbsp;</td>
        <td>114</td>
        <td>HUD_COLOUR_GANG4</td>
        <td><abbr title="#e577b9">rgba(229, 119, 185, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(252, 239, 166, 1)" id="hud_colour_same_crew">&nbsp;</td>
        <td>115</td>
        <td>HUD_COLOUR_SAME_CREW</td>
        <td><abbr title="#fcefa6">rgba(252, 239, 166, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(45, 110, 185, 1)" id="hud_colour_freemode">&nbsp;</td>
        <td>116</td>
        <td>HUD_COLOUR_FREEMODE</td>
        <td><abbr title="#2d6eb9">rgba(45, 110, 185, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 0.7294117647058823)" id="hud_colour_pause_bg">&nbsp;</td>
        <td>117</td>
        <td>HUD_COLOUR_PAUSE_BG</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 186)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 182, 229, 1)" id="hud_colour_friendly">&nbsp;</td>
        <td>118</td>
        <td>HUD_COLOUR_FRIENDLY</td>
        <td><abbr title="#5db6e5">rgba(93, 182, 229, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(194, 80, 80, 1)" id="hud_colour_enemy">&nbsp;</td>
        <td>119</td>
        <td>HUD_COLOUR_ENEMY</td>
        <td><abbr title="#c25050">rgba(194, 80, 80, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 200, 80, 1)" id="hud_colour_location">&nbsp;</td>
        <td>120</td>
        <td>HUD_COLOUR_LOCATION</td>
        <td><a href="#hud_colour_yellow">HUD_COLOUR_YELLOW</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(114, 204, 114, 1)" id="hud_colour_pickup">&nbsp;</td>
        <td>121</td>
        <td>HUD_COLOUR_PICKUP</td>
        <td><a href="#hud_colour_green">HUD_COLOUR_GREEN</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(114, 204, 114, 1)" id="hud_colour_pause_singleplayer">&nbsp;</td>
        <td>122</td>
        <td>HUD_COLOUR_PAUSE_SINGLEPLAYER</td>
        <td><a href="#hud_colour_green">HUD_COLOUR_GREEN</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(22, 55, 92, 1)" id="hud_colour_freemode_dark">&nbsp;</td>
        <td>123</td>
        <td>HUD_COLOUR_FREEMODE_DARK</td>
        <td><abbr title="#16375c">rgba(22, 55, 92, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(154, 154, 154, 1)" id="hud_colour_inactive_mission">&nbsp;</td>
        <td>124</td>
        <td>HUD_COLOUR_INACTIVE_MISSION</td>
        <td><abbr title="#9a9a9a">rgba(154, 154, 154, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(194, 80, 80, 1)" id="hud_colour_damage">&nbsp;</td>
        <td>125</td>
        <td>HUD_COLOUR_DAMAGE</td>
        <td><abbr title="#c25050">rgba(194, 80, 80, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(252, 115, 201, 1)" id="hud_colour_pinklight">&nbsp;</td>
        <td>126</td>
        <td>HUD_COLOUR_PINKLIGHT</td>
        <td><abbr title="#fc73c9">rgba(252, 115, 201, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(252, 177, 49, 1)" id="hud_colour_pm_mitem_highlight">&nbsp;</td>
        <td>127</td>
        <td>HUD_COLOUR_PM_MITEM_HIGHLIGHT</td>
        <td><abbr title="#fcb131">rgba(252, 177, 49, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 1)" id="hud_colour_script_variable">&nbsp;</td>
        <td>128</td>
        <td>HUD_COLOUR_SCRIPT_VARIABLE</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(109, 247, 204, 1)" id="hud_colour_yoga">&nbsp;</td>
        <td>129</td>
        <td>HUD_COLOUR_YOGA</td>
        <td><abbr title="#6df7cc">rgba(109, 247, 204, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(241, 101, 34, 1)" id="hud_colour_tennis">&nbsp;</td>
        <td>130</td>
        <td>HUD_COLOUR_TENNIS</td>
        <td><abbr title="#f16522">rgba(241, 101, 34, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(214, 189, 97, 1)" id="hud_colour_golf">&nbsp;</td>
        <td>131</td>
        <td>HUD_COLOUR_GOLF</td>
        <td><abbr title="#d6bd61">rgba(214, 189, 97, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(112, 25, 25, 1)" id="hud_colour_shooting_range">&nbsp;</td>
        <td>132</td>
        <td>HUD_COLOUR_SHOOTING_RANGE</td>
        <td><a href="#hud_colour_reddark">HUD_COLOUR_REDDARK</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(47, 92, 115, 1)" id="hud_colour_flight_school">&nbsp;</td>
        <td>133</td>
        <td>HUD_COLOUR_FLIGHT_SCHOOL</td>
        <td><a href="#hud_colour_bluedark">HUD_COLOUR_BLUEDARK</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 182, 229, 1)" id="hud_colour_north_blue">&nbsp;</td>
        <td>134</td>
        <td>HUD_COLOUR_NORTH_BLUE</td>
        <td><a href="#hud_colour_blue">HUD_COLOUR_BLUE</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(234, 153, 28, 1)" id="hud_colour_social_club">&nbsp;</td>
        <td>135</td>
        <td>HUD_COLOUR_SOCIAL_CLUB</td>
        <td><abbr title="#ea991c">rgba(234, 153, 28, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(11, 55, 123, 1)" id="hud_colour_platform_blue">&nbsp;</td>
        <td>136</td>
        <td>HUD_COLOUR_PLATFORM_BLUE</td>
        <td><abbr title="#0b377b">rgba(11, 55, 123, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(146, 200, 62, 1)" id="hud_colour_platform_green">&nbsp;</td>
        <td>137</td>
        <td>HUD_COLOUR_PLATFORM_GREEN</td>
        <td><abbr title="#92c83e">rgba(146, 200, 62, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(234, 153, 28, 1)" id="hud_colour_platform_grey">&nbsp;</td>
        <td>138</td>
        <td>HUD_COLOUR_PLATFORM_GREY</td>
        <td><abbr title="#ea991c">rgba(234, 153, 28, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(66, 89, 148, 1)" id="hud_colour_facebook_blue">&nbsp;</td>
        <td>139</td>
        <td>HUD_COLOUR_FACEBOOK_BLUE</td>
        <td><abbr title="#425994">rgba(66, 89, 148, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 0.7294117647058823)" id="hud_colour_ingame_bg">&nbsp;</td>
        <td>140</td>
        <td>HUD_COLOUR_INGAME_BG</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 186)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(114, 204, 114, 1)" id="hud_colour_darts">&nbsp;</td>
        <td>141</td>
        <td>HUD_COLOUR_DARTS</td>
        <td><a href="#hud_colour_green">HUD_COLOUR_GREEN</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(164, 76, 242, 1)" id="hud_colour_waypoint">&nbsp;</td>
        <td>142</td>
        <td>HUD_COLOUR_WAYPOINT</td>
        <td><abbr title="#a44cf2">rgba(164, 76, 242, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(101, 180, 212, 1)" id="hud_colour_michael">&nbsp;</td>
        <td>143</td>
        <td>HUD_COLOUR_MICHAEL</td>
        <td><abbr title="#65b4d4">rgba(101, 180, 212, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(171, 237, 171, 1)" id="hud_colour_franklin">&nbsp;</td>
        <td>144</td>
        <td>HUD_COLOUR_FRANKLIN</td>
        <td><abbr title="#abedab">rgba(171, 237, 171, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 163, 87, 1)" id="hud_colour_trevor">&nbsp;</td>
        <td>145</td>
        <td>HUD_COLOUR_TREVOR</td>
        <td><abbr title="#ffa357">rgba(255, 163, 87, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 240, 240, 1)" id="hud_colour_golf_p1">&nbsp;</td>
        <td>146</td>
        <td>HUD_COLOUR_GOLF_P1</td>
        <td><a href="#hud_colour_white">HUD_COLOUR_WHITE</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(235, 239, 30, 1)" id="hud_colour_golf_p2">&nbsp;</td>
        <td>147</td>
        <td>HUD_COLOUR_GOLF_P2</td>
        <td><abbr title="#ebef1e">rgba(235, 239, 30, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 149, 14, 1)" id="hud_colour_golf_p3">&nbsp;</td>
        <td>148</td>
        <td>HUD_COLOUR_GOLF_P3</td>
        <td><abbr title="#ff950e">rgba(255, 149, 14, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(246, 60, 161, 1)" id="hud_colour_golf_p4">&nbsp;</td>
        <td>149</td>
        <td>HUD_COLOUR_GOLF_P4</td>
        <td><abbr title="#f63ca1">rgba(246, 60, 161, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(210, 166, 249, 1)" id="hud_colour_waypointlight">&nbsp;</td>
        <td>150</td>
        <td>HUD_COLOUR_WAYPOINTLIGHT</td>
        <td><abbr title="#d2a6f9">rgba(210, 166, 249, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(82, 38, 121, 1)" id="hud_colour_waypointdark">&nbsp;</td>
        <td>151</td>
        <td>HUD_COLOUR_WAYPOINTDARK</td>
        <td><abbr title="#522679">rgba(82, 38, 121, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 0.30196078431372547)" id="hud_colour_panel_light">&nbsp;</td>
        <td>152</td>
        <td>HUD_COLOUR_PANEL_LIGHT</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 77)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(72, 103, 116, 1)" id="hud_colour_michael_dark">&nbsp;</td>
        <td>153</td>
        <td>HUD_COLOUR_MICHAEL_DARK</td>
        <td><abbr title="#486774">rgba(72, 103, 116, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(85, 118, 85, 1)" id="hud_colour_franklin_dark">&nbsp;</td>
        <td>154</td>
        <td>HUD_COLOUR_FRANKLIN_DARK</td>
        <td><abbr title="#557655">rgba(85, 118, 85, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(127, 81, 43, 1)" id="hud_colour_trevor_dark">&nbsp;</td>
        <td>155</td>
        <td>HUD_COLOUR_TREVOR_DARK</td>
        <td><abbr title="#7f512b">rgba(127, 81, 43, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 200, 80, 1)" id="hud_colour_objective_route">&nbsp;</td>
        <td>156</td>
        <td>HUD_COLOUR_OBJECTIVE_ROUTE</td>
        <td><a href="#hud_colour_yellow">HUD_COLOUR_YELLOW</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 0.8431372549019608)" id="hud_colour_pausemap_tint">&nbsp;</td>
        <td>157</td>
        <td>HUD_COLOUR_PAUSEMAP_TINT</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 215)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(100, 100, 100, 0.4980392156862745)" id="hud_colour_pause_deselect">&nbsp;</td>
        <td>158</td>
        <td>HUD_COLOUR_PAUSE_DESELECT</td>
        <td><abbr title="#646464">rgba(100, 100, 100, 127)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(45, 110, 185, 1)" id="hud_colour_pm_weapons_purchasable">&nbsp;</td>
        <td>159</td>
        <td>HUD_COLOUR_PM_WEAPONS_PURCHASABLE</td>
        <td><a href="#hud_colour_freemode">HUD_COLOUR_FREEMODE</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 240, 240, 0.7490196078431373)" id="hud_colour_pm_weapons_locked">&nbsp;</td>
        <td>160</td>
        <td>HUD_COLOUR_PM_WEAPONS_LOCKED</td>
        <td><abbr title="#f0f0f0">rgba(240, 240, 240, 191)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 0.7294117647058823)" id="hud_colour_end_screen_bg">&nbsp;</td>
        <td>161</td>
        <td>HUD_COLOUR_END_SCREEN_BG</td>
        <td><a href="#hud_colour_ingame_bg">HUD_COLOUR_INGAME_BG</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(224, 50, 50, 1)" id="hud_colour_chop">&nbsp;</td>
        <td>162</td>
        <td>HUD_COLOUR_CHOP</td>
        <td><a href="#hud_colour_red">HUD_COLOUR_RED</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 0.8431372549019608)" id="hud_colour_pausemap_tint_half">&nbsp;</td>
        <td>163</td>
        <td>HUD_COLOUR_PAUSEMAP_TINT_HALF</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 215)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 71, 133, 1)" id="hud_colour_north_blue_official">&nbsp;</td>
        <td>164</td>
        <td>HUD_COLOUR_NORTH_BLUE_OFFICIAL</td>
        <td><abbr title="#004785">rgba(0, 71, 133, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 0, 1)" id="hud_colour_script_variable_2">&nbsp;</td>
        <td>165</td>
        <td>HUD_COLOUR_SCRIPT_VARIABLE_2</td>
        <td><abbr title="#000000">rgba(0, 0, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(33, 118, 37, 1)" id="hud_colour_h">&nbsp;</td>
        <td>166</td>
        <td>HUD_COLOUR_H</td>
        <td><abbr title="#217625">rgba(33, 118, 37, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(37, 102, 40, 1)" id="hud_colour_hdark">&nbsp;</td>
        <td>167</td>
        <td>HUD_COLOUR_HDARK</td>
        <td><abbr title="#256628">rgba(37, 102, 40, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(234, 153, 28, 1)" id="hud_colour_t">&nbsp;</td>
        <td>168</td>
        <td>HUD_COLOUR_T</td>
        <td><abbr title="#ea991c">rgba(234, 153, 28, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(225, 140, 8, 1)" id="hud_colour_tdark">&nbsp;</td>
        <td>169</td>
        <td>HUD_COLOUR_TDARK</td>
        <td><abbr title="#e18c08">rgba(225, 140, 8, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(20, 40, 0, 1)" id="hud_colour_hshard">&nbsp;</td>
        <td>170</td>
        <td>HUD_COLOUR_HSHARD</td>
        <td><abbr title="#142800">rgba(20, 40, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(48, 255, 255, 1)" id="hud_colour_controller_michael">&nbsp;</td>
        <td>171</td>
        <td>HUD_COLOUR_CONTROLLER_MICHAEL</td>
        <td><abbr title="#30ffff">rgba(48, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(48, 255, 0, 1)" id="hud_colour_controller_franklin">&nbsp;</td>
        <td>172</td>
        <td>HUD_COLOUR_CONTROLLER_FRANKLIN</td>
        <td><abbr title="#30ff00">rgba(48, 255, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(176, 80, 0, 1)" id="hud_colour_controller_trevor">&nbsp;</td>
        <td>173</td>
        <td>HUD_COLOUR_CONTROLLER_TREVOR</td>
        <td><abbr title="#b05000">rgba(176, 80, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(127, 0, 0, 1)" id="hud_colour_controller_chop">&nbsp;</td>
        <td>174</td>
        <td>HUD_COLOUR_CONTROLLER_CHOP</td>
        <td><abbr title="#7f0000">rgba(127, 0, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(53, 166, 224, 1)" id="hud_colour_video_editor_video">&nbsp;</td>
        <td>175</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_VIDEO</td>
        <td><abbr title="#35a6e0">rgba(53, 166, 224, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(162, 79, 157, 1)" id="hud_colour_video_editor_audio">&nbsp;</td>
        <td>176</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_AUDIO</td>
        <td><abbr title="#a24f9d">rgba(162, 79, 157, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(104, 192, 141, 1)" id="hud_colour_video_editor_text">&nbsp;</td>
        <td>177</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_TEXT</td>
        <td><abbr title="#68c08d">rgba(104, 192, 141, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(29, 100, 153, 1)" id="hud_colour_hb_blue">&nbsp;</td>
        <td>178</td>
        <td>HUD_COLOUR_HB_BLUE</td>
        <td><abbr title="#1d6499">rgba(29, 100, 153, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(234, 153, 28, 1)" id="hud_colour_hb_yellow">&nbsp;</td>
        <td>179</td>
        <td>HUD_COLOUR_HB_YELLOW</td>
        <td><abbr title="#ea991c">rgba(234, 153, 28, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 160, 1, 1)" id="hud_colour_video_editor_score">&nbsp;</td>
        <td>180</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_SCORE</td>
        <td><abbr title="#f0a001">rgba(240, 160, 1, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(59, 34, 57, 1)" id="hud_colour_video_editor_audio_fadeout">&nbsp;</td>
        <td>181</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_AUDIO_FADEOUT</td>
        <td><abbr title="#3b2239">rgba(59, 34, 57, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(41, 68, 53, 1)" id="hud_colour_video_editor_text_fadeout">&nbsp;</td>
        <td>182</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_TEXT_FADEOUT</td>
        <td><abbr title="#294435">rgba(41, 68, 53, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(82, 58, 10, 1)" id="hud_colour_video_editor_score_fadeout">&nbsp;</td>
        <td>183</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_SCORE_FADEOUT</td>
        <td><abbr title="#523a0a">rgba(82, 58, 10, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(37, 102, 40, 0.7294117647058823)" id="hud_colour_heist_background">&nbsp;</td>
        <td>184</td>
        <td>HUD_COLOUR_HEIST_BACKGROUND</td>
        <td><abbr title="#256628">rgba(37, 102, 40, 186)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 200, 80, 1)" id="hud_colour_video_editor_ambient">&nbsp;</td>
        <td>185</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_AMBIENT</td>
        <td><a href="#hud_colour_yellow">HUD_COLOUR_YELLOW</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(80, 70, 34, 1)" id="hud_colour_video_editor_ambient_fadeout">&nbsp;</td>
        <td>186</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_AMBIENT_FADEOUT</td>
        <td><abbr title="#504622">rgba(80, 70, 34, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 133, 85, 1)" id="hud_colour_video_editor_ambient_dark">&nbsp;</td>
        <td>187</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_AMBIENT_DARK</td>
        <td><a href="#hud_colour_orange">HUD_COLOUR_ORANGE</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 194, 170, 1)" id="hud_colour_video_editor_ambient_light">&nbsp;</td>
        <td>188</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_AMBIENT_LIGHT</td>
        <td><a href="#hud_colour_orangelight">HUD_COLOUR_ORANGELIGHT</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 133, 85, 1)" id="hud_colour_video_editor_ambient_mid">&nbsp;</td>
        <td>189</td>
        <td>HUD_COLOUR_VIDEO_EDITOR_AMBIENT_MID</td>
        <td><a href="#hud_colour_orange">HUD_COLOUR_ORANGE</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(240, 200, 80, 1)" id="hud_colour_low_flow">&nbsp;</td>
        <td>190</td>
        <td>HUD_COLOUR_LOW_FLOW</td>
        <td><a href="#hud_colour_yellow">HUD_COLOUR_YELLOW</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(126, 107, 41, 1)" id="hud_colour_low_flow_dark">&nbsp;</td>
        <td>191</td>
        <td>HUD_COLOUR_LOW_FLOW_DARK</td>
        <td><a href="#hud_colour_yellowdark">HUD_COLOUR_YELLOWDARK</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(247, 159, 123, 1)" id="hud_colour_g1">&nbsp;</td>
        <td>192</td>
        <td>HUD_COLOUR_G1</td>
        <td><abbr title="#f79f7b">rgba(247, 159, 123, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(226, 134, 187, 1)" id="hud_colour_g2">&nbsp;</td>
        <td>193</td>
        <td>HUD_COLOUR_G2</td>
        <td><abbr title="#e286bb">rgba(226, 134, 187, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(239, 238, 151, 1)" id="hud_colour_g3">&nbsp;</td>
        <td>194</td>
        <td>HUD_COLOUR_G3</td>
        <td><abbr title="#efee97">rgba(239, 238, 151, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(113, 169, 175, 1)" id="hud_colour_g4">&nbsp;</td>
        <td>195</td>
        <td>HUD_COLOUR_G4</td>
        <td><abbr title="#71a9af">rgba(113, 169, 175, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(160, 140, 193, 1)" id="hud_colour_g5">&nbsp;</td>
        <td>196</td>
        <td>HUD_COLOUR_G5</td>
        <td><abbr title="#a08cc1">rgba(160, 140, 193, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(141, 206, 167, 1)" id="hud_colour_g6">&nbsp;</td>
        <td>197</td>
        <td>HUD_COLOUR_G6</td>
        <td><abbr title="#8dcea7">rgba(141, 206, 167, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(181, 214, 234, 1)" id="hud_colour_g7">&nbsp;</td>
        <td>198</td>
        <td>HUD_COLOUR_G7</td>
        <td><abbr title="#b5d6ea">rgba(181, 214, 234, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(178, 144, 132, 1)" id="hud_colour_g8">&nbsp;</td>
        <td>199</td>
        <td>HUD_COLOUR_G8</td>
        <td><abbr title="#b29084">rgba(178, 144, 132, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 132, 114, 1)" id="hud_colour_g9">&nbsp;</td>
        <td>200</td>
        <td>HUD_COLOUR_G9</td>
        <td><abbr title="#008472">rgba(0, 132, 114, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(216, 85, 117, 1)" id="hud_colour_g10">&nbsp;</td>
        <td>201</td>
        <td>HUD_COLOUR_G10</td>
        <td><abbr title="#d85575">rgba(216, 85, 117, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(30, 100, 152, 1)" id="hud_colour_g11">&nbsp;</td>
        <td>202</td>
        <td>HUD_COLOUR_G11</td>
        <td><abbr title="#1e6498">rgba(30, 100, 152, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(43, 181, 117, 1)" id="hud_colour_g12">&nbsp;</td>
        <td>203</td>
        <td>HUD_COLOUR_G12</td>
        <td><abbr title="#2bb575">rgba(43, 181, 117, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(233, 141, 79, 1)" id="hud_colour_g13">&nbsp;</td>
        <td>204</td>
        <td>HUD_COLOUR_G13</td>
        <td><abbr title="#e98d4f">rgba(233, 141, 79, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(137, 210, 215, 1)" id="hud_colour_g14">&nbsp;</td>
        <td>205</td>
        <td>HUD_COLOUR_G14</td>
        <td><abbr title="#89d2d7">rgba(137, 210, 215, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(134, 125, 141, 1)" id="hud_colour_g15">&nbsp;</td>
        <td>206</td>
        <td>HUD_COLOUR_G15</td>
        <td><abbr title="#867d8d">rgba(134, 125, 141, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(109, 34, 33, 1)" id="hud_colour_adversary">&nbsp;</td>
        <td>207</td>
        <td>HUD_COLOUR_ADVERSARY</td>
        <td><abbr title="#6d2221">rgba(109, 34, 33, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 0, 0, 1)" id="hud_colour_degen_red">&nbsp;</td>
        <td>208</td>
        <td>HUD_COLOUR_DEGEN_RED</td>
        <td><abbr title="#ff0000">rgba(255, 0, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 0, 1)" id="hud_colour_degen_yellow">&nbsp;</td>
        <td>209</td>
        <td>HUD_COLOUR_DEGEN_YELLOW</td>
        <td><abbr title="#ffff00">rgba(255, 255, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 255, 0, 1)" id="hud_colour_degen_green">&nbsp;</td>
        <td>210</td>
        <td>HUD_COLOUR_DEGEN_GREEN</td>
        <td><abbr title="#00ff00">rgba(0, 255, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 255, 255, 1)" id="hud_colour_degen_cyan">&nbsp;</td>
        <td>211</td>
        <td>HUD_COLOUR_DEGEN_CYAN</td>
        <td><abbr title="#00ffff">rgba(0, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 0, 255, 1)" id="hud_colour_degen_blue">&nbsp;</td>
        <td>212</td>
        <td>HUD_COLOUR_DEGEN_BLUE</td>
        <td><abbr title="#0000ff">rgba(0, 0, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 0, 255, 1)" id="hud_colour_degen_magenta">&nbsp;</td>
        <td>213</td>
        <td>HUD_COLOUR_DEGEN_MAGENTA</td>
        <td><abbr title="#ff00ff">rgba(255, 0, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(38, 136, 234, 1)" id="hud_colour_stunt_1">&nbsp;</td>
        <td>214</td>
        <td>HUD_COLOUR_STUNT_1</td>
        <td><abbr title="#2688ea">rgba(38, 136, 234, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(224, 50, 50, 1)" id="hud_colour_stunt_2">&nbsp;</td>
        <td>215</td>
        <td>HUD_COLOUR_STUNT_2</td>
        <td><a href="#hud_colour_red">HUD_COLOUR_RED</a></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(154, 178, 54, 1)" id="hud_colour_special_race_series">&nbsp;</td>
        <td>216</td>
        <td>HUD_COLOUR_SPECIAL_RACE_SERIES</td>
        <td><abbr title="#9ab236">rgba(154, 178, 54, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(93, 107, 45, 1)" id="hud_colour_special_race_series_dark">&nbsp;</td>
        <td>217</td>
        <td>HUD_COLOUR_SPECIAL_RACE_SERIES_DARK</td>
        <td><abbr title="#5d6b2d">rgba(93, 107, 45, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(206, 169, 13, 1)" id="hud_colour_cs">&nbsp;</td>
        <td>218</td>
        <td>HUD_COLOUR_CS</td>
        <td><abbr title="#cea90d">rgba(206, 169, 13, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(103, 84, 6, 1)" id="hud_colour_cs_dark">&nbsp;</td>
        <td>219</td>
        <td>HUD_COLOUR_CS_DARK</td>
        <td><abbr title="#675406">rgba(103, 84, 6, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 151, 151, 1)" id="hud_colour_tech_green">&nbsp;</td>
        <td>220</td>
        <td>HUD_COLOUR_TECH_GREEN</td>
        <td><abbr title="#009797">rgba(0, 151, 151, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(5, 119, 113, 1)" id="hud_colour_tech_green_dark">&nbsp;</td>
        <td>221</td>
        <td>HUD_COLOUR_TECH_GREEN_DARK</td>
        <td><abbr title="#057771">rgba(5, 119, 113, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(151, 0, 0, 1)" id="hud_colour_tech_red">&nbsp;</td>
        <td>222</td>
        <td>HUD_COLOUR_TECH_RED</td>
        <td><abbr title="#970000">rgba(151, 0, 0, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(0, 40, 40, 1)" id="hud_colour_tech_green_very_dark">&nbsp;</td>
        <td>223</td>
        <td>HUD_COLOUR_TECH_GREEN_VERY_DARK</td>
        <td><abbr title="#002828">rgba(0, 40, 40, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_01">&nbsp;</td>
        <td>224</td>
        <td>HUD_COLOUR_PLACEHOLDER_01</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_02">&nbsp;</td>
        <td>225</td>
        <td>HUD_COLOUR_PLACEHOLDER_02</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_03">&nbsp;</td>
        <td>226</td>
        <td>HUD_COLOUR_PLACEHOLDER_03</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_04">&nbsp;</td>
        <td>227</td>
        <td>HUD_COLOUR_PLACEHOLDER_04</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_05">&nbsp;</td>
        <td>228</td>
        <td>HUD_COLOUR_PLACEHOLDER_05</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_06">&nbsp;</td>
        <td>229</td>
        <td>HUD_COLOUR_PLACEHOLDER_06</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_07">&nbsp;</td>
        <td>230</td>
        <td>HUD_COLOUR_PLACEHOLDER_07</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_08">&nbsp;</td>
        <td>231</td>
        <td>HUD_COLOUR_PLACEHOLDER_08</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_09">&nbsp;</td>
        <td>232</td>
        <td>HUD_COLOUR_PLACEHOLDER_09</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(255, 255, 255, 1)" id="hud_colour_placeholder_10">&nbsp;</td>
        <td>233</td>
        <td>HUD_COLOUR_PLACEHOLDER_10</td>
        <td><abbr title="#ffffff">rgba(255, 255, 255, 255)</abbr></td>
    </tr>
    <tr>
        <td class="color" style="--color: rgba(29, 237, 195, 1)" id="hud_colour_junk_energy">&nbsp;</td>
        <td>234</td>
        <td>HUD_COLOUR_JUNK_ENERGY</td>
        <td><abbr title="#1dedc3">rgba(29, 237, 195, 255)</abbr></td>
    </tr>
    </tbody>
</table>


<!-- another JS snippet -->
<!--
const hudColors = `[PASTE HUDCOLOR.DAT HERE]`;

function componentToHex(c) {
  var hex = c.toString(16);
  return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r, g, b) {
  return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

colors = hudColors.split(/\n/g).filter(a => a.startsWith('HUD_')).map((line, idx) => {
    const bits = line.replace(/\s+/g, ' ').split(' ');

    if (bits[1] !== 'RGBA') {
        return {
            idx,
            name: bits[0],
            alias: bits[1],
        }
    }

    return {
        idx,
        name: bits[0],
        r: parseInt(bits[2]),
        g: parseInt(bits[3]),
        b: parseInt(bits[4]),
        a: parseInt(bits[5]),
    };
})

colorTable = Object.fromEntries(colors.map(color => [color.name, color]));

colors.map(color => {
    if (color.alias) {
        const otherColor = colorTable[color.alias];

        return `
    <tr>
        <td class="color" style="--color: rgba(${otherColor.r}, ${otherColor.g}, ${otherColor.b}, ${otherColor.a / 255})" id="${color.name.toLowerCase()}">&nbsp;</td>
        <td>${color.idx}</td>
        <td>${color.name}</td>
        <td><a href="#${otherColor.name.toLowerCase()}">${otherColor.name}</a></td>
    </tr>`;
    }
    
    return `
    <tr>
        <td class="color" style="--color: rgba(${color.r}, ${color.g}, ${color.b}, ${color.a / 255})" id="${color.name.toLowerCase()}">&nbsp;</td>
        <td>${color.idx}</td>
        <td>${color.name}</td>
        <td><abbr title="${rgbToHex(color.r, color.g, color.b)}">rgba(${color.r}, ${color.g}, ${color.b}, ${color.a})</abbr></td>
    </tr>`;
}).join("")
-->