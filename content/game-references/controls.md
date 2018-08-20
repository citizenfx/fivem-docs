---
title: Controls
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
| 1     | INPUT\_LOOK\_LR                                  |                |
| 2     | INPUT\_LOOK\_UD                                  |                |
| 3     | INPUT\_LOOK\_UP\_ONLY                            |                |
| 4     | INPUT\_LOOK\_DOWN\_ONLY                          |                |
| 5     | INPUT\_LOOK\_LEFT\_ONLY                          |                |
| 6     | INPUT\_LOOK\_RIGHT\_ONLY                         |                |
| 7     | INPUT\_CINEMATIC\_SLOWMO                         |                |
| 8     | INPUT\_SCRIPTED\_FLY\_UD                         |                |
| 9     | INPUT\_SCRIPTED\_FLY\_LR                         |                |
| 10    | INPUT\_SCRIPTED\_FLY\_ZUP                        | PAGEUP         |
| 11    | INPUT\_SCRIPTED\_FLY\_ZDOWN                      | PAGEDOWN       |
| 12    | INPUT\_WEAPON\_WHEEL\_UD                         |                |
| 13    | INPUT\_WEAPON\_WHEEL\_LR                         |                |
| 14    | INPUT\_WEAPON\_WHEEL\_NEXT                       |                |
| 15    | INPUT\_WEAPON\_WHEEL\_PREV                       |                |
| 16    | INPUT\_SELECT\_NEXT\_WEAPON                      |                |
| 17    | INPUT\_SELECT\_PREV\_WEAPON                      |                |
| 18    | INPUT\_SKIP\_CUTSCENE                            | ENTER          |
| 19    | INPUT\_CHARACTER\_WHEEL                          | LEFTALT        |
| 20    | INPUT\_MULTIPLAYER\_INFO                         | Z              |
| 21    | INPUT\_SPRINT                                    | LEFTSHIFT      |
| 22    | INPUT\_JUMP                                      | SPACE          |
| 23    | INPUT\_ENTER                                     | F              |
| 24    | INPUT\_ATTACK                                    |                |
| 25    | INPUT\_AIM                                       |                |
| 26    | INPUT\_LOOK\_BEHIND                              | C              |
| 27    | INPUT\_PHONE                                     | ARROWUP        |
| 28    | INPUT\_SPECIAL\_ABILITY                          |                |
| 29    | INPUT\_SPECIAL\_ABILITY\_SECONDARY               | B              |
| 30    | INPUT\_MOVE\_LR                                  |                |
| 31    | INPUT\_MOVE\_UD                                  |                |
| 32    | INPUT\_MOVE\_UP\_ONLY                            | W              |
| 33    | INPUT\_MOVE\_DOWN\_ONLY                          | S              |
| 34    | INPUT\_MOVE\_LEFT\_ONLY                          | A              |
| 35    | INPUT\_MOVE\_RIGHT\_ONLY                         | D              |
| 36    | INPUT\_DUCK                                      | LEFTCTRL       |
| 37    | INPUT\_SELECT\_WEAPON                            | TAB            |
| 38    | INPUT\_PICKUP                                    | E              |
| 39    | INPUT\_SNIPER\_ZOOM                              | \[             |
| 40    | INPUT\_SNIPER\_ZOOM\_IN\_ONLY                    | \]             |
| 41    | INPUT\_SNIPER\_ZOOM\_OUT\_ONLY                   |                |
| 42    | INPUT\_SNIPER\_ZOOM\_IN\_SECONDARY               |                |
| 43    | INPUT\_SNIPER\_ZOOM\_OUT\_SECONDARY              |                |
| 44    | INPUT\_COVER                                     | Q              |
| 45    | INPUT\_RELOAD                                    | R              |
| 46    | INPUT\_TALK                                      |                |
| 47    | INPUT\_DETONATE                                  | G              |
| 48    | INPUT\_HUD\_SPECIAL                              |                |
| 49    | INPUT\_ARREST                                    |                |
| 50    | INPUT\_ACCURATE\_AIM                             |                |
| 51    | INPUT\_CONTEXT                                   |                |
| 52    | INPUT\_CONTEXT\_SECONDARY                        |                |
| 53    | INPUT\_WEAPON\_SPECIAL                           |                |
| 54    | INPUT\_WEAPON\_SPECIAL\_TWO                      |                |
| 55    | INPUT\_DIVE                                      |                |
| 56    | INPUT\_DROP\_WEAPON                              | F9             |
| 57    | INPUT\_DROP\_AMMO                                | F10            |
| 58    | INPUT\_THROW\_GRENADE                            |                |
| 59    | INPUT\_VEH\_MOVE\_LR                             |                |
| 60    | INPUT\_VEH\_MOVE\_UD                             |                |
| 61    | INPUT\_VEH\_MOVE\_UP\_ONLY                       |                |
| 62    | INPUT\_VEH\_MOVE\_DOWN\_ONLY                     |                |
| 63    | INPUT\_VEH\_MOVE\_LEFT\_ONLY                     |                |
| 64    | INPUT\_VEH\_MOVE\_RIGHT\_ONLY                    |                |
| 65    | INPUT\_VEH\_SPECIAL                              |                |
| 66    | INPUT\_VEH\_GUN\_LR                              |                |
| 67    | INPUT\_VEH\_GUN\_UD                              |                |
| 68    | INPUT\_VEH\_AIM                                  |                |
| 69    | INPUT\_VEH\_ATTACK                               |                |
| 70    | INPUT\_VEH\_ATTACK2                              |                |
| 71    | INPUT\_VEH\_ACCELERATE                           | W              |
| 72    | INPUT\_VEH\_BRAKE                                |                |
| 73    | INPUT\_VEH\_DUCK                                 | X              |
| 74    | INPUT\_VEH\_HEADLIGHT                            | H              |
| 75    | INPUT\_VEH\_EXIT                                 |                |
| 76    | INPUT\_VEH\_HANDBRAKE                            |                |
| 77    | INPUT\_VEH\_HOTWIRE\_LEFT                        |                |
| 78    | INPUT\_VEH\_HOTWIRE\_RIGHT                       |                |
| 79    | INPUT\_VEH\_LOOK\_BEHIND                         |                |
| 80    | INPUT\_VEH\_CIN\_CAM                             |                |
| 81    | INPUT\_VEH\_NEXT\_RADIO                          | .              |
| 82    | INPUT\_VEH\_PREV\_RADIO                          | ,              |
| 83    | INPUT\_VEH\_NEXT\_RADIO\_TRACK                   | =              |
| 84    | INPUT\_VEH\_PREV\_RADIO\_TRACK                   | -              |
| 85    | INPUT\_VEH\_RADIO\_WHEEL                         |                |
| 86    | INPUT\_VEH\_HORN                                 |                |
| 87    | INPUT\_VEH\_FLY\_THROTTLE\_UP                    |                |
| 88    | INPUT\_VEH\_FLY\_THROTTLE\_DOWN                  |                |
| 89    | INPUT\_VEH\_FLY\_YAW\_LEFT                       |                |
| 90    | INPUT\_VEH\_FLY\_YAW\_RIGHT                      |                |
| 91    | INPUT\_VEH\_PASSENGER\_AIM                       |                |
| 92    | INPUT\_VEH\_PASSENGER\_ATTACK                    |                |
| 93    | INPUT\_VEH\_SPECIAL\_ABILITY\_FRANKLIN           |                |
| 94    | INPUT\_VEH\_STUNT\_UD                            |                |
| 95    | INPUT\_VEH\_CINEMATIC\_UD                        |                |
| 96    | INPUT\_VEH\_CINEMATIC\_UP\_ONLY                  | NUMPAD-        |
| 97    | INPUT\_VEH\_CINEMATIC\_DOWN\_ONLY                | NUMPAD+        |
| 98    | INPUT\_VEH\_CINEMATIC\_LR                        |                |
| 99    | INPUT\_VEH\_SELECT\_NEXT\_WEAPON                 |                |
| 100   | INPUT\_VEH\_SELECT\_PREV\_WEAPON                 |                |
| 101   | INPUT\_VEH\_ROOF                                 |                |
| 102   | INPUT\_VEH\_JUMP                                 |                |
| 103   | INPUT\_VEH\_GRAPPLING\_HOOK                      |                |
| 104   | INPUT\_VEH\_SHUFFLE                              |                |
| 105   | INPUT\_VEH\_DROP\_PROJECTILE                     |                |
| 106   | INPUT\_VEH\_MOUSE\_CONTROL\_OVERRIDE             |                |
| 107   | INPUT\_VEH\_FLY\_ROLL\_LR                        |                |
| 108   | INPUT\_VEH\_FLY\_ROLL\_LEFT\_ONLY                | NUMPAD4        |
| 109   | INPUT\_VEH\_FLY\_ROLL\_RIGHT\_ONLY               | NUMPAD6        |
| 110   | INPUT\_VEH\_FLY\_PITCH\_UD                       |                |
| 111   | INPUT\_VEH\_FLY\_PITCH\_UP\_ONLY                 |                |
| 112   | INPUT\_VEH\_FLY\_PITCH\_DOWN\_ONLY               |                |
| 113   | INPUT\_VEH\_FLY\_UNDERCARRIAGE                   |                |
| 114   | INPUT\_VEH\_FLY\_ATTACK                          |                |
| 115   | INPUT\_VEH\_FLY\_SELECT\_NEXT\_WEAPON            |                |
| 116   | INPUT\_VEH\_FLY\_SELECT\_PREV\_WEAPON            |                |
| 117   | INPUT\_VEH\_FLY\_SELECT\_TARGET\_LEFT            |                |
| 118   | INPUT\_VEH\_FLY\_SELECT\_TARGET\_RIGHT           | NUMPAD9        |
| 119   | INPUT\_VEH\_FLY\_VERTICAL\_FLIGHT\_MODE          |                |
| 120   | INPUT\_VEH\_FLY\_DUCK                            |                |
| 121   | INPUT\_VEH\_FLY\_ATTACK\_CAMERA                  |                |
| 122   | INPUT\_VEH\_FLY\_MOUSE\_CONTROL\_OVERRIDE        |                |
| 123   | INPUT\_VEH\_SUB\_TURN\_LR                        |                |
| 124   | INPUT\_VEH\_SUB\_TURN\_LEFT\_ONLY                | NUMPAD4        |
| 125   | INPUT\_VEH\_SUB\_TURN\_RIGHT\_ONLY               | NUMPAD6        |
| 126   | INPUT\_VEH\_SUB\_PITCH\_UD                       |                |
| 127   | INPUT\_VEH\_SUB\_PITCH\_UP\_ONLY                 | NUMPAD8        |
| 128   | INPUT\_VEH\_SUB\_PITCH\_DOWN\_ONLY               | NUMPAD5        |
| 129   | INPUT\_VEH\_SUB\_THROTTLE\_UP                    | W              |
| 130   | INPUT\_VEH\_SUB\_THROTTLE\_DOWN                  | S              |
| 131   | INPUT\_VEH\_SUB\_ASCEND                          | LEFTSHIFT      |
| 132   | INPUT\_VEH\_SUB\_DESCEND                         | LEFTCTRL       |
| 133   | INPUT\_VEH\_SUB\_TURN\_HARD\_LEFT                | A              |
| 134   | INPUT\_VEH\_SUB\_TURN\_HARD\_RIGHT               | D              |
| 135   | INPUT\_VEH\_SUB\_MOUSE\_CONTROL\_OVERRIDE        | LEFTMOUSE      |
| 136   | INPUT\_VEH\_PUSHBIKE\_PEDAL                      |                |
| 137   | INPUT\_VEH\_PUSHBIKE\_SPRINT                     | CAPSLOCK       |
| 138   | INPUT\_VEH\_PUSHBIKE\_FRONT\_BRAKE               |                |
| 139   | INPUT\_VEH\_PUSHBIKE\_REAR\_BRAKE                |                |
| 140   | INPUT\_MELEE\_ATTACK\_LIGHT                      |                |
| 141   | INPUT\_MELEE\_ATTACK\_HEAVY                      |                |
| 142   | INPUT\_MELEE\_ATTACK\_ALTERNATE                  |                |
| 143   | INPUT\_MELEE\_BLOCK                              |                |
| 144   | INPUT\_PARACHUTE\_DEPLOY                         |                |
| 145   | INPUT\_PARACHUTE\_DETACH                         |                |
| 146   | INPUT\_PARACHUTE\_TURN\_LR                       |                |
| 147   | INPUT\_PARACHUTE\_TURN\_LEFT\_ONLY               |                |
| 148   | INPUT\_PARACHUTE\_TURN\_RIGHT\_ONLY              |                |
| 149   | INPUT\_PARACHUTE\_PITCH\_UD                      |                |
| 150   | INPUT\_PARACHUTE\_PITCH\_UP\_ONLY                |                |
| 151   | INPUT\_PARACHUTE\_PITCH\_DOWN\_ONLY              |                |
| 152   | INPUT\_PARACHUTE\_BRAKE\_LEFT                    |                |
| 153   | INPUT\_PARACHUTE\_BRAKE\_RIGHT                   |                |
| 154   | INPUT\_PARACHUTE\_SMOKE                          |                |
| 155   | INPUT\_PARACHUTE\_PRECISION\_LANDING             |                |
| 156   | INPUT\_MAP                                       |                |
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
| 169   | INPUT\_SELECT\_CHARACTER\_MULTIPLAYER            | F8             |
| 170   | INPUT\_SAVE\_REPLAY\_CLIP                        | F3             |
| 171   | INPUT\_SPECIAL\_ABILITY\_PC                      |                |
| 172   | INPUT\_CELLPHONE\_UP                             | ARROWUP        |
| 173   | INPUT\_CELLPHONE\_DOWN                           | ARROWDOWN      |
| 174   | INPUT\_CELLPHONE\_LEFT                           | ARROWLEFT      |
| 175   | INPUT\_CELLPHONE\_RIGHT                          | ARROWRIGHT     |
| 176   | INPUT\_CELLPHONE\_SELECT                         | ENTER          |
| 177   | INPUT\_CELLPHONE\_CANCEL                         | BACKSPACE      |
| 178   | INPUT\_CELLPHONE\_OPTION                         | DELETE         |
| 179   | INPUT\_CELLPHONE\_EXTRA\_OPTION                  |                |
| 180   | INPUT\_CELLPHONE\_SCROLL\_FORWARD                |                |
| 181   | INPUT\_CELLPHONE\_SCROLL\_BACKWARD               |                |
| 182   | INPUT\_CELLPHONE\_CAMERA\_FOCUS\_LOCK            | L              |
| 183   | INPUT\_CELLPHONE\_CAMERA\_GRID                   |                |
| 184   | INPUT\_CELLPHONE\_CAMERA\_SELFIE                 |                |
| 185   | INPUT\_CELLPHONE\_CAMERA\_DOF                    |                |
| 186   | INPUT\_CELLPHONE\_CAMERA\_EXPRESSION             |                |
| 187   | INPUT\_FRONTEND\_DOWN                            |                |
| 188   | INPUT\_FRONTEND\_UP                              |                |
| 189   | INPUT\_FRONTEND\_LEFT                            |                |
| 190   | INPUT\_FRONTEND\_RIGHT                           |                |
| 191   | INPUT\_FRONTEND\_RDOWN                           |                |
| 192   | INPUT\_FRONTEND\_RUP                             |                |
| 193   | INPUT\_FRONTEND\_RLEFT                           |                |
| 194   | INPUT\_FRONTEND\_RRIGHT                          |                |
| 195   | INPUT\_FRONTEND\_AXIS\_X                         |                |
| 196   | INPUT\_FRONTEND\_AXIS\_Y                         |                |
| 197   | INPUT\_FRONTEND\_RIGHT\_AXIS\_X                  |                |
| 198   | INPUT\_FRONTEND\_RIGHT\_AXIS\_Y                  |                |
| 199   | INPUT\_FRONTEND\_PAUSE                           | P              |
| 200   | INPUT\_FRONTEND\_PAUSE\_ALTERNATE                |                |
| 201   | INPUT\_FRONTEND\_ACCEPT                          | ENTER          |
| 202   | INPUT\_FRONTEND\_CANCEL                          | BACKSPACE      |
| 203   | INPUT\_FRONTEND\_X                               |                |
| 204   | INPUT\_FRONTEND\_Y                               |                |
| 205   | INPUT\_FRONTEND\_LB                              |                |
| 206   | INPUT\_FRONTEND\_RB                              |                |
| 207   | INPUT\_FRONTEND\_LT                              |                |
| 208   | INPUT\_FRONTEND\_RT                              |                |
| 209   | INPUT\_FRONTEND\_LS                              |                |
| 210   | INPUT\_FRONTEND\_RS                              |                |
| 211   | INPUT\_FRONTEND\_LEADERBOARD                     |                |
| 212   | INPUT\_FRONTEND\_SOCIAL\_CLUB                    |                |
| 213   | INPUT\_FRONTEND\_SOCIAL\_CLUB\_SECONDARY         | HOME           |
| 214   | INPUT\_FRONTEND\_DELETE                          |                |
| 215   | INPUT\_FRONTEND\_ENDSCREEN\_ACCEPT               |                |
| 216   | INPUT\_FRONTEND\_ENDSCREEN\_EXPAND               |                |
| 217   | INPUT\_FRONTEND\_SELECT                          |                |
| 218   | INPUT\_SCRIPT\_LEFT\_AXIS\_X                     |                |
| 219   | INPUT\_SCRIPT\_LEFT\_AXIS\_Y                     |                |
| 220   | INPUT\_SCRIPT\_RIGHT\_AXIS\_X                    |                |
| 221   | INPUT\_SCRIPT\_RIGHT\_AXIS\_Y                    |                |
| 222   | INPUT\_SCRIPT\_RUP                               |                |
| 223   | INPUT\_SCRIPT\_RDOWN                             |                |
| 224   | INPUT\_SCRIPT\_RLEFT                             |                |
| 225   | INPUT\_SCRIPT\_RRIGHT                            |                |
| 226   | INPUT\_SCRIPT\_LB                                |                |
| 227   | INPUT\_SCRIPT\_RB                                |                |
| 228   | INPUT\_SCRIPT\_LT                                |                |
| 229   | INPUT\_SCRIPT\_RT                                |                |
| 230   | INPUT\_SCRIPT\_LS                                |                |
| 231   | INPUT\_SCRIPT\_RS                                |                |
| 232   | INPUT\_SCRIPT\_PAD\_UP                           |                |
| 233   | INPUT\_SCRIPT\_PAD\_DOWN                         |                |
| 234   | INPUT\_SCRIPT\_PAD\_LEFT                         |                |
| 235   | INPUT\_SCRIPT\_PAD\_RIGHT                        |                |
| 236   | INPUT\_SCRIPT\_SELECT                            |                |
| 237   | INPUT\_CURSOR\_ACCEPT                            |                |
| 238   | INPUT\_CURSOR\_CANCEL                            |                |
| 239   | INPUT\_CURSOR\_X                                 |                |
| 240   | INPUT\_CURSOR\_Y                                 |                |
| 241   | INPUT\_CURSOR\_SCROLL\_UP                        |                |
| 242   | INPUT\_CURSOR\_SCROLL\_DOWN                      |                |
| 243   | INPUT\_ENTER\_CHEAT\_CODE                        | ~              |
| 244   | INPUT\_INTERACTION\_MENU                         | M              |
| 245   | INPUT\_MP\_TEXT\_CHAT\_ALL                       | T              |
| 246   | INPUT\_MP\_TEXT\_CHAT\_TEAM                      | Y              |
| 247   | INPUT\_MP\_TEXT\_CHAT\_FRIENDS                   |                |
| 248   | INPUT\_MP\_TEXT\_CHAT\_CREW                      |                |
| 249   | INPUT\_PUSH\_TO\_TALK                            | N              |
| 250   | INPUT\_CREATOR\_LS                               |                |
| 251   | INPUT\_CREATOR\_RS                               |                |
| 252   | INPUT\_CREATOR\_LT                               |                |
| 253   | INPUT\_CREATOR\_RT                               |                |
| 254   | INPUT\_CREATOR\_MENU\_TOGGLE                     |                |
| 255   | INPUT\_CREATOR\_ACCEPT                           |                |
| 256   | INPUT\_CREATOR\_DELETE                           |                |
| 257   | INPUT\_ATTACK2                                   |                |
| 258   | INPUT\_RAPPEL\_JUMP                              |                |
| 259   | INPUT\_RAPPEL\_LONG\_JUMP                        |                |
| 260   | INPUT\_RAPPEL\_SMASH\_WINDOW                     |                |
| 261   | INPUT\_PREV\_WEAPON                              |                |
| 262   | INPUT\_NEXT\_WEAPON                              |                |
| 263   | INPUT\_MELEE\_ATTACK1                            |                |
| 264   | INPUT\_MELEE\_ATTACK2                            |                |
| 265   | INPUT\_WHISTLE                                   |                |
| 266   | INPUT\_MOVE\_LEFT                                |                |
| 267   | INPUT\_MOVE\_RIGHT                               |                |
| 268   | INPUT\_MOVE\_UP                                  |                |
| 269   | INPUT\_MOVE\_DOWN                                |                |
| 270   | INPUT\_LOOK\_LEFT                                |                |
| 271   | INPUT\_LOOK\_RIGHT                               |                |
| 272   | INPUT\_LOOK\_UP                                  |                |
| 273   | INPUT\_LOOK\_DOWN                                |                |
| 274   | INPUT\_SNIPER\_ZOOM\_IN                          |                |
| 275   | INPUT\_SNIPER\_ZOOM\_OUT                         |                |
| 276   | INPUT\_SNIPER\_ZOOM\_IN\_ALTERNATE               |                |
| 277   | INPUT\_SNIPER\_ZOOM\_OUT\_ALTERNATE              |                |
| 278   | INPUT\_VEH\_MOVE\_LEFT                           |                |
| 279   | INPUT\_VEH\_MOVE\_RIGHT                          |                |
| 280   | INPUT\_VEH\_MOVE\_UP                             |                |
| 281   | INPUT\_VEH\_MOVE\_DOWN                           |                |
| 282   | INPUT\_VEH\_GUN\_LEFT                            |                |
| 283   | INPUT\_VEH\_GUN\_RIGHT                           |                |
| 284   | INPUT\_VEH\_GUN\_UP                              |                |
| 285   | INPUT\_VEH\_GUN\_DOWN                            |                |
| 286   | INPUT\_VEH\_LOOK\_LEFT                           |                |
| 287   | INPUT\_VEH\_LOOK\_RIGHT                          |                |
| 288   | INPUT\_REPLAY\_START\_STOP\_RECORDING            | F1             |
| 289   | INPUT\_REPLAY\_START\_STOP\_RECORDING\_SECONDARY | F2             |
| 290   | INPUT\_SCALED\_LOOK\_LR                          |                |
| 291   | INPUT\_SCALED\_LOOK\_UD                          |                |
| 292   | INPUT\_SCALED\_LOOK\_UP\_ONLY                    |                |
| 293   | INPUT\_SCALED\_LOOK\_DOWN\_ONLY                  |                |
| 294   | INPUT\_SCALED\_LOOK\_LEFT\_ONLY                  |                |
| 295   | INPUT\_SCALED\_LOOK\_RIGHT\_ONLY                 |                |
| 296   | INPUT\_REPLAY\_MARKER\_DELETE                    |                |
| 297   | INPUT\_REPLAY\_CLIP\_DELETE                      |                |
| 298   | INPUT\_REPLAY\_PAUSE                             |                |
| 299   | INPUT\_REPLAY\_REWIND                            |                |
| 300   | INPUT\_REPLAY\_FFWD                              |                |
| 301   | INPUT\_REPLAY\_NEWMARKER                         |                |
| 302   | INPUT\_REPLAY\_RECORD                            |                |
| 303   | INPUT\_REPLAY\_SCREENSHOT                        | U              |
| 304   | INPUT\_REPLAY\_HIDEHUD                           |                |
| 305   | INPUT\_REPLAY\_STARTPOINT                        |                |
| 306   | INPUT\_REPLAY\_ENDPOINT                          |                |
| 307   | INPUT\_REPLAY\_ADVANCE                           |                |
| 308   | INPUT\_REPLAY\_BACK                              |                |
| 309   | INPUT\_REPLAY\_TOOLS                             |                |
| 310   | INPUT\_REPLAY\_RESTART                           |                |
| 311   | INPUT\_REPLAY\_SHOWHOTKEY                        | K              |
| 312   | INPUT\_REPLAY\_CYCLEMARKERLEFT                   |                |
| 313   | INPUT\_REPLAY\_CYCLEMARKERRIGHT                  |                |
| 314   | INPUT\_REPLAY\_FOVINCREASE                       |                |
| 315   | INPUT\_REPLAY\_FOVDECREASE                       |                |
| 316   | INPUT\_REPLAY\_CAMERAUP                          |                |
| 317   | INPUT\_REPLAY\_CAMERADOWN                        |                |
| 318   | INPUT\_REPLAY\_SAVE                              |                |
| 319   | INPUT\_REPLAY\_TOGGLETIME                        |                |
| 320   | INPUT\_REPLAY\_TOGGLETIPS                        |                |
| 321   | INPUT\_REPLAY\_PREVIEW                           |                |
| 322   | INPUT\_REPLAY\_TOGGLE\_TIMELINE                  | ESC            |
| 323   | INPUT\_REPLAY\_TIMELINE\_PICKUP\_CLIP            |                |
| 324   | INPUT\_REPLAY\_TIMELINE\_DUPLICATE\_CLIP         |                |
| 325   | INPUT\_REPLAY\_TIMELINE\_PLACE\_CLIP             |                |
| 326   | INPUT\_REPLAY\_CTRL                              |                |
| 327   | INPUT\_REPLAY\_TIMELINE\_SAVE                    |                |
| 328   | INPUT\_REPLAY\_PREVIEW\_AUDIO                    |                |
| 329   | INPUT\_VEH\_DRIVE\_LOOK                          |                |
| 330   | INPUT\_VEH\_DRIVE\_LOOK2                         |                |
| 331   | INPUT\_VEH\_FLY\_ATTACK2                         |                |
| 332   | INPUT\_RADIO\_WHEEL\_UD                          |                |
| 333   | INPUT\_RADIO\_WHEEL\_LR                          |                |
| 334   | INPUT\_VEH\_SLOWMO\_UD                           |                |
| 335   | INPUT\_VEH\_SLOWMO\_UP\_ONLY                     |                |
| 336   | INPUT\_VEH\_SLOWMO\_DOWN\_ONLY                   |                |
| 337   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_TOGGLE          |                |
| 338   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_LEFT            |                |
| 339   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_RIGHT           |                |
| 340   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_UP              |                |
| 341   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_DOWN            |                |
| 342   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_UD              |                |
| 343   | INPUT\_VEH\_HYDRAULICS\_CONTROL\_LR              |                |
| 344   | INPUT\_MAP\_POI                                  |                |
| 345   | INPUT\_REPLAY\_SNAPMATIC\_PHOTO                  |                |
