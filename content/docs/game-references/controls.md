---
title: Controls
weight: 710
---

Example
-------

### Lua

``` lua
-- checks if INPUT_CONTEXT has just been released
if IsControlJustReleased(0--[[control type]],  51--[[control index]]) then
    -- run code here
end
```

### C#

``` csharp
// checks if INPUT_CONTEXT has just been released
// assumes `using static CitizenFX.Core.API;`
if(IsControlJustReleased(0, 51))
{
   // run code here
}
```

Control types
------------

| Index | Name              |
|-------|-------------------|
| 0     | PLAYER\_CONTROL   |
| 2     | FRONTEND\_CONTROL |

Controls
--------

| Index |                       Name                       |            Default QWERTY             | Xbox Controller |
| ----- | ------------------------------------------------ | ------------------------------------- | --------------- |
| 0     | INPUT\_NEXT\_CAMERA                              | V                                     | BACK            |
| 1     | INPUT\_LOOK\_LR                                  | MOUSE RIGHT                           | RIGHT STICK     |
| 2     | INPUT\_LOOK\_UD                                  | MOUSE DOWN                            | RIGHT STICK     |
| 3     | INPUT\_LOOK\_UP\_ONLY                            | (NONE)                                | RIGHT STICK     |
| 4     | INPUT\_LOOK\_DOWN\_ONLY                          | MOUSE DOWN                            | RIGHT STICK     |
| 5     | INPUT\_LOOK\_LEFT\_ONLY                          | (NONE)                                | RIGHT STICK     |
| 6     | INPUT\_LOOK\_RIGHT\_ONLY                         | MOUSE RIGHT                           | RIGHT STICK     |
| 7     | INPUT\_CINEMATIC\_SLOWMO                         | (NONE)                                | R3              |
| 8     | INPUT\_SCRIPTED\_FLY\_UD                         | S                                     | LEFT STICK      |
| 9     | INPUT\_SCRIPTED\_FLY\_LR                         | D                                     | LEFT STICK      |
| 10    | INPUT\_SCRIPTED\_FLY\_ZUP                        | PAGEUP                                | LT              |
| 11    | INPUT\_SCRIPTED\_FLY\_ZDOWN                      | PAGEDOWN                              | RT              |
| 12    | INPUT\_WEAPON\_WHEEL\_UD                         | MOUSE DOWN                            | RIGHT STICK     |
| 13    | INPUT\_WEAPON\_WHEEL\_LR                         | MOUSE RIGHT                           | RIGHT STICK     |
| 14    | INPUT\_WEAPON\_WHEEL\_NEXT                       | SCROLLWHEEL DOWN                      | DPAD RIGHT      |
| 15    | INPUT\_WEAPON\_WHEEL\_PREV                       | SCROLLWHEEL UP                        | DPAD LEFT       |
| 16    | INPUT\_SELECT\_NEXT\_WEAPON                      | SCROLLWHEEL DOWN                      | (NONE)          |
| 17    | INPUT\_SELECT\_PREV\_WEAPON                      | SCROLLWHEEL UP                        | (NONE)          |
| 18    | INPUT\_SKIP\_CUTSCENE                            | ENTER / LEFT MOUSE BUTTON / SPACEBAR  | A               |
| 19    | INPUT\_CHARACTER\_WHEEL                          | LEFT ALT                              | DPAD DOWN       |
| 20    | INPUT\_MULTIPLAYER\_INFO                         | Z                                     | DPAD DOWN       |
| 21    | INPUT\_SPRINT                                    | LEFT SHIFT                            | A               |
| 22    | INPUT\_JUMP                                      | SPACEBAR                              | X               |
| 23    | INPUT\_ENTER                                     | F                                     | Y               |
| 24    | INPUT\_ATTACK                                    | LEFT MOUSE BUTTON                     | RT              |
| 25    | INPUT\_AIM                                       | RIGHT MOUSE BUTTON                    | LT              |
| 26    | INPUT\_LOOK\_BEHIND                              | C                                     | R3              |
| 27    | INPUT\_PHONE                                     | ARROW UP / SCROLLWHEEL BUTTON (PRESS) | DPAD UP         |
| 28    | INPUT\_SPECIAL\_ABILITY                          | (NONE)                                | L3              |
| 29    | INPUT\_SPECIAL\_ABILITY\_SECONDARY               | B                                     | R3              |
| 30    | INPUT\_MOVE\_LR                                  | D                                     | LEFT STICK      |
| 31    | INPUT\_MOVE\_UD                                  | S                                     | LEFT STICK      |
| 32    | INPUT\_MOVE\_UP\_ONLY                            | W                                     | LEFT STICK      |
| 33    | INPUT\_MOVE\_DOWN\_ONLY                          | S                                     | LEFT STICK      |
| 34    | INPUT\_MOVE\_LEFT\_ONLY                          | A                                     | LEFT STICK      |
| 35    | INPUT\_MOVE\_RIGHT\_ONLY                         | D                                     | LEFT STICK      |
| 36    | INPUT\_DUCK                                      | LEFT CTRL                             | L3              |
| 37    | INPUT\_SELECT\_WEAPON                            | TAB                                   | LB              |
| 38    | INPUT\_PICKUP                                    | E                                     | LB              |
| 39    | INPUT\_SNIPER\_ZOOM                              | \[                                    | LEFT STICK      |
| 40    | INPUT\_SNIPER\_ZOOM\_IN\_ONLY                    | \]                                    | LEFT STICK      |
| 41    | INPUT\_SNIPER\_ZOOM\_OUT\_ONLY                   | \[                                    | LEFT STICK      |
| 42    | INPUT\_SNIPER\_ZOOM\_IN\_SECONDARY               | \]                                    | DPAD UP         |
| 43    | INPUT\_SNIPER\_ZOOM\_OUT\_SECONDARY              | \[                                    | DPAD DOWN       |
| 44    | INPUT\_COVER                                     | Q                                     | RB              |
| 45    | INPUT\_RELOAD                                    | R                                     | B               |
| 46    | INPUT\_TALK                                      | E                                     | DPAD RIGHT      |
| 47    | INPUT\_DETONATE                                  | G                                     | DPAD LEFT       |
| 48    | INPUT\_HUD\_SPECIAL                              | Z                                     | DPAD DOWN       |
| 49    | INPUT\_ARREST                                    | F                                     | Y               |
| 50    | INPUT\_ACCURATE\_AIM                             | SCROLLWHEEL DOWN                      | R3              |
| 51    | INPUT\_CONTEXT                                   | E                                     | DPAD RIGHT      |
| 52    | INPUT\_CONTEXT\_SECONDARY                        | Q                                     | DPAD LEFT       |
| 53    | INPUT\_WEAPON\_SPECIAL                           | (NONE)                                | Y               |
| 54    | INPUT\_WEAPON\_SPECIAL\_TWO                      | E                                     | DPAD RIGHT      |
| 55    | INPUT\_DIVE                                      | SPACEBAR                              | RB              |
| 56    | INPUT\_DROP\_WEAPON                              | F9                                    | Y               |
| 57    | INPUT\_DROP\_AMMO                                | F10                                   | B               |
| 58    | INPUT\_THROW\_GRENADE                            | G                                     | DPAD LEFT       |
| 59    | INPUT\_VEH\_MOVE\_LR                             | D                                     | LEFT STICK      |
| 60    | INPUT\_VEH\_MOVE\_UD                             | LEFT CTRL                             | LEFT STICK      |
| 61    | INPUT\_VEH\_MOVE\_UP\_ONLY                       | LEFT SHIFT                            | LEFT STICK      |
| 62    | INPUT\_VEH\_MOVE\_DOWN\_ONLY                     | LEFT CTRL                             | LEFT STICK      |
| 63    | INPUT\_VEH\_MOVE\_LEFT\_ONLY                     | A                                     | LEFT STICK      |
| 64    | INPUT\_VEH\_MOVE\_RIGHT\_ONLY                    | D                                     | LEFT STICK      |
| 65    | INPUT\_VEH\_SPECIAL                              | (NONE)                                | (NONE)          |
| 66    | INPUT\_VEH\_GUN\_LR                              | MOUSE RIGHT                           | RIGHT STICK     |
| 67    | INPUT\_VEH\_GUN\_UD                              | MOUSE DOWN                            | RIGHT STICK     |
| 68    | INPUT\_VEH\_AIM                                  | RIGHT MOUSE BUTTON                    | LB              |
| 69    | INPUT\_VEH\_ATTACK                               | LEFT MOUSE BUTTON                     | RB              |
| 70    | INPUT\_VEH\_ATTACK2                              | RIGHT MOUSE BUTTON                    | A               |
| 71    | INPUT\_VEH\_ACCELERATE                           | W                                     | RT              |
| 72    | INPUT\_VEH\_BRAKE                                | S                                     | LT              |
| 73    | INPUT\_VEH\_DUCK                                 | X                                     | A               |
| 74    | INPUT\_VEH\_HEADLIGHT                            | H                                     | DPAD RIGHT      |
| 75    | INPUT\_VEH\_EXIT                                 | F                                     | Y               |
| 76    | INPUT\_VEH\_HANDBRAKE                            | SPACEBAR                              | RB              |
| 77    | INPUT\_VEH\_HOTWIRE\_LEFT                        | W                                     | LT              |
| 78    | INPUT\_VEH\_HOTWIRE\_RIGHT                       | S                                     | RT              |
| 79    | INPUT\_VEH\_LOOK\_BEHIND                         | C                                     | R3              |
| 80    | INPUT\_VEH\_CIN\_CAM                             | R                                     | B               |
| 81    | INPUT\_VEH\_NEXT\_RADIO                          | .                                     | (NONE)          |
| 82    | INPUT\_VEH\_PREV\_RADIO                          | ,                                     | (NONE)          |
| 83    | INPUT\_VEH\_NEXT\_RADIO\_TRACK                   | =                                     | (NONE)          |
| 84    | INPUT\_VEH\_PREV\_RADIO\_TRACK                   | -                                     | (NONE)          |
| 85    | INPUT\_VEH\_RADIO\_WHEEL                         | Q                                     | DPAD LEFT       |
| 86    | INPUT\_VEH\_HORN                                 | E                                     | L3              |
| 87    | INPUT\_VEH\_FLY\_THROTTLE\_UP                    | W                                     | RT              |
| 88    | INPUT\_VEH\_FLY\_THROTTLE\_DOWN                  | S                                     | LT              |
| 89    | INPUT\_VEH\_FLY\_YAW\_LEFT                       | A                                     | LB              |
| 90    | INPUT\_VEH\_FLY\_YAW\_RIGHT                      | D                                     | RB              |
| 91    | INPUT\_VEH\_PASSENGER\_AIM                       | RIGHT MOUSE BUTTON                    | LT              |
| 92    | INPUT\_VEH\_PASSENGER\_ATTACK                    | LEFT MOUSE BUTTON                     | RT              |
| 93    | INPUT\_VEH\_SPECIAL\_ABILITY\_FRANKLIN           | (NONE)                                | R3              |
| 94    | INPUT\_VEH\_STUNT\_UD                            | (NONE)                                | (NONE)          |
| 95    | INPUT\_VEH\_CINEMATIC\_UD                        | MOUSE DOWN                            | RIGHT STICK     |
| 96    | INPUT\_VEH\_CINEMATIC\_UP\_ONLY                  | NUMPAD- / SCROLLWHEEL UP              | (NONE)          |
| 97    | INPUT\_VEH\_CINEMATIC\_DOWN\_ONLY                | NUMPAD+ / SCROLLWHEEL DOWN            | (NONE)          |
| 98    | INPUT\_VEH\_CINEMATIC\_LR                        | MOUSE RIGHT                           | RIGHT STICK     |
| 99    | INPUT\_VEH\_SELECT\_NEXT\_WEAPON                 | SCROLLWHEEL UP                        | X               |
| 100   | INPUT\_VEH\_SELECT\_PREV\_WEAPON                 | \[                                    | (NONE)          |
| 101   | INPUT\_VEH\_ROOF                                 | H                                     | DPAD RIGHT      |
| 102   | INPUT\_VEH\_JUMP                                 | SPACEBAR                              | RB              |
| 103   | INPUT\_VEH\_GRAPPLING\_HOOK                      | E                                     | DPAD RIGHT      |
| 104   | INPUT\_VEH\_SHUFFLE                              | H                                     | DPAD RIGHT      |
| 105   | INPUT\_VEH\_DROP\_PROJECTILE                     | X                                     | A               |
| 106   | INPUT\_VEH\_MOUSE\_CONTROL\_OVERRIDE             | LEFT MOUSE BUTTON                     | (NONE)          |
| 107   | INPUT\_VEH\_FLY\_ROLL\_LR                        | NUMPAD 6                              | LEFT STICK      |
| 108   | INPUT\_VEH\_FLY\_ROLL\_LEFT\_ONLY                | NUMPAD 4                              | LEFT STICK      |
| 109   | INPUT\_VEH\_FLY\_ROLL\_RIGHT\_ONLY               | NUMPAD 6                              | LEFT STICK      |
| 110   | INPUT\_VEH\_FLY\_PITCH\_UD                       | NUMPAD 5                              | LEFT STICK      |
| 111   | INPUT\_VEH\_FLY\_PITCH\_UP\_ONLY                 | NUMPAD 8                              | LEFT STICK      |
| 112   | INPUT\_VEH\_FLY\_PITCH\_DOWN\_ONLY               | NUMPAD 5                              | LEFT STICK      |
| 113   | INPUT\_VEH\_FLY\_UNDERCARRIAGE                   | G                                     | L3              |
| 114   | INPUT\_VEH\_FLY\_ATTACK                          | RIGHT MOUSE BUTTON                    | A               |
| 115   | INPUT\_VEH\_FLY\_SELECT\_NEXT\_WEAPON            | SCROLLWHEEL UP                        | DPAD LEFT       |
| 116   | INPUT\_VEH\_FLY\_SELECT\_PREV\_WEAPON            | \[                                    | (NONE)          |
| 117   | INPUT\_VEH\_FLY\_SELECT\_TARGET\_LEFT            | NUMPAD 7                              | LB              |
| 118   | INPUT\_VEH\_FLY\_SELECT\_TARGET\_RIGHT           | NUMPAD 9                              | RB              |
| 119   | INPUT\_VEH\_FLY\_VERTICAL\_FLIGHT\_MODE          | E                                     | DPAD RIGHT      |
| 120   | INPUT\_VEH\_FLY\_DUCK                            | X                                     | A               |
| 121   | INPUT\_VEH\_FLY\_ATTACK\_CAMERA                  | INSERT                                | R3              |
| 122   | INPUT\_VEH\_FLY\_MOUSE\_CONTROL\_OVERRIDE        | LEFT MOUSE BUTTON                     | (NONE)          |
| 123   | INPUT\_VEH\_SUB\_TURN\_LR                        | NUMPAD 6                              | LEFT STICK      |
| 124   | INPUT\_VEH\_SUB\_TURN\_LEFT\_ONLY                | NUMPAD 4                              | LEFT STICK      |
| 125   | INPUT\_VEH\_SUB\_TURN\_RIGHT\_ONLY               | NUMPAD 6                              | LEFT STICK      |
| 126   | INPUT\_VEH\_SUB\_PITCH\_UD                       | NUMPAD 5                              | LEFT STICK      |
| 127   | INPUT\_VEH\_SUB\_PITCH\_UP\_ONLY                 | NUMPAD 8                              | LEFT STICK      |
| 128   | INPUT\_VEH\_SUB\_PITCH\_DOWN\_ONLY               | NUMPAD 5                              | LEFT STICK      |
| 129   | INPUT\_VEH\_SUB\_THROTTLE\_UP                    | W                                     | RT              |
| 130   | INPUT\_VEH\_SUB\_THROTTLE\_DOWN                  | S                                     | LT              |
| 131   | INPUT\_VEH\_SUB\_ASCEND                          | LEFT SHIFT                            | X               |
| 132   | INPUT\_VEH\_SUB\_DESCEND                         | LEFT CTRL                             | A               |
| 133   | INPUT\_VEH\_SUB\_TURN\_HARD\_LEFT                | A                                     | LB              |
| 134   | INPUT\_VEH\_SUB\_TURN\_HARD\_RIGHT               | D                                     | RB              |
| 135   | INPUT\_VEH\_SUB\_MOUSE\_CONTROL\_OVERRIDE        | LEFT MOUSE BUTTON                     | (NONE)          |
| 136   | INPUT\_VEH\_PUSHBIKE\_PEDAL                      | W                                     | A               |
| 137   | INPUT\_VEH\_PUSHBIKE\_SPRINT                     | CAPSLOCK                              | A               |
| 138   | INPUT\_VEH\_PUSHBIKE\_FRONT\_BRAKE               | Q                                     | LT              |
| 139   | INPUT\_VEH\_PUSHBIKE\_REAR\_BRAKE                | S                                     | RT              |
| 140   | INPUT\_MELEE\_ATTACK\_LIGHT                      | R                                     | B               |
| 141   | INPUT\_MELEE\_ATTACK\_HEAVY                      | Q                                     | A               |
| 142   | INPUT\_MELEE\_ATTACK\_ALTERNATE                  | LEFT MOUSE BUTTON                     | RT              |
| 143   | INPUT\_MELEE\_BLOCK                              | SPACEBAR                              | X               |
| 144   | INPUT\_PARACHUTE\_DEPLOY                         | F / LEFT MOUSE BUTTON                 | Y               |
| 145   | INPUT\_PARACHUTE\_DETACH                         | F                                     | Y               |
| 146   | INPUT\_PARACHUTE\_TURN\_LR                       | D                                     | LEFT STICK      |
| 147   | INPUT\_PARACHUTE\_TURN\_LEFT\_ONLY               | A                                     | LEFT STICK      |
| 148   | INPUT\_PARACHUTE\_TURN\_RIGHT\_ONLY              | D                                     | LEFT STICK      |
| 149   | INPUT\_PARACHUTE\_PITCH\_UD                      | S                                     | LEFT STICK      |
| 150   | INPUT\_PARACHUTE\_PITCH\_UP\_ONLY                | W                                     | LEFT STICK      |
| 151   | INPUT\_PARACHUTE\_PITCH\_DOWN\_ONLY              | S                                     | LEFT STICK      |
| 152   | INPUT\_PARACHUTE\_BRAKE\_LEFT                    | Q                                     | LB              |
| 153   | INPUT\_PARACHUTE\_BRAKE\_RIGHT                   | E                                     | RB              |
| 154   | INPUT\_PARACHUTE\_SMOKE                          | X                                     | A               |
| 155   | INPUT\_PARACHUTE\_PRECISION\_LANDING             | LEFT SHIFT                            | (NONE)          |
| 156   | INPUT\_MAP                                       | (NONE)                                | (NONE)          |
| 157   | INPUT\_SELECT\_WEAPON\_UNARMED                   | 1                                     | (NONE)          |
| 158   | INPUT\_SELECT\_WEAPON\_MELEE                     | 2                                     | (NONE)          |
| 159   | INPUT\_SELECT\_WEAPON\_HANDGUN                   | 6                                     | (NONE)          |
| 160   | INPUT\_SELECT\_WEAPON\_SHOTGUN                   | 3                                     | (NONE)          |
| 161   | INPUT\_SELECT\_WEAPON\_SMG                       | 7                                     | (NONE)          |
| 162   | INPUT\_SELECT\_WEAPON\_AUTO\_RIFLE               | 8                                     | (NONE)          |
| 163   | INPUT\_SELECT\_WEAPON\_SNIPER                    | 9                                     | (NONE)          |
| 164   | INPUT\_SELECT\_WEAPON\_HEAVY                     | 4                                     | (NONE)          |
| 165   | INPUT\_SELECT\_WEAPON\_SPECIAL                   | 5                                     | (NONE)          |
| 166   | INPUT\_SELECT\_CHARACTER\_MICHAEL                | F5                                    | (NONE)          |
| 167   | INPUT\_SELECT\_CHARACTER\_FRANKLIN               | F6                                    | (NONE)          |
| 168   | INPUT\_SELECT\_CHARACTER\_TREVOR                 | F7                                    | (NONE)          |
| 169   | INPUT\_SELECT\_CHARACTER\_MULTIPLAYER            | F8 (CONSOLE)                          | (NONE)          |
| 170   | INPUT\_SAVE\_REPLAY\_CLIP                        | F3                                    | B               |
| 171   | INPUT\_SPECIAL\_ABILITY\_PC                      | CAPSLOCK                              | (NONE)          |
| 172   | INPUT\_CELLPHONE\_UP                             | ARROW UP                              | DPAD UP         |
| 173   | INPUT\_CELLPHONE\_DOWN                           | ARROW DOWN                            | DPAD DOWN       |
| 174   | INPUT\_CELLPHONE\_LEFT                           | ARROW LEFT                            | DPAD LEFT       |
| 175   | INPUT\_CELLPHONE\_RIGHT                          | ARROW RIGHT                           | DPAD RIGHT      |
| 176   | INPUT\_CELLPHONE\_SELECT                         | ENTER / LEFT MOUSE BUTTON             | A               |
| 177   | INPUT\_CELLPHONE\_CANCEL                         | BACKSPACE / ESC / RIGHT MOUSE BUTTON  | B               |
| 178   | INPUT\_CELLPHONE\_OPTION                         | DELETE                                | Y               |
| 179   | INPUT\_CELLPHONE\_EXTRA\_OPTION                  | SPACEBAR                              | X               |
| 180   | INPUT\_CELLPHONE\_SCROLL\_FORWARD                | SCROLLWHEEL DOWN                      | (NONE)          |
| 181   | INPUT\_CELLPHONE\_SCROLL\_BACKWARD               | SCROLLWHEEL UP                        | (NONE)          |
| 182   | INPUT\_CELLPHONE\_CAMERA\_FOCUS\_LOCK            | L                                     | RT              |
| 183   | INPUT\_CELLPHONE\_CAMERA\_GRID                   | G                                     | RB              |
| 184   | INPUT\_CELLPHONE\_CAMERA\_SELFIE                 | E                                     | R3              |
| 185   | INPUT\_CELLPHONE\_CAMERA\_DOF                    | F                                     | LB              |
| 186   | INPUT\_CELLPHONE\_CAMERA\_EXPRESSION             | X                                     | L3              |
| 187   | INPUT\_FRONTEND\_DOWN                            | ARROW DOWN                            | DPAD DOWN       |
| 188   | INPUT\_FRONTEND\_UP                              | ARROW UP                              | DPAD UP         |
| 189   | INPUT\_FRONTEND\_LEFT                            | ARROW LEFT                            | DPAD LEFT       |
| 190   | INPUT\_FRONTEND\_RIGHT                           | ARROW RIGHT                           | DPAD RIGHT      |
| 191   | INPUT\_FRONTEND\_RDOWN                           | ENTER                                 | A               |
| 192   | INPUT\_FRONTEND\_RUP                             | TAB                                   | Y               |
| 193   | INPUT\_FRONTEND\_RLEFT                           | (NONE)                                | X               |
| 194   | INPUT\_FRONTEND\_RRIGHT                          | BACKSPACE                             | B               |
| 195   | INPUT\_FRONTEND\_AXIS\_X                         | D                                     | LEFT STICK      |
| 196   | INPUT\_FRONTEND\_AXIS\_Y                         | S                                     | LEFT STICK      |
| 197   | INPUT\_FRONTEND\_RIGHT\_AXIS\_X                  | \]                                    | RIGHT STICK     |
| 198   | INPUT\_FRONTEND\_RIGHT\_AXIS\_Y                  | SCROLLWHEEL DOWN                      | RIGHT STICK     |
| 199   | INPUT\_FRONTEND\_PAUSE                           | P                                     | START           |
| 200   | INPUT\_FRONTEND\_PAUSE\_ALTERNATE                | ESC                                   | (NONE)          |
| 201   | INPUT\_FRONTEND\_ACCEPT                          | ENTER / NUMPAD ENTER                  | A               |
| 202   | INPUT\_FRONTEND\_CANCEL                          | BACKSPACE / ESC                       | B               |
| 203   | INPUT\_FRONTEND\_X                               | SPACEBAR                              | X               |
| 204   | INPUT\_FRONTEND\_Y                               | TAB                                   | Y               |
| 205   | INPUT\_FRONTEND\_LB                              | Q                                     | LB              |
| 206   | INPUT\_FRONTEND\_RB                              | E                                     | RB              |
| 207   | INPUT\_FRONTEND\_LT                              | PAGE DOWN                             | LT              |
| 208   | INPUT\_FRONTEND\_RT                              | PAGE UP                               | RT              |
| 209   | INPUT\_FRONTEND\_LS                              | LEFT SHIFT                            | L3              |
| 210   | INPUT\_FRONTEND\_RS                              | LEFT CONTROL                          | R3              |
| 211   | INPUT\_FRONTEND\_LEADERBOARD                     | TAB                                   | RB              |
| 212   | INPUT\_FRONTEND\_SOCIAL\_CLUB                    | HOME                                  | BACK            |
| 213   | INPUT\_FRONTEND\_SOCIAL\_CLUB\_SECONDARY         | HOME                                  | RB              |
| 214   | INPUT\_FRONTEND\_DELETE                          | DELETE                                | X               |
| 215   | INPUT\_FRONTEND\_ENDSCREEN\_ACCEPT               | ENTER                                 | A               |
| 216   | INPUT\_FRONTEND\_ENDSCREEN\_EXPAND               | SPACEBAR                              | X               |
| 217   | INPUT\_FRONTEND\_SELECT                          | CAPSLOCK                              | BACK            |
| 218   | INPUT\_SCRIPT\_LEFT\_AXIS\_X                     | D                                     | LEFT STICK      |
| 219   | INPUT\_SCRIPT\_LEFT\_AXIS\_Y                     | S                                     | LEFT STICK      |
| 220   | INPUT\_SCRIPT\_RIGHT\_AXIS\_X                    | MOUSE RIGHT                           | RIGHT STICK     |
| 221   | INPUT\_SCRIPT\_RIGHT\_AXIS\_Y                    | MOUSE DOWN                            | RIGHT STICK     |
| 222   | INPUT\_SCRIPT\_RUP                               | RIGHT MOUSE BUTTON                    | Y               |
| 223   | INPUT\_SCRIPT\_RDOWN                             | LEFT MOUSE BUTTON                     | A               |
| 224   | INPUT\_SCRIPT\_RLEFT                             | LEFT CTRL                             | X               |
| 225   | INPUT\_SCRIPT\_RRIGHT                            | RIGHT MOUSE BUTTON                    | B               |
| 226   | INPUT\_SCRIPT\_LB                                | (NONE)                                | LB              |
| 227   | INPUT\_SCRIPT\_RB                                | (NONE)                                | RB              |
| 228   | INPUT\_SCRIPT\_LT                                | (NONE)                                | LT              |
| 229   | INPUT\_SCRIPT\_RT                                | LEFT MOUSE BUTTON                     | RT              |
| 230   | INPUT\_SCRIPT\_LS                                | (NONE)                                | L3              |
| 231   | INPUT\_SCRIPT\_RS                                | (NONE)                                | R3              |
| 232   | INPUT\_SCRIPT\_PAD\_UP                           | W                                     | DPAD UP         |
| 233   | INPUT\_SCRIPT\_PAD\_DOWN                         | S                                     | DPAD DOWN       |
| 234   | INPUT\_SCRIPT\_PAD\_LEFT                         | A                                     | DPAD LEFT       |
| 235   | INPUT\_SCRIPT\_PAD\_RIGHT                        | D                                     | DPAD RIGHT      |
| 236   | INPUT\_SCRIPT\_SELECT                            | V                                     | BACK            |
| 237   | INPUT\_CURSOR\_ACCEPT                            | LEFT MOUSE BUTTON                     | (NONE)          |
| 238   | INPUT\_CURSOR\_CANCEL                            | RIGHT MOUSE BUTTON                    | (NONE)          |
| 239   | INPUT\_CURSOR\_X                                 | (NONE)                                | (NONE)          |
| 240   | INPUT\_CURSOR\_Y                                 | (NONE)                                | (NONE)          |
| 241   | INPUT\_CURSOR\_SCROLL\_UP                        | SCROLLWHEEL UP                        | (NONE)          |
| 242   | INPUT\_CURSOR\_SCROLL\_DOWN                      | SCROLLWHEEL DOWN                      | (NONE)          |
| 243   | INPUT\_ENTER\_CHEAT\_CODE                        | ~ / \`                                | (NONE)          |
| 244   | INPUT\_INTERACTION\_MENU                         | M                                     | BACK            |
| 245   | INPUT\_MP\_TEXT\_CHAT\_ALL                       | T                                     | (NONE)          |
| 246   | INPUT\_MP\_TEXT\_CHAT\_TEAM                      | Y                                     | (NONE)          |
| 247   | INPUT\_MP\_TEXT\_CHAT\_FRIENDS                   | (NONE)                                | (NONE)          |
| 248   | INPUT\_MP\_TEXT\_CHAT\_CREW                      | (NONE)                                | (NONE)          |
| 249   | INPUT\_PUSH\_TO\_TALK                            | N                                     | (NONE)          |
| 250   | INPUT\_CREATOR\_LS                               | R                                     | L3              |
| 251   | INPUT\_CREATOR\_RS                               | F                                     | R3              |
| 252   | INPUT\_CREATOR\_LT                               | X                                     | LT              |
| 253   | INPUT\_CREATOR\_RT                               | C                                     | RT              |
| 254   | INPUT\_CREATOR\_MENU\_TOGGLE                     | LEFT SHIFT                            | (NONE)          |
| 255   | INPUT\_CREATOR\_ACCEPT                           | SPACEBAR                              | A               |
| 256   | INPUT\_CREATOR\_DELETE                           | DELETE                                | X               |
| 257   | INPUT\_ATTACK2                                   | LEFT MOUSE BUTTON                     | RT              |
| 258   | INPUT\_RAPPEL\_JUMP                              | (NONE)                                | A               |
| 259   | INPUT\_RAPPEL\_LONG\_JUMP                        | (NONE)                                | X               |
| 260   | INPUT\_RAPPEL\_SMASH\_WINDOW                     | (NONE)                                | RT              |
| 261   | INPUT\_PREV\_WEAPON                              | SCROLLWHEEL UP                        | DPAD LEFT       |
| 262   | INPUT\_NEXT\_WEAPON                              | SCROLLWHEEL DOWN                      | DPAD RIGHT      |
| 263   | INPUT\_MELEE\_ATTACK1                            | R                                     | B               |
| 264   | INPUT\_MELEE\_ATTACK2                            | Q                                     | A               |
| 265   | INPUT\_WHISTLE                                   | (NONE)                                | (NONE)          |
| 266   | INPUT\_MOVE\_LEFT                                | D                                     | LEFT STICK      |
| 267   | INPUT\_MOVE\_RIGHT                               | D                                     | LEFT STICK      |
| 268   | INPUT\_MOVE\_UP                                  | S                                     | LEFT STICK      |
| 269   | INPUT\_MOVE\_DOWN                                | S                                     | LEFT STICK      |
| 270   | INPUT\_LOOK\_LEFT                                | MOUSE RIGHT                           | RIGHT STICK     |
| 271   | INPUT\_LOOK\_RIGHT                               | MOUSE RIGHT                           | RIGHT STICK     |
| 272   | INPUT\_LOOK\_UP                                  | MOUSE DOWN                            | RIGHT STICK     |
| 273   | INPUT\_LOOK\_DOWN                                | MOUSE DOWN                            | RIGHT STICK     |
| 274   | INPUT\_SNIPER\_ZOOM\_IN                          | \[                                    | RIGHT STICK     |
| 275   | INPUT\_SNIPER\_ZOOM\_OUT                         | \[                                    | RIGHT STICK     |
| 276   | INPUT\_SNIPER\_ZOOM\_IN\_ALTERNATE               | \[                                    | LEFT STICK      |
| 277   | INPUT\_SNIPER\_ZOOM\_OUT\_ALTERNATE              | \[                                    | LEFT STICK      |
| 278   | INPUT\_VEH\_MOVE\_LEFT                           | D                                     | LEFT STICK      |
| 279   | INPUT\_VEH\_MOVE\_RIGHT                          | D                                     | LEFT STICK      |
| 280   | INPUT\_VEH\_MOVE\_UP                             | LEFT CTRL                             | LEFT STICK      |
| 281   | INPUT\_VEH\_MOVE\_DOWN                           | LEFT CTRL                             | LEFT STICK      |
| 282   | INPUT\_VEH\_GUN\_LEFT                            | MOUSE RIGHT                           | RIGHT STICK     |
| 283   | INPUT\_VEH\_GUN\_RIGHT                           | MOUSE RIGHT                           | RIGHT STICK     |
| 284   | INPUT\_VEH\_GUN\_UP                              | MOUSE RIGHT                           | RIGHT STICK     |
| 285   | INPUT\_VEH\_GUN\_DOWN                            | MOUSE RIGHT                           | RIGHT STICK     |
| 286   | INPUT\_VEH\_LOOK\_LEFT                           | MOUSE RIGHT                           | RIGHT STICK     |
| 287   | INPUT\_VEH\_LOOK\_RIGHT                          | MOUSE RIGHT                           | RIGHT STICK     |
| 288   | INPUT\_REPLAY\_START\_STOP\_RECORDING            | F1                                    | A               |
| 289   | INPUT\_REPLAY\_START\_STOP\_RECORDING\_SECONDARY | F2                                    | X               |
| 290   | INPUT\_SCALED\_LOOK\_LR                          | MOUSE RIGHT                           | RIGHT STICK     |
| 291   | INPUT\_SCALED\_LOOK\_UD                          | MOUSE DOWN                            | RIGHT STICK     |
| 292   | INPUT\_SCALED\_LOOK\_UP\_ONLY                    | (NONE)                                | RIGHT STICK     |
| 293   | INPUT\_SCALED\_LOOK\_DOWN\_ONLY                  | (NONE)                                | RIGHT STICK     |
| 294   | INPUT\_SCALED\_LOOK\_LEFT\_ONLY                  | (NONE)                                | RIGHT STICK     |
| 295   | INPUT\_SCALED\_LOOK\_RIGHT\_ONLY                 | (NONE)                                | RIGHT STICK     |
| 296   | INPUT\_REPLAY\_MARKER\_DELETE                    | DELETE                                | X               |
| 297   | INPUT\_REPLAY\_CLIP\_DELETE                      | DELETE                                | Y               |
| 298   | INPUT\_REPLAY\_PAUSE                             | SPACEBAR                              | A               |
| 299   | INPUT\_REPLAY\_REWIND                            | ARROW DOWN                            | LB              |
| 300   | INPUT\_REPLAY\_FFWD                              | ARROW UP                              | RB              |
| 301   | INPUT\_REPLAY\_NEWMARKER                         | M                                     | A               |
| 302   | INPUT\_REPLAY\_RECORD                            | S                                     | (NONE)          |
| 303   | INPUT\_REPLAY\_SCREENSHOT                        | U                                     | DPAD UP         |
| 304   | INPUT\_REPLAY\_HIDEHUD                           | H                                     | R3              |
| 305   | INPUT\_REPLAY\_STARTPOINT                        | B                                     | (NONE)          |
| 306   | INPUT\_REPLAY\_ENDPOINT                          | N                                     | (NONE)          |
| 307   | INPUT\_REPLAY\_ADVANCE                           | ARROW RIGHT                           | DPAD RIGHT      |
| 308   | INPUT\_REPLAY\_BACK                              | ARROW LEFT                            | DPAD LEFT       |
| 309   | INPUT\_REPLAY\_TOOLS                             | T                                     | DPAD DOWN       |
| 310   | INPUT\_REPLAY\_RESTART                           | R                                     | BACK            |
| 311   | INPUT\_REPLAY\_SHOWHOTKEY                        | K                                     | DPAD DOWN       |
| 312   | INPUT\_REPLAY\_CYCLEMARKERLEFT                   | \[                                    | DPAD LEFT       |
| 313   | INPUT\_REPLAY\_CYCLEMARKERRIGHT                  | \]                                    | DPAD RIGHT      |
| 314   | INPUT\_REPLAY\_FOVINCREASE                       | NUMPAD +                              | RB              |
| 315   | INPUT\_REPLAY\_FOVDECREASE                       | NUMPAD -                              | LB              |
| 316   | INPUT\_REPLAY\_CAMERAUP                          | PAGE UP                               | (NONE)          |
| 317   | INPUT\_REPLAY\_CAMERADOWN                        | PAGE DOWN                             | (NONE)          |
| 318   | INPUT\_REPLAY\_SAVE                              | F5                                    | START           |
| 319   | INPUT\_REPLAY\_TOGGLETIME                        | C                                     | (NONE)          |
| 320   | INPUT\_REPLAY\_TOGGLETIPS                        | V                                     | (NONE)          |
| 321   | INPUT\_REPLAY\_PREVIEW                           | SPACEBAR                              | (NONE)          |
| 322   | INPUT\_REPLAY\_TOGGLE\_TIMELINE                  | ESC                                   | (NONE)          |
| 323   | INPUT\_REPLAY\_TIMELINE\_PICKUP\_CLIP            | X                                     | (NONE)          |
| 324   | INPUT\_REPLAY\_TIMELINE\_DUPLICATE\_CLIP         | C                                     | (NONE)          |
| 325   | INPUT\_REPLAY\_TIMELINE\_PLACE\_CLIP             | V                                     | (NONE)          |
| 326   | INPUT\_REPLAY\_CTRL                              | LEFT CTRL                             | (NONE)          |
| 327   | INPUT\_REPLAY\_TIMELINE\_SAVE                    | F5                                    | (NONE)          |
| 328   | INPUT\_REPLAY\_PREVIEW\_AUDIO                    | SPACEBAR                              | RT              |
| 329   | INPUT\_VEH\_DRIVE\_LOOK                          | LEFT MOUSE BUTTON                     | (NONE)          |
| 330   | INPUT\_VEH\_DRIVE\_LOOK2                         | RIGHT MOUSE BUTTON                    | (NONE)          |
| 331   | INPUT\_VEH\_FLY\_ATTACK2                         | RIGHT MOUSE BUTTON                    | (NONE)          |
| 332   | INPUT\_RADIO\_WHEEL\_UD                          | MOUSE DOWN                            | RIGHT STICK     |
| 333   | INPUT\_RADIO\_WHEEL\_LR                          | MOUSE RIGHT                           | RIGHT STICK     |
| 334   | INPUT\_VEH\_SLOWMO\_UD                           | SCROLLWHEEL DOWN                      | LEFT STICK      |
| 335   | INPUT\_VEH\_SLOWMO\_UP\_ONLY                     | SCROLLWHEEL UP                        | LEFT STICK      |
| 336   | INPUT\_VEH\_SLOWMO\_DOWN\_ONLY                   | SCROLLWHEEL DOWN                      | LEFT STICK      |
| 337   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_TOGGLE          | X                                     | A               |
| 338   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_LEFT            | A                                     | LEFT STICK      |
| 339   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_RIGHT           | D                                     | LEFT STICK      |
| 340   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_UP              | LEFT SHIFT                            | LEFT STICK      |
| 341   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_DOWN            | LEFT CTRL                             | LEFT STICK      |
| 342   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_UD              | D                                     | LEFT STICK      |
| 343   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_LR              | LEFT CTRL                             | LEFT STICK      |
| 344   | INPUT\_SWITCH\_VISOR                             | F11                                   | DPAD RIGHT      |
| 345   | INPUT\_VEH\_MELEE\_HOLD                          | X                                     | A               |
| 346   | INPUT\_VEH\_MELEE\_LEFT                          | LEFT MOUSE BUTTON                     | LB              |
| 347   | INPUT\_VEH\_MELEE\_RIGHT                         | RIGHT MOUSE BUTTON                    | RB              |
| 348   | INPUT\_MAP\_POI                                  | SCROLLWHEEL BUTTON (PRESS)            | Y               |
| 349   | INPUT\_REPLAY\_SNAPMATIC\_PHOTO                  | TAB                                   | X               |
| 350   | INPUT\_VEH\_CAR\_JUMP                            | E                                     | L3              |
| 351   | INPUT\_VEH\_ROCKET\_BOOST                        | E                                     | L3              |
| 352   | INPUT\_VEH\_FLY\_BOOST                           | LEFT SHIFT                            | L3              |
| 353   | INPUT\_VEH\_PARACHUTE                            | SPACEBAR                              | A               |
| 354   | INPUT\_VEH\_BIKE\_WINGS                          | X                                     | A               |
| 355   | INPUT\_VEH\_FLY\_BOMB\_BAY                       | E                                     | DPAD RIGHT      |
| 356   | INPUT\_VEH\_FLY\_COUNTER                         | E                                     | DPAD RIGHT      |
| 357   | INPUT\_VEH\_TRANSFORM                            | X                                     | A               |
| 358   | INPUT\_QUAD\_LOCO\_REVERSE                       |                                       | RB              |
| 359   | INPUT\_RESPAWN\_FASTER                           |                                       |                 |
| 360   | INPUT\_HUDMARKER\_SELECT                         |                                       |                 |
