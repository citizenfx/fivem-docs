---
title: Controls
weight: 710
---

Example
-------

### Lua

``` lua
-- checks if INPUT_CONTEXT has just been released
if IsControlJustReleased(1--[[input group]],  51--[[control index]]) then
    -- run code here
end
```

### C\#

``` csharp
// checks if INPUT_CONTEXT has just been released
// assumes `using static CitizenFX.Core.API;`
if(IsControlJustReleased(1, 51))
{
   // run code here
}
```

Input groups
------------

| Index |                 Name                 |
| ----- | ------------------------------------ |
| 0     | INPUTGROUP\_MOVE                     |
| 1     | INPUTGROUP\_LOOK                     |
| 2     | INPUTGROUP\_WHEEL                    |
| 3     | INPUTGROUP\_CELLPHONE\_NAVIGATE      |
| 4     | INPUTGROUP\_CELLPHONE\_NAVIGATE\_UD  |
| 5     | INPUTGROUP\_CELLPHONE\_NAVIGATE\_LR  |
| 6     | INPUTGROUP\_FRONTEND\_DPAD\_ALL      |
| 7     | INPUTGROUP\_FRONTEND\_DPAD\_UD       |
| 8     | INPUTGROUP\_FRONTEND\_DPAD\_LR       |
| 9     | INPUTGROUP\_FRONTEND\_LSTICK\_ALL    |
| 10    | INPUTGROUP\_FRONTEND\_RSTICK\_ALL    |
| 11    | INPUTGROUP\_FRONTEND\_GENERIC\_UD    |
| 12    | INPUTGROUP\_FRONTEND\_GENERIC\_LR    |
| 13    | INPUTGROUP\_FRONTEND\_GENERIC\_ALL   |
| 14    | INPUTGROUP\_FRONTEND\_BUMPERS        |
| 15    | INPUTGROUP\_FRONTEND\_TRIGGERS       |
| 16    | INPUTGROUP\_FRONTEND\_STICKS         |
| 17    | INPUTGROUP\_SCRIPT\_DPAD\_ALL        |
| 18    | INPUTGROUP\_SCRIPT\_DPAD\_UD         |
| 19    | INPUTGROUP\_SCRIPT\_DPAD\_LR         |
| 20    | INPUTGROUP\_SCRIPT\_LSTICK\_ALL      |
| 21    | INPUTGROUP\_SCRIPT\_RSTICK\_ALL      |
| 22    | INPUTGROUP\_SCRIPT\_BUMPERS          |
| 23    | INPUTGROUP\_SCRIPT\_TRIGGERS         |
| 24    | INPUTGROUP\_WEAPON\_WHEEL\_CYCLE     |
| 25    | INPUTGROUP\_FLY                      |
| 26    | INPUTGROUP\_SUB                      |
| 27    | INPUTGROUP\_VEH\_MOVE\_ALL           |
| 28    | INPUTGROUP\_CURSOR                   |
| 29    | INPUTGROUP\_CURSOR\_SCROLL           |
| 30    | INPUTGROUP\_SNIPER\_ZOOM\_SECONDARY  |
| 31    | INPUTGROUP\_VEH\_HYDRAULICS\_CONTROL |

Controls
--------

| Index | Name                                             | Default QWERTY |
|-------|--------------------------------------------------|----------------|
| 0     | INPUT\_NEXT\_CAMERA                              | V              |
| 1     | INPUT\_LOOK\_LR                                  | MOUSE RIGHT    |
| 2     | INPUT\_LOOK\_UD                                  | MOUSE DOWN     |
| 3     | INPUT\_LOOK\_UP\_ONLY                            | (NONE)         |
| 4     | INPUT\_LOOK\_DOWN\_ONLY                          | MOUSE DOWN     |
| 5     | INPUT\_LOOK\_LEFT\_ONLY                          | (NONE)         |
| 6     | INPUT\_LOOK\_RIGHT\_ONLY                         | MOUSE RIGHT    |
| 7     | INPUT\_CINEMATIC\_SLOWMO                         | (NONE)         |
| 8     | INPUT\_SCRIPTED\_FLY\_UD                         | S              |
| 9     | INPUT\_SCRIPTED\_FLY\_LR                         | D              |
| 10    | INPUT\_SCRIPTED\_FLY\_ZUP                        | PAGEUP         |
| 11    | INPUT\_SCRIPTED\_FLY\_ZDOWN                      | PAGEDOWN       |
| 12    | INPUT\_WEAPON\_WHEEL\_UD                         | MOUSE DOWN     |
| 13    | INPUT\_WEAPON\_WHEEL\_LR                         | MOUSE RIGHT    |
| 14    | INPUT\_WEAPON\_WHEEL\_NEXT                       | SCROLLWHEEL DOWN |
| 15    | INPUT\_WEAPON\_WHEEL\_PREV                       | SCROLLWHEEL UP |
| 16    | INPUT\_SELECT\_NEXT\_WEAPON                      | SCROLLWHEEL DOWN |
| 17    | INPUT\_SELECT\_PREV\_WEAPON                      | SCROLLWHEEL UP |
| 18    | INPUT\_SKIP\_CUTSCENE                            | ENTER / LEFT MOUSE BUTTON / SPACEBAR |
| 19    | INPUT\_CHARACTER\_WHEEL                          | LEFT ALT       |
| 20    | INPUT\_MULTIPLAYER\_INFO                         | Z              |
| 21    | INPUT\_SPRINT                                    | LEFT SHIFT     |
| 22    | INPUT\_JUMP                                      | SPACEBAR       |
| 23    | INPUT\_ENTER                                     | F              |
| 24    | INPUT\_ATTACK                                    | LEFT MOUSE BUTTON |
| 25    | INPUT\_AIM                                       | RIGHT MOUSE BUTTON |
| 26    | INPUT\_LOOK\_BEHIND                              | C              |
| 27    | INPUT\_PHONE                                     | ARROW UP / SCROLLWHEEL BUTTON (PRESS) |
| 28    | INPUT\_SPECIAL\_ABILITY                          | (NONE)         |
| 29    | INPUT\_SPECIAL\_ABILITY\_SECONDARY               | B              |
| 30    | INPUT\_MOVE\_LR                                  | D              |
| 31    | INPUT\_MOVE\_UD                                  | S              |
| 32    | INPUT\_MOVE\_UP\_ONLY                            | W              |
| 33    | INPUT\_MOVE\_DOWN\_ONLY                          | S              |
| 34    | INPUT\_MOVE\_LEFT\_ONLY                          | A              |
| 35    | INPUT\_MOVE\_RIGHT\_ONLY                         | D              |
| 36    | INPUT\_DUCK                                      | LEFT CTRL      |
| 37    | INPUT\_SELECT\_WEAPON                            | TAB            |
| 38    | INPUT\_PICKUP                                    | E              |
| 39    | INPUT\_SNIPER\_ZOOM                              | \[             |
| 40    | INPUT\_SNIPER\_ZOOM\_IN\_ONLY                    | \]             |
| 41    | INPUT\_SNIPER\_ZOOM\_OUT\_ONLY                   | \[             |
| 42    | INPUT\_SNIPER\_ZOOM\_IN\_SECONDARY               | \]             |
| 43    | INPUT\_SNIPER\_ZOOM\_OUT\_SECONDARY              | \[             |
| 44    | INPUT\_COVER                                     | Q              |
| 45    | INPUT\_RELOAD                                    | R              |
| 46    | INPUT\_TALK                                      | E              |
| 47    | INPUT\_DETONATE                                  | G              |
| 48    | INPUT\_HUD\_SPECIAL                              | Z              |
| 49    | INPUT\_ARREST                                    | F              |
| 50    | INPUT\_ACCURATE\_AIM                             | SCROLLWHEEL DOWN |
| 51    | INPUT\_CONTEXT                                   | E              |
| 52    | INPUT\_CONTEXT\_SECONDARY                        | Q              |
| 53    | INPUT\_WEAPON\_SPECIAL                           | (NONE)         |
| 54    | INPUT\_WEAPON\_SPECIAL\_TWO                      | E              |
| 55    | INPUT\_DIVE                                      | SPACEBAR       |
| 56    | INPUT\_DROP\_WEAPON                              | F9             |
| 57    | INPUT\_DROP\_AMMO                                | F10            |
| 58    | INPUT\_THROW\_GRENADE                            | G              |
| 59    | INPUT\_VEH\_MOVE\_LR                             | D              |
| 60    | INPUT\_VEH\_MOVE\_UD                             | LEFT CTRL      |
| 61    | INPUT\_VEH\_MOVE\_UP\_ONLY                       | LEFT SHIFT     |
| 62    | INPUT\_VEH\_MOVE\_DOWN\_ONLY                     | LEFT CTRL      |
| 63    | INPUT\_VEH\_MOVE\_LEFT\_ONLY                     | A              |
| 64    | INPUT\_VEH\_MOVE\_RIGHT\_ONLY                    | D              |
| 65    | INPUT\_VEH\_SPECIAL                              | (NONE)         |
| 66    | INPUT\_VEH\_GUN\_LR                              | MOUSE RIGHT    |
| 67    | INPUT\_VEH\_GUN\_UD                              | MOUSE DOWN     |
| 68    | INPUT\_VEH\_AIM                                  | RIGHT MOUSE BUTTON |
| 69    | INPUT\_VEH\_ATTACK                               | LEFT MOUSE BUTTON |
| 70    | INPUT\_VEH\_ATTACK2                              | RIGHT MOUSE BUTTON |
| 71    | INPUT\_VEH\_ACCELERATE                           | W              |
| 72    | INPUT\_VEH\_BRAKE                                | S              |
| 73    | INPUT\_VEH\_DUCK                                 | X              |
| 74    | INPUT\_VEH\_HEADLIGHT                            | H              |
| 75    | INPUT\_VEH\_EXIT                                 | F              |
| 76    | INPUT\_VEH\_HANDBRAKE                            | SPACEBAR       |
| 77    | INPUT\_VEH\_HOTWIRE\_LEFT                        | W              |
| 78    | INPUT\_VEH\_HOTWIRE\_RIGHT                       | S              |
| 79    | INPUT\_VEH\_LOOK\_BEHIND                         | C              |
| 80    | INPUT\_VEH\_CIN\_CAM                             | R              |
| 81    | INPUT\_VEH\_NEXT\_RADIO                          | .              |
| 82    | INPUT\_VEH\_PREV\_RADIO                          | ,              |
| 83    | INPUT\_VEH\_NEXT\_RADIO\_TRACK                   | =              |
| 84    | INPUT\_VEH\_PREV\_RADIO\_TRACK                   | -              |
| 85    | INPUT\_VEH\_RADIO\_WHEEL                         | Q              |
| 86    | INPUT\_VEH\_HORN                                 | E              |
| 87    | INPUT\_VEH\_FLY\_THROTTLE\_UP                    | W              |
| 88    | INPUT\_VEH\_FLY\_THROTTLE\_DOWN                  | S              |
| 89    | INPUT\_VEH\_FLY\_YAW\_LEFT                       | A              |
| 90    | INPUT\_VEH\_FLY\_YAW\_RIGHT                      | D              |
| 91    | INPUT\_VEH\_PASSENGER\_AIM                       | RIGHT MOUSE BUTTON |
| 92    | INPUT\_VEH\_PASSENGER\_ATTACK                    | LEFT MOUSE BUTTON |
| 93    | INPUT\_VEH\_SPECIAL\_ABILITY\_FRANKLIN           | (NONE)         |
| 94    | INPUT\_VEH\_STUNT\_UD                            | (NONE)         |
| 95    | INPUT\_VEH\_CINEMATIC\_UD                        | MOUSE DOWN     |
| 96    | INPUT\_VEH\_CINEMATIC\_UP\_ONLY                  | NUMPAD- / SCROLLWHEEL UP |
| 97    | INPUT\_VEH\_CINEMATIC\_DOWN\_ONLY                | NUMPAD+ / SCROLLWHEEL DOWN |
| 98    | INPUT\_VEH\_CINEMATIC\_LR                        | MOUSE RIGHT    |
| 99    | INPUT\_VEH\_SELECT\_NEXT\_WEAPON                 | SCROLLWHEEL UP |
| 100   | INPUT\_VEH\_SELECT\_PREV\_WEAPON                 | \[             |
| 101   | INPUT\_VEH\_ROOF                                 | H              |
| 102   | INPUT\_VEH\_JUMP                                 | SPACEBAR       |
| 103   | INPUT\_VEH\_GRAPPLING\_HOOK                      | E              |
| 104   | INPUT\_VEH\_SHUFFLE                              | H              |
| 105   | INPUT\_VEH\_DROP\_PROJECTILE                     | X              |
| 106   | INPUT\_VEH\_MOUSE\_CONTROL\_OVERRIDE             | LEFT MOUSE BUTTON |
| 107   | INPUT\_VEH\_FLY\_ROLL\_LR                        | NUMPAD 6       |
| 108   | INPUT\_VEH\_FLY\_ROLL\_LEFT\_ONLY                | NUMPAD 4       |
| 109   | INPUT\_VEH\_FLY\_ROLL\_RIGHT\_ONLY               | NUMPAD 6       |
| 110   | INPUT\_VEH\_FLY\_PITCH\_UD                       | NUMPAD 5       |
| 111   | INPUT\_VEH\_FLY\_PITCH\_UP\_ONLY                 | NUMPAD 8       |
| 112   | INPUT\_VEH\_FLY\_PITCH\_DOWN\_ONLY               | NUMPAD 5       |
| 113   | INPUT\_VEH\_FLY\_UNDERCARRIAGE                   | G              |
| 114   | INPUT\_VEH\_FLY\_ATTACK                          | RIGHT MOUSE BUTTON |
| 115   | INPUT\_VEH\_FLY\_SELECT\_NEXT\_WEAPON            | SCROLLWHEEL UP |
| 116   | INPUT\_VEH\_FLY\_SELECT\_PREV\_WEAPON            | \[             |
| 117   | INPUT\_VEH\_FLY\_SELECT\_TARGET\_LEFT            | NUMPAD 7       |
| 118   | INPUT\_VEH\_FLY\_SELECT\_TARGET\_RIGHT           | NUMPAD 9       |
| 119   | INPUT\_VEH\_FLY\_VERTICAL\_FLIGHT\_MODE          | E              |
| 120   | INPUT\_VEH\_FLY\_DUCK                            | X              |
| 121   | INPUT\_VEH\_FLY\_ATTACK\_CAMERA                  | INSERT         |
| 122   | INPUT\_VEH\_FLY\_MOUSE\_CONTROL\_OVERRIDE        | LEFT MOUSE BUTTON |
| 123   | INPUT\_VEH\_SUB\_TURN\_LR                        | NUMPAD 6       |
| 124   | INPUT\_VEH\_SUB\_TURN\_LEFT\_ONLY                | NUMPAD 4       |
| 125   | INPUT\_VEH\_SUB\_TURN\_RIGHT\_ONLY               | NUMPAD 6       |
| 126   | INPUT\_VEH\_SUB\_PITCH\_UD                       | NUMPAD 5       |
| 127   | INPUT\_VEH\_SUB\_PITCH\_UP\_ONLY                 | NUMPAD 8       |
| 128   | INPUT\_VEH\_SUB\_PITCH\_DOWN\_ONLY               | NUMPAD 5       |
| 129   | INPUT\_VEH\_SUB\_THROTTLE\_UP                    | W              |
| 130   | INPUT\_VEH\_SUB\_THROTTLE\_DOWN                  | S              |
| 131   | INPUT\_VEH\_SUB\_ASCEND                          | LEFT SHIFT     |
| 132   | INPUT\_VEH\_SUB\_DESCEND                         | LEFT CTRL      |
| 133   | INPUT\_VEH\_SUB\_TURN\_HARD\_LEFT                | A              |
| 134   | INPUT\_VEH\_SUB\_TURN\_HARD\_RIGHT               | D              |
| 135   | INPUT\_VEH\_SUB\_MOUSE\_CONTROL\_OVERRIDE        | LEFT MOUSE BUTTON |
| 136   | INPUT\_VEH\_PUSHBIKE\_PEDAL                      | W              |
| 137   | INPUT\_VEH\_PUSHBIKE\_SPRINT                     | CAPSLOCK       |
| 138   | INPUT\_VEH\_PUSHBIKE\_FRONT\_BRAKE               | Q              |
| 139   | INPUT\_VEH\_PUSHBIKE\_REAR\_BRAKE                | S              |
| 140   | INPUT\_MELEE\_ATTACK\_LIGHT                      | R              |
| 141   | INPUT\_MELEE\_ATTACK\_HEAVY                      | Q              |
| 142   | INPUT\_MELEE\_ATTACK\_ALTERNATE                  | LEFT MOUSE BUTTON |
| 143   | INPUT\_MELEE\_BLOCK                              | SPACEBAR       |
| 144   | INPUT\_PARACHUTE\_DEPLOY                         | F / LEFT MOUSE BUTTON |
| 145   | INPUT\_PARACHUTE\_DETACH                         | F              |
| 146   | INPUT\_PARACHUTE\_TURN\_LR                       | D              |
| 147   | INPUT\_PARACHUTE\_TURN\_LEFT\_ONLY               | A              |
| 148   | INPUT\_PARACHUTE\_TURN\_RIGHT\_ONLY              | D              |
| 149   | INPUT\_PARACHUTE\_PITCH\_UD                      | S              |
| 150   | INPUT\_PARACHUTE\_PITCH\_UP\_ONLY                | W              |
| 151   | INPUT\_PARACHUTE\_PITCH\_DOWN\_ONLY              | S              |
| 152   | INPUT\_PARACHUTE\_BRAKE\_LEFT                    | Q              |
| 153   | INPUT\_PARACHUTE\_BRAKE\_RIGHT                   | E              |
| 154   | INPUT\_PARACHUTE\_SMOKE                          | X              |
| 155   | INPUT\_PARACHUTE\_PRECISION\_LANDING             | LEFT SHIFT     |
| 156   | INPUT\_MAP                                       | (NONE)         |
| 157   | INPUT\_SELECT\_WEAPON\_UNARMED                   | 1              |
| 158   | INPUT\_SELECT\_WEAPON\_MELEE                     | 2              |
| 159   | INPUT\_SELECT\_WEAPON\_HANDGUN                   | 6              |
| 160   | INPUT\_SELECT\_WEAPON\_SHOTGUN                   | 3              |
| 161   | INPUT\_SELECT\_WEAPON\_SMG                       | 7              |
| 162   | INPUT\_SELECT\_WEAPON\_AUTO\_RIFLE               | 8              |
| 163   | INPUT\_SELECT\_WEAPON\_SNIPER                    | 9              |
| 164   | INPUT\_SELECT\_WEAPON\_HEAVY                     | 4              |
| 165   | INPUT\_SELECT\_WEAPON\_SPECIAL                   | 5              |
| 166   | INPUT\_SELECT\_CHARACTER\_MICHAEL                | F5             |
| 167   | INPUT\_SELECT\_CHARACTER\_FRANKLIN               | F6             |
| 168   | INPUT\_SELECT\_CHARACTER\_TREVOR                 | F7             |
| 169   | INPUT\_SELECT\_CHARACTER\_MULTIPLAYER            | F8 (CONSOLE)   |
| 170   | INPUT\_SAVE\_REPLAY\_CLIP                        | F3             |
| 171   | INPUT\_SPECIAL\_ABILITY\_PC                      | CAPSLOCK       |
| 172   | INPUT\_CELLPHONE\_UP                             | ARROW UP       |
| 173   | INPUT\_CELLPHONE\_DOWN                           | ARROW DOWN     |
| 174   | INPUT\_CELLPHONE\_LEFT                           | ARROW LEFT     |
| 175   | INPUT\_CELLPHONE\_RIGHT                          | ARROW RIGHT    |
| 176   | INPUT\_CELLPHONE\_SELECT                         | ENTER / LEFT MOUSE BUTTON |
| 177   | INPUT\_CELLPHONE\_CANCEL                         | BACKSPACE / ESC / RIGHT MOUSE BUTTON |
| 178   | INPUT\_CELLPHONE\_OPTION                         | DELETE         |
| 179   | INPUT\_CELLPHONE\_EXTRA\_OPTION                  | SPACEBAR       |
| 180   | INPUT\_CELLPHONE\_SCROLL\_FORWARD                | SCROLLWHEEL DOWN |
| 181   | INPUT\_CELLPHONE\_SCROLL\_BACKWARD               | SCROLLWHEEL UP |
| 182   | INPUT\_CELLPHONE\_CAMERA\_FOCUS\_LOCK            | L              |
| 183   | INPUT\_CELLPHONE\_CAMERA\_GRID                   | G              |
| 184   | INPUT\_CELLPHONE\_CAMERA\_SELFIE                 | E              |
| 185   | INPUT\_CELLPHONE\_CAMERA\_DOF                    | F              |
| 186   | INPUT\_CELLPHONE\_CAMERA\_EXPRESSION             | X              |
| 187   | INPUT\_FRONTEND\_DOWN                            | ARROW DOWN     |
| 188   | INPUT\_FRONTEND\_UP                              | ARROW UP       |
| 189   | INPUT\_FRONTEND\_LEFT                            | ARROW LEFT     |
| 190   | INPUT\_FRONTEND\_RIGHT                           | ARROW RIGHT    |
| 191   | INPUT\_FRONTEND\_RDOWN                           | ENTER          |
| 192   | INPUT\_FRONTEND\_RUP                             | TAB            |
| 193   | INPUT\_FRONTEND\_RLEFT                           | (NONE)         |
| 194   | INPUT\_FRONTEND\_RRIGHT                          | BACKSPACE      |
| 195   | INPUT\_FRONTEND\_AXIS\_X                         | D              |
| 196   | INPUT\_FRONTEND\_AXIS\_Y                         | S              |
| 197   | INPUT\_FRONTEND\_RIGHT\_AXIS\_X                  | \]             |
| 198   | INPUT\_FRONTEND\_RIGHT\_AXIS\_Y                  | SCROLLWHEEL DOWN |
| 199   | INPUT\_FRONTEND\_PAUSE                           | P              |
| 200   | INPUT\_FRONTEND\_PAUSE\_ALTERNATE                | ESC            |
| 201   | INPUT\_FRONTEND\_ACCEPT                          | ENTER / NUMPAD ENTER |
| 202   | INPUT\_FRONTEND\_CANCEL                          | BACKSPACE / ESC |
| 203   | INPUT\_FRONTEND\_X                               | SPACEBAR       |
| 204   | INPUT\_FRONTEND\_Y                               | TAB            |
| 205   | INPUT\_FRONTEND\_LB                              | Q              |
| 206   | INPUT\_FRONTEND\_RB                              | E              |
| 207   | INPUT\_FRONTEND\_LT                              | PAGE DOWN      |
| 208   | INPUT\_FRONTEND\_RT                              | PAGE UP        |
| 209   | INPUT\_FRONTEND\_LS                              | LEFT SHIFT     |
| 210   | INPUT\_FRONTEND\_RS                              | LEFT CONTROL   |
| 211   | INPUT\_FRONTEND\_LEADERBOARD                     | TAB            |
| 212   | INPUT\_FRONTEND\_SOCIAL\_CLUB                    | HOME           |
| 213   | INPUT\_FRONTEND\_SOCIAL\_CLUB\_SECONDARY         | HOME           |
| 214   | INPUT\_FRONTEND\_DELETE                          | DELETE         |
| 215   | INPUT\_FRONTEND\_ENDSCREEN\_ACCEPT               | ENTER          |
| 216   | INPUT\_FRONTEND\_ENDSCREEN\_EXPAND               | SPACEBAR       |
| 217   | INPUT\_FRONTEND\_SELECT                          | CAPSLOCK       |
| 218   | INPUT\_SCRIPT\_LEFT\_AXIS\_X                     | D              |
| 219   | INPUT\_SCRIPT\_LEFT\_AXIS\_Y                     | S              |
| 220   | INPUT\_SCRIPT\_RIGHT\_AXIS\_X                    | MOUSE RIGHT    |
| 221   | INPUT\_SCRIPT\_RIGHT\_AXIS\_Y                    | MOUSE DOWN     |
| 222   | INPUT\_SCRIPT\_RUP                               | RIGHT MOUSE BUTTON |
| 223   | INPUT\_SCRIPT\_RDOWN                             | LEFT MOUSE BUTTON |
| 224   | INPUT\_SCRIPT\_RLEFT                             | LEFT CTRL      |
| 225   | INPUT\_SCRIPT\_RRIGHT                            | RIGHT MOUSE BUTTON |
| 226   | INPUT\_SCRIPT\_LB                                | (NONE)         |
| 227   | INPUT\_SCRIPT\_RB                                | (NONE)         |
| 228   | INPUT\_SCRIPT\_LT                                | (NONE)         |
| 229   | INPUT\_SCRIPT\_RT                                | LEFT MOUSE BUTTON |
| 230   | INPUT\_SCRIPT\_LS                                | (NONE)         |
| 231   | INPUT\_SCRIPT\_RS                                | (NONE)         |
| 232   | INPUT\_SCRIPT\_PAD\_UP                           | W              |
| 233   | INPUT\_SCRIPT\_PAD\_DOWN                         | S              |
| 234   | INPUT\_SCRIPT\_PAD\_LEFT                         | A              |
| 235   | INPUT\_SCRIPT\_PAD\_RIGHT                        | D              |
| 236   | INPUT\_SCRIPT\_SELECT                            | V              |
| 237   | INPUT\_CURSOR\_ACCEPT                            | LEFT MOUSE BUTTON |
| 238   | INPUT\_CURSOR\_CANCEL                            | RIGHT MOUSE BUTTON |
| 239   | INPUT\_CURSOR\_X                                 | (not a key, counts as being pressed if the mouse is on the right side of the screen) |
| 240   | INPUT\_CURSOR\_Y                                 | (not a key, counts as being pressed if the mouse is on the left side of the screen) |
| 241   | INPUT\_CURSOR\_SCROLL\_UP                        | SCROLLWHEEL UP |
| 242   | INPUT\_CURSOR\_SCROLL\_DOWN                      | SCROLLWHEEL DOWN |
| 243   | INPUT\_ENTER\_CHEAT\_CODE                        | ~ / \`         |
| 244   | INPUT\_INTERACTION\_MENU                         | M              |
| 245   | INPUT\_MP\_TEXT\_CHAT\_ALL                       | T              |
| 246   | INPUT\_MP\_TEXT\_CHAT\_TEAM                      | Y              |
| 247   | INPUT\_MP\_TEXT\_CHAT\_FRIENDS                   | (NONE)         |
| 248   | INPUT\_MP\_TEXT\_CHAT\_CREW                      | (NONE)         |
| 249   | INPUT\_PUSH\_TO\_TALK                            | N              |
| 250   | INPUT\_CREATOR\_LS                               | R              |
| 251   | INPUT\_CREATOR\_RS                               | F              |
| 252   | INPUT\_CREATOR\_LT                               | X              |
| 253   | INPUT\_CREATOR\_RT                               | C              |
| 254   | INPUT\_CREATOR\_MENU\_TOGGLE                     | LEFT SHIFT     |
| 255   | INPUT\_CREATOR\_ACCEPT                           | SPACEBAR       |
| 256   | INPUT\_CREATOR\_DELETE                           | DELETE         |
| 257   | INPUT\_ATTACK2                                   | LEFT MOUSE BUTTON |
| 258   | INPUT\_RAPPEL\_JUMP                              | (NONE)         |
| 259   | INPUT\_RAPPEL\_LONG\_JUMP                        | (NONE)         |
| 260   | INPUT\_RAPPEL\_SMASH\_WINDOW                     | (NONE)         |
| 261   | INPUT\_PREV\_WEAPON                              | SCROLLWHEEL UP |
| 262   | INPUT\_NEXT\_WEAPON                              | SCROLLWHEEL DOWN |
| 263   | INPUT\_MELEE\_ATTACK1                            | R              |
| 264   | INPUT\_MELEE\_ATTACK2                            | Q              |
| 265   | INPUT\_WHISTLE                                   | (NONE)         |
| 266   | INPUT\_MOVE\_LEFT                                | D              |
| 267   | INPUT\_MOVE\_RIGHT                               | D              |
| 268   | INPUT\_MOVE\_UP                                  | S              |
| 269   | INPUT\_MOVE\_DOWN                                | S              |
| 270   | INPUT\_LOOK\_LEFT                                | MOUSE RIGHT    |
| 271   | INPUT\_LOOK\_RIGHT                               | MOUSE RIGHT    |
| 272   | INPUT\_LOOK\_UP                                  | MOUSE DOWN     |
| 273   | INPUT\_LOOK\_DOWN                                | MOUSE DOWN     |
| 274   | INPUT\_SNIPER\_ZOOM\_IN                          | \[             |
| 275   | INPUT\_SNIPER\_ZOOM\_OUT                         | \[             |
| 276   | INPUT\_SNIPER\_ZOOM\_IN\_ALTERNATE               | \[             |
| 277   | INPUT\_SNIPER\_ZOOM\_OUT\_ALTERNATE              | \[             |
| 278   | INPUT\_VEH\_MOVE\_LEFT                           | D              |
| 279   | INPUT\_VEH\_MOVE\_RIGHT                          | D              |
| 280   | INPUT\_VEH\_MOVE\_UP                             | LEFT CTRL      |
| 281   | INPUT\_VEH\_MOVE\_DOWN                           | LEFT CTRL      |
| 282   | INPUT\_VEH\_GUN\_LEFT                            | MOUSE RIGHT    |
| 283   | INPUT\_VEH\_GUN\_RIGHT                           | MOUSE RIGHT    |
| 284   | INPUT\_VEH\_GUN\_UP                              | MOUSE RIGHT    |
| 285   | INPUT\_VEH\_GUN\_DOWN                            | MOUSE RIGHT    |
| 286   | INPUT\_VEH\_LOOK\_LEFT                           | MOUSE RIGHT    |
| 287   | INPUT\_VEH\_LOOK\_RIGHT                          | MOUSE RIGHT    |
| 288   | INPUT\_REPLAY\_START\_STOP\_RECORDING            | F1             |
| 289   | INPUT\_REPLAY\_START\_STOP\_RECORDING\_SECONDARY | F2             |
| 290   | INPUT\_SCALED\_LOOK\_LR                          | MOUSE RIGHT    |
| 291   | INPUT\_SCALED\_LOOK\_UD                          | MOUSE DOWN     |
| 292   | INPUT\_SCALED\_LOOK\_UP\_ONLY                    | (NONE)         |
| 293   | INPUT\_SCALED\_LOOK\_DOWN\_ONLY                  | (NONE)         |
| 294   | INPUT\_SCALED\_LOOK\_LEFT\_ONLY                  | (NONE)         |
| 295   | INPUT\_SCALED\_LOOK\_RIGHT\_ONLY                 | (NONE)         |
| 296   | INPUT\_REPLAY\_MARKER\_DELETE                    | DELETE         |
| 297   | INPUT\_REPLAY\_CLIP\_DELETE                      | DELETE         |
| 298   | INPUT\_REPLAY\_PAUSE                             | SPACEBAR       |
| 299   | INPUT\_REPLAY\_REWIND                            | ARROW DOWN     |
| 300   | INPUT\_REPLAY\_FFWD                              | ARROW UP       |
| 301   | INPUT\_REPLAY\_NEWMARKER                         | M              |
| 302   | INPUT\_REPLAY\_RECORD                            | S              |
| 303   | INPUT\_REPLAY\_SCREENSHOT                        | U              |
| 304   | INPUT\_REPLAY\_HIDEHUD                           | H              |
| 305   | INPUT\_REPLAY\_STARTPOINT                        | B              |
| 306   | INPUT\_REPLAY\_ENDPOINT                          | N              |
| 307   | INPUT\_REPLAY\_ADVANCE                           | ARROW RIGHT    |
| 308   | INPUT\_REPLAY\_BACK                              | ARROW LEFT     |
| 309   | INPUT\_REPLAY\_TOOLS                             | T              |
| 310   | INPUT\_REPLAY\_RESTART                           | R              |
| 311   | INPUT\_REPLAY\_SHOWHOTKEY                        | K              |
| 312   | INPUT\_REPLAY\_CYCLEMARKERLEFT                   | \[             |
| 313   | INPUT\_REPLAY\_CYCLEMARKERRIGHT                  | \]             |
| 314   | INPUT\_REPLAY\_FOVINCREASE                       | NUMPAD +       |
| 315   | INPUT\_REPLAY\_FOVDECREASE                       | NUMPAD -       |
| 316   | INPUT\_REPLAY\_CAMERAUP                          | PAGE UP        |
| 317   | INPUT\_REPLAY\_CAMERADOWN                        | PAGE DOWN      |
| 318   | INPUT\_REPLAY\_SAVE                              | F5             |
| 319   | INPUT\_REPLAY\_TOGGLETIME                        | C              |
| 320   | INPUT\_REPLAY\_TOGGLETIPS                        | V              |
| 321   | INPUT\_REPLAY\_PREVIEW                           | SPACEBAR       |
| 322   | INPUT\_REPLAY\_TOGGLE\_TIMELINE                  | ESC            |
| 323   | INPUT\_REPLAY\_TIMELINE\_PICKUP\_CLIP            | X              |
| 324   | INPUT\_REPLAY\_TIMELINE\_DUPLICATE\_CLIP         | C              |
| 325   | INPUT\_REPLAY\_TIMELINE\_PLACE\_CLIP             | V              |
| 326   | INPUT\_REPLAY\_CTRL                              | LEFT CTRL      |
| 327   | INPUT\_REPLAY\_TIMELINE\_SAVE                    | F5             |
| 328   | INPUT\_REPLAY\_PREVIEW\_AUDIO                    | SPACEBAR       |
| 329   | INPUT\_VEH\_DRIVE\_LOOK                          | LEFT MOUSE BUTTON |
| 330   | INPUT\_VEH\_DRIVE\_LOOK2                         | RIGHT MOUSE BUTTON |
| 331   | INPUT\_VEH\_FLY\_ATTACK2                         | RIGHT MOUSE BUTTON |
| 332   | INPUT\_RADIO\_WHEEL\_UD                          | MOUSE DOWN     |
| 333   | INPUT\_RADIO\_WHEEL\_LR                          | MOUSE RIGHT    |
| 334   | INPUT\_VEH\_SLOWMO\_UD                           | SCROLLWHEEL DOWN |
| 335   | INPUT\_VEH\_SLOWMO\_UP\_ONLY                     | SCROLLWHEEL UP |
| 336   | INPUT\_VEH\_SLOWMO\_DOWN\_ONLY                   | SCROLLWHEEL DOWN |
| 337   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_TOGGLE          | X              |
| 338   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_LEFT            | A              |
| 339   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_RIGHT           | D              |
| 340   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_UP              | LEFT SHIFT     |
| 341   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_DOWN            | LEFT CTRL      |
| 342   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_UD              | D              |
| 343   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_LR              | LEFT CTRL      |
| 344   | INPUT\_SWITCH\_VISOR                             | F11            |
| 345   | INPUT\_VEH\_MELEE\_HOLD                          | X              |
| 346   | INPUT\_VEH\_MELEE\_LEFT                          | LEFT MOUSE BUTTON |
| 347   | INPUT\_VEH\_MELEE\_RIGHT                         | RIGHT MOUSE BUTTON |
| 348   | INPUT\_MAP\_POI                                  | SCROLLWHEEL BUTTON (PRESS) |
| 349   | INPUT\_REPLAY\_SNAPMATIC\_PHOTO                  | TAB            |
| 350   | INPUT\_VEH\_CAR\_JUMP                            | E              |
| 351   | INPUT\_VEH\_ROCKET\_BOOST                        | E              |
| 352   | INPUT\_VEH\_FLY\_BOOST                           | LEFT SHIFT     |
| 353   | INPUT\_VEH\_PARACHUTE                            | SPACEBAR       |
| 354   | INPUT\_VEH\_BIKE\_WINGS                          | X              |
| 355   | INPUT\_VEH\_FLY\_BOMB\_BAY                       | E              |
| 356   | INPUT\_VEH\_FLY\_COUNTER                         | E              |
| 357   | INPUT\_VEH\_TRANSFORM                            | X              |
