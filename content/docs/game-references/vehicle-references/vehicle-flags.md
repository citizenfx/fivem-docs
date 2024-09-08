---
title: Vehicle Flags
weight: 780
---

| Flag Number | Flag Name | Description | Build Introduced |
|-------------|-----------|-------------|-------------------|
| 0 | FLAG_SMALL_WORKER | Vehicle can only spawn on path nodes flagged to allow small worker vehicles. |  |
| 1 | FLAG_BIG | Peds driving the vehicle will take wider turns, increase space between traffic, and avoid ramming during chases. |  |
| 2 | FLAG_NO_BOOT | Does nothing. Derivative from the IV flag noboot. |  |
| 3 | FLAG_ONLY_DURING_OFFICE_HOURS | Prevents spawning outside office hours, doesn't work correctly due to misconfigured time settings. |  |
| 4 | FLAG_BOOT_IN_FRONT | Does nothing. Use FLAG_FRONT_BOOT instead. |  |
| 5 | FLAG_IS_VAN | The vehicle never spawns in traffic with more than one passenger. |  |
| 6 | FLAG_AVOID_TURNS | AI avoids turns at intersections unless no other path is available. Spawns on multi-lane roads. |  |
| 7 | FLAG_HAS_LIVERY | Cycles liveries from vehicle's texture dictionary, up to 30 liveries. |  |
| 8 | FLAG_LIVERY_MATCH_EXTRA | Vehicle spawns with livery matching toggled on extra; defaults to last livery if more extras than liveries. |  |
| 9 | FLAG_SPORTS | Idle camera focuses on the vehicle if swankness > 4. Faster drivers, prioritized colors, alarms on parked vehicles. |  |
| 10 | FLAG_DELIVERY | Parked vehicles spawn with wheels at a much higher angle. |  |
| 11 | FLAG_NOAMBIENTOCCLUSION | Disables ground ambient occlusion. |  |
| 12 | FLAG_ONLY_ON_HIGHWAYS | Vehicle only spawns on highways. Derivative of an unused flag. |  |
| 13 | FLAG_TALL_SHIP | Prevents spawning under low bridges. |  |
| 14 | FLAG_SPAWN_ON_TRAILER | Vehicles have a 50% chance of spawning on trailers; disabled in multiplayer. |  |
| 15 | FLAG_SPAWN_BOAT_ON_TRAILER | Similar to FLAG_SPAWN_ON_TRAILER but for boats; positioning relative to boattrailer. |  |
| 16 | FLAG_EXTRAS_GANG | Vehicle spawns with extras 5-9 if driven by a gang member. |  |
| 17 | FLAG_EXTRAS_CONVERTIBLE | Cycles between extras 1-4, toggling roof status. Extras are unbreakable. |  |
| 18 | FLAG_EXTRAS_TAXI | Enables taxi logic, including cycling extras and setting lights. |  |
| 19 | FLAG_EXTRAS_RARE | Extras have a 25% chance of spawning. |  |
| 20 | FLAG_EXTRAS_REQUIRE | The vehicle always spawns with at least one extra. |  |
| 21 | FLAG_EXTRAS_STRONG | Prevents extras from breaking off during collisions. |  |
| 22 | FLAG_EXTRAS_ONLY_BREAK_WHEN_DESTROYED | Extras only break when the vehicle is completely destroyed. |  |
| 23 | FLAG_EXTRAS_SCRIPT | Specific extras only spawn when toggled by script. |  |
| 24 | FLAG_EXTRAS_ALL | Vehicle spawns with all extras toggled on. |  |
| 25 | FLAG_EXTRAS_MATCH_LIVERY | Vehicle spawns with extra matching livery ID. |  |
| 26 | FLAG_DONT_ROTATE_TAIL_ROTOR | Prevents helicopter tail rotor from rotating. |  |
| 27 | FLAG_PARKING_SENSORS | Vehicle has a parking sensor gadget. |  |
| 28 | FLAG_PEDS_CAN_STAND_ON_TOP | Allows peds to stand on the vehicle without ragdolling. |  |
| 29 | FLAG_TAILGATE_TYPE_BOOT | Does nothing. |  |
| 30 | FLAG_GEN_NAVMESH | Generates navmesh, typically used on boats, trailers, and train cars. |  |
| 31 | FLAG_LAW_ENFORCEMENT | Multiple effects, including use of searchlights by helicopters and enhanced wanted level dynamics. |  |
| 32 | FLAG_EMERGENCY_SERVICE | Prevents certain responses from peds and alters how vehicle theft is perceived. |  |
| 33 | FLAG_DRIVER_NO_DRIVE_BY | Prevents the driver from using weapons. |  |
| 34 | FLAG_NO_RESPRAY | Disables the ability to respray the vehicle. |  |
| 35 | FLAG_IGNORE_ON_SIDE_CHECK | Player avoids pathfinding toward vehicles on their side. |  |
| 36 | FLAG_RICH_CAR | Seen driven by rich NPCs and triggers strong reactions upon collision. |  |
| 37 | FLAG_AVERAGE_CAR | Seen driven by average NPCs in traffic. |  |
| 38 | FLAG_POOR_CAR | Seen driven by poor NPCs in traffic. |  |
| 39 | FLAG_ALLOWS_RAPPEL | Allows peds to rappel from the vehicle. |  |
| 40 | FLAG_DONT_CLOSE_DOOR_UPON_EXIT | Peds don't close the door after exiting. |  |
| 41 | FLAG_USE_HIGHER_DOOR_TORQUE | Higher door torque setting. |  |
| 42 | FLAG_DISABLE_THROUGH_WINDSCREEN | Prevents peds from being ejected through the windshield during a crash. |  |
| 43 | FLAG_IS_ELECTRIC | Disables oil leaks and damage to the fuel tank. Trains with this flag will stop for vehicles blocking their path. |  |
| 44 | FLAG_NO_BROKEN_DOWN_SCENARIO | Vehicle will never spawn in a broken-down scenario. |  |
| 45 | FLAG_IS_JETSKI | Jetski classification flag. |  |
| 46 | FLAG_DAMPEN_STICKBOMB_DAMAGE | Takes less damage from sticky bomb explosions. |  |
| 47 | FLAG_DONT_SPAWN_IN_CARGEN | Prevents the vehicle from spawning in parked scenarios. |  |
| 48 | FLAG_IS_OFFROAD_VEHICLE | AI considers off-road paths as valid routes. |  |
| 49 | FLAG_INCREASE_PED_COMMENTS | Increases random comments about the vehicle. |  |
| 50 | FLAG_EXPLODE_ON_CONTACT | Explodes on contact setting. |  |
| 51 | FLAG_USE_FAT_INTERIOR_LIGHT | Increases the size and intensity of the vehicle’s interior light. |  |
| 52 | FLAG_HEADLIGHTS_USE_ACTUAL_BONE_POS | Uses actual bone position for headlights. |  |
| 53 | FLAG_FAKE_EXTRALIGHTS | Treats extra lights as normal headlights. |  |
| 54 | FLAG_CANNOT_BE_MODDED | Vehicle cannot enter modification shops. |  |
| 55 | FLAG_DONT_SPAWN_AS_AMBIENT | Prevents ambient spawning. |  |
| 56 | FLAG_IS_BULKY | Bulkiness classification. |  |
| 57 | FLAG_BLOCK_FROM_ATTRACTOR_SCENARIO | Blocks spawning in WORLD_VEHICLE_ATTRACTOR scenarios. |  |
| 58 | FLAG_IS_BUS | Identifies the vehicle as a bus. |  |
| 59 | FLAG_USE_STEERING_PARAM_FOR_LEAN | Steering parameter affects leaning. |  |
| 60 | FLAG_CANNOT_BE_DRIVEN_BY_PLAYER | Player cannot enter the vehicle. |  |
| 61 | FLAG_SPRAY_PETROL_BEFORE_EXPLOSION | Spills gasoline before exploding. |  |
| 62 | FLAG_ATTACH_TRAILER_ON_HIGHWAY | Spawns with a trailer only on highways. |  |
| 63 | FLAG_ATTACH_TRAILER_IN_CITY | Spawns with a trailer only in the city. |  |
| 64 | FLAG_HAS_NO_ROOF | Ignores roof checks, allows hats with no roof. |  |
| 65 | FLAG_ALLOW_TARGETING_OF_OCCUPANTS | Allows targeting of vehicle occupants. |  |
| 66 | FLAG_RECESSED_HEADLIGHT_CORONAS | Recessed headlight coronas. |  |
| 67 | FLAG_RECESSED_TAILLIGHT_CORONAS | Recessed taillight coronas. |  |
| 68 | FLAG_IS_TRACKED_FOR_TRAILS | Does nothing. |  |
| 69 | FLAG_HEADLIGHTS_ON_LANDINGGEAR | Headlights on landing gear. |  |
| 70 | FLAG_CONSIDERED_FOR_VEHICLE_ENTRY_WHEN_STOOD_ON | Peds prioritize entry when standing on the vehicle. |  |
| 71 | FLAG_GIVE_SCUBA_GEAR_ON_EXIT | Provides scuba gear upon exit. |  |
| 72 | FLAG_IS_DIGGER | Digger classification flag. |  |
| 73 | FLAG_IS_TANK | Makes the vehicle fireproof and AI reacts as if it's a tank. |  |
| 74 | FLAG_USE_COVERBOUND_INFO_FOR_COVERGEN | Uses coverbound info for cover generation. |  |
| 75 | FLAG_CAN_BE_DRIVEN_ON | Other vehicles can drive on top of it. |  |
| 76 | FLAG_HAS_BULLETPROOF_GLASS | Prevents glass from breaking. |  |
| 77 | FLAG_CANNOT_TAKE_COVER_WHEN_STOOD_ON | Prevents peds from taking cover on the vehicle. |  |
| 78 | FLAG_INTERIOR_BLOCKED_BY_BOOT | Interior blocked by boot. |  |
| 79 | FLAG_DONT_TIMESLICE_WHEELS | Prevents time slicing effect on wheels. |  |
| 80 | FLAG_FLEE_FROM_COMBAT | AI driver always flees from combat areas. |  |
| 81 | FLAG_DRIVER_SHOULD_BE_FEMALE | Vehicle only spawns driven by female peds. |  |
| 82 | FLAG_DRIVER_SHOULD_BE_MALE | Vehicle only spawns driven by male peds. |  |
| 83 | FLAG_COUNT_AS_FACEBOOK_DRIVEN | Used for tracking vehicles driven by the player with Facebook integration (now unused). |  |
| 84 | FLAG_BIKE_CLAMP_PICKUP_LEAN_RATE | Clamps bike pickup lean rate. |  |
| 85 | FLAG_PLANE_WEAR_ALTERNATIVE_HELMET | Forces plane to wear an alternative helmet. |  |
| 86 | FLAG_USE_STRICTER_EXIT_COLLISION_TESTS | Uses stricter exit collision tests. |  |
| 87 | FLAG_TWO_DOORS_ONE_SEAT | Two doors but only one seat configuration. |  |
| 88 | FLAG_USE_LIGHTING_INTERIOR_OVERRIDE | Keeps interior lights on regardless of engine status. |  |
| 89 | FLAG_USE_RESTRICTED_DRIVEBY_HEIGHT | Restricts aiming height for weapons inside the vehicle. |  |
| 90 | FLAG_CAN_HONK_WHEN_FLEEING | AI uses horn when fleeing. |  |
| 91 | FLAG_PEDS_INSIDE_CAN_BE_SET_ON_FIRE_MP | Peds inside can be set on fire (GTA Online). |  |
| 92 | FLAG_REPORT_CRIME_IF_STANDING_ON | Gives player a wanted level if standing on top of the vehicle. |  |
| 93 | FLAG_HELI_USES_FIXUPS_ON_OPEN_DOOR | Fix-ups when a helicopter door is open. |  |
| 94 | FLAG_FORCE_ENABLE_CHASSIS_COLLISION | Forces enabling chassis collision. |  |
| 95 | FLAG_CANNOT_BE_PICKUP_BY_CARGOBOB | Prevents vehicle from being picked up by Cargobob. |  |
| 96 | FLAG_CAN_HAVE_NEONS | Allows neon lights to be equipped. |  |
| 97 | FLAG_HAS_INTERIOR_EXTRAS | Vehicle can spawn with certain interior extras. |  |
| 98 | FLAG_HAS_TURRET_SEAT_ON_VEHICLE | Turret seat functionality. |  |
| 99 | FLAG_ALLOW_OBJECT_LOW_LOD_COLLISION | Allows low LOD collision for objects. |  |
| 100 | FLAG_DISABLE_AUTO_VAULT_ON_VEHICLE | Disables automatic vaulting on this vehicle. |  |
| 101 | FLAG_USE_TURRET_RELATIVE_AIM_CALCULATION | Relative aim calculation for turrets. |  |
| 102 | FLAG_USE_FULL_ANIMS_FOR_MP_WARP_ENTRY_POINTS | Uses full animations for entry points marked as MP warp in/out. |  |
| 103 | FLAG_HAS_DIRECTIONAL_SHUFFLES | Directional shuffles functionality. |  |
| 104 | FLAG_DISABLE_WEAPON_WHEEL_IN_FIRST_PERSON | Disables weapon wheel in first-person mode. |  |
| 105 | FLAG_USE_PILOT_HELMET | Forces player and AI to wear pilot helmets. |  |
| 106 | FLAG_USE_WEAPON_WHEEL_WITHOUT_HELMET | Allows weapon wheel without a helmet. |  |
| 107 | FLAG_PREFER_ENTER_TURRET_AFTER_DRIVER | Prefers turret entry if driver is present. |  |
| 108 | FLAG_USE_SMALLER_OPEN_DOOR_RATIO_TOLERANCE | Uses smaller tolerance for door opening ratio. |  |
| 109 | FLAG_USE_HEADING_ONLY_IN_TURRET_MATRIX | Uses heading only in turret matrix calculations. |  |
| 110 | FLAG_DONT_STOP_WHEN_GOING_TO_CLIMB_UP_POINT | Prevents stopping when climbing up to a point. |  |
| 111 | FLAG_HAS_REAR_MOUNTED_TURRET | Rear-mounted turret. |  |
| 112 | FLAG_DISABLE_BUSTING | Player won't be busted while inside the vehicle. |  |
| 113 | FLAG_IGNORE_RWINDOW_COLLISION | Ignores collision through the rear window. |  |
| 114 | FLAG_HAS_GULL_WING_DOORS | Doors open upwards like gull-wing doors. |  |
| 115 | FLAG_CARGOBOB_HOOK_UP_CHASSIS | Uses chassis for Cargobob hook attachment. |  |
| 116 | FLAG_USE_FIVE_ANIM_THROW_FP | Uses wider throw animations in first-person. |  |
| 117 | FLAG_ALLOW_HATS_NO_ROOF | Allows hats to be worn in vehicles without roofs. |  |
| 118 | FLAG_HAS_REAR_SEAT_ACTIVITIES | Adds rear seat activities, used in GTA Online. |  |
| 119 | FLAG_HAS_LOWRIDER_HYDRAULICS | Vehicle has lowrider hydraulics. |  |
| 120 | FLAG_HAS_BULLET_RESISTANT_GLASS | Vehicle's glass is resistant to bullets. |  |
| 121 | FLAG_HAS_INCREASED_RAMMING_FORCE | Vehicle can ram others more effectively. |  |
| 122 | FLAG_HAS_CAPPED_EXPLOSION_DAMAGE | Vehicle takes less damage from explosions. |  |
| 123 | FLAG_HAS_LOWRIDER_DONK_HYDRAULICS | Vehicle has lowrider donk hydraulics. |  |
| 124 | FLAG_HELICOPTER_WITH_LANDING_GEAR | Helicopter has a landing gear. |  |
| 125 | FLAG_JUMPING_CAR | Vehicle can jump, with force modifiable in handling files. |  |
| 126 | FLAG_HAS_ROCKET_BOOST | Vehicle can use a rocket boost. |  |
| 127 | FLAG_RAMMING_SCOOP | Vehicle has a scoop to push vehicles away. |  |
| 128 | FLAG_HAS_PARACHUTE | Vehicle is equipped with a parachute. |  |
| 129 | FLAG_RAMP | Vehicle can eject other vehicles by driving under them. |  |
| 130 | FLAG_HAS_EXTRA_SHUFFLE_SEAT_ON_VEHICLE | Extra shuffle seats functionality. |  |
| 131 | FLAG_FRONT_BOOT | Allows front "boot" to detach at high speeds. |  |
| 132 | FLAG_HALF_TRACK | Half-track classification. |  |
| 133 | FLAG_RESET_TURRET_SEAT_HEADING | Resets turret seat heading when not in use. | b1011 |
| 134 | FLAG_TURRET_MODS_ON_ROOF | Turret mods on roof functionality. | b1103 |
| 135 | FLAG_UPDATE_WEAPON_BATTERY_BONES | Updates weapon battery bones. | b1103 |
| 136 | FLAG_DONT_HOLD_LOW_GEARS_WHEN_ENGINE_UNDER_LOAD | Prevents holding low gears when engine is under load. | b1103 |
| 137 | FLAG_HAS_GLIDER | Identifies vehicle as a glider. | b1103 |
| 138 | FLAG_INCREASE_LOW_SPEED_TORQUE | Increases torque at low speeds. | b1103 |
| 139 | FLAG_USE_AIRCRAFT_STYLE_WEAPON_TARGETING | Uses aircraft style for weapon targeting. | b1103 |
| 140 | FLAG_KEEP_ALL_TURRETS_SYNCHRONISED | Synchronizes all turrets. | b1103 |
| 141 | FLAG_SET_WANTED_FOR_ATTACHED_VEH | Sets wanted level for attached vehicle. | b1103 |
| 142 | FLAG_TURRET_ENTRY_ATTACH_TO_DRIVER_SEAT | Attaches turret entry to driver seat. | b1180 |
| 143 | FLAG_USE_STANDARD_FLIGHT_HELMET | Uses standard flight helmet. | b1180 |
| 144 | FLAG_SECOND_TURRET_MOD | Second turret modification. | b1180 |
| 145 | FLAG_THIRD_TURRET_MOD | Third turret modification. | b1180 |
| 146 | FLAG_HAS_EJECTOR_SEATS | Ejects ped from aircraft if bailing mid-air. | b1180 |
| 147 | FLAG_TURRET_MODS_ON_CHASSIS | Turret mods on chassis. | b1180 |
| 148 | FLAG_HAS_JATO_BOOST_MOD | Adds JATO boost mod to aircraft. | b1180 |
| 149 | FLAG_IGNORE_TRAPPED_HULL_CHECK | Prevents check if player is trapped in vehicle geometry. | b1180 |
| 150 | FLAG_HOLD_TO_SHUFFLE | Player shuffles seats when holding context button. | b1180 |
| 151 | FLAG_TURRET_MOD_WITH_NO_STOCK_TURRET | Modifies turret without stock turret. | b1180 |
| 152 | FLAG_EQUIP_UNARMED_ON_ENTER | Player equips "Unarmed" weapon on entry. | b1180 |
| 153 | FLAG_DISABLE_CAMERA_PUSH_BEYOND | Disables camera push beyond vehicle. | b1180 |
| 154 | FLAG_HAS_VERTICAL_FLIGHT_MODE | Vehicle has VTOL-like vertical takeoff and flight ability. | b1290 |
| 155 | FLAG_HAS_OUTRIGGER_LEGS | Vehicle has deployable legs, unable to drive while extended. | b1290 |
| 156 | FLAG_CAN_NAVIGATE_TO_ON_VEHICLE_ENTRY | Navigation settings for on-vehicle entry. | b1290 |
| 157 | FLAG_DROP_SUSPENSION_WHEN_STOPPED | Vehicle's suspension drops when stopped. | b1290 |
| 158 | FLAG_DONT_CRASH_ABANDONED_NEAR_GROUND | Prevents crash when abandoned near ground. | b1290 |
| 159 | FLAG_USE_INTERIOR_RED_LIGHT | Vehicle's interior light is red. | b1290 |
| 160 | FLAG_HAS_HELI_STRAFE_MODE | Helicopter can strafe like a helicopter. | b1290 |
| 161 | FLAG_HAS_VERTICAL_ROCKET_BOOST | Rocket propels vehicle upwards. | b1290 |
| 162 | FLAG_CREATE_WEAPON_MANAGER_ON_SPAWN | Creates weapon manager on spawn. | b1290 |
| 163 | FLAG_USE_ROOT_AS_BASE_LOCKON_POS | Uses vehicle root for lock-on positioning. | b1290 |
| 164 | FLAG_HEADLIGHTS_ON_TAP_ONLY | Headlights toggle on tap only. | b1290 |
| 165 | FLAG_CHECK_WARP_TASK_FLAG_DURING_ENTER | Checks warp task flag during entry. | b1290 |
| 166 | FLAG_USE_RESTRICTED_DRIVEBY_HEIGHT_HIGH | Restricts aim height inside vehicle more than the default. | b1290 |
| 167 | FLAG_INCREASE_CAMBER_WITH_SUSPENSION_MOD | Increases camber when suspension mods are equipped. | b1365 |
| 168 | FLAG_NO_HEAVY_BRAKE_ANIMATION | Prevents "lean forward" animation when braking heavily. | b1365 |
| 169 | FLAG_HAS_TWO_BONNET_BONES | Uses two bonnet bones simultaneously. | b1493 |
| 170 | FLAG_DONT_LINK_BOOT2 | Does nothing. | b1493 |
| 171 | FLAG_HAS_INCREASED_RAMMING_FORCE_WITH_CHASSIS_MOD | Chassis mod increases ramming force. | b1493 |
| 172 | FLAG_HAS_INCREASED_RAMMING_FORCE_VS_ALL_VEHICLES | Ramming force increased against all vehicles. | b1604 |
| 173 | FLAG_HAS_EXTENDED_COLLISION_MODS | Extended collision mods functionality. | b1604 |
| 174 | FLAG_HAS_NITROUS_MOD | Enables nitro boost modifications. | b1604 |
| 175 | FLAG_HAS_JUMP_MOD | Enables jump boost modification. | b1604 |
| 176 | FLAG_HAS_RAMMING_SCOOP_MOD | Vehicle has ramming scoop modification. | b1604 |
| 177 | FLAG_HAS_SUPER_BRAKES_MOD | Vehicle has super brakes modification. | b1604 |
| 178 | FLAG_CRUSHES_OTHER_VEHICLES | Vehicle does more damage to vehicles it drives over. | b1604 |
| 179 | FLAG_HAS_WEAPON_BLADE_MODS | Vehicle equipped with sawblade modifications. | b1604 |
| 180 | FLAG_HAS_WEAPON_SPIKE_MODS | Equipped with spike modifications that harm on contact. | b1604 |
| 181 | FLAG_FORCE_BONNET_CAMERA_INSTEAD_OF_POV | Forces bonnet camera over POV. | b1604 |
| 182 | FLAG_RAMP_MOD | Equipped with ramp modification. | b1604 |
| 183 | FLAG_HAS_TOMBSTONE | Heavy part that can be ejected to stop pursuing vehicles. | b1604 |
| 184 | FLAG_HAS_SIDE_SHUNT | Can shunt vehicles sideways. | b1604 |
| 185 | FLAG_HAS_FRONT_SPIKE_MOD | Equipped with front spike modification. | b1604 |
| 186 | FLAG_HAS_RAMMING_BAR_MOD | Equipped with ramming bar modification. | b1604 |
| 187 | FLAG_TURRET_MODS_ON_CHASSIS5 | Enables turret mods on VMT_CHASSIS5 category. | b1604 |
| 188 | FLAG_HAS_SUPERCHARGER | Permanently enables vacuum and blower/boost dials. | b1604 |
| 189 | FLAG_IS_TANK_WITH_FLAME_DAMAGE | Similar to FLAG_IS_TANK but not fireproof. | b1604 |
| 190 | FLAG_DISABLE_DEFORMATION | Disables visual deformation. | b1604 |
| 191 | FLAG_ALLOW_RAPPEL_AI_ONLY | Allows AI-only rappelling. | b1734 |
| 192 | FLAG_USE_RESTRICTED_DRIVEBY_HEIGHT_MID_ONLY | Restricts drive-by height in mid-only. | b1734 |
| 193 | FLAG_FORCE_AUTO_VAULT_ON_VEHICLE_WHEN_STUCK | Forces auto-vault when stuck. | b1734 |
| 194 | FLAG_SPOILER_MOD_DOESNT_INCREASE_GRIP | Spoiler mods do not add traction. | b1868 |
| 195 | FLAG_NO_REVERSING_ANIMATION | Disables "look back" animation when reversing. | b1868 |
| 196 | FLAG_IS_QUADBIKE_USING_BIKE_ANIMATIONS | Allows quadbikes to use bike layouts and animations. | b1868 |
| 197 | FLAG_IS_FORMULA_VEHICLE | Changes tire mark texture to slick tires. | b2060 |
| 198 | FLAG_LATCH_ALL_JOINTS | Latches all joints upon creation. | b2189 |
| 199 | FLAG_REJECT_ENTRY_TO_VEHICLE_WHEN_STOOD_ON | If the player is standing on top of the vehicle, the player character will not attempt to pathfind to the nearest vehicle door to enter and will not warp inside the vehicle. | b2189 |
| 200 | FLAG_CHECK_IF_DRIVER_SEAT_IS_CLOSER_THAN_TURRETS_WITH_ON_BOARD_ENTER | Checks whether the player character is closer to the driver's seat than the turret seat before deciding on which one to pathfind to. Added in. | b2189 |
| 201 | FLAG_RENDER_WHEELS_WITH_ZERO_COMPRESSION | Prevents the wheels and suspension from visually moving. | b2189 |
| 202 | FLAG_USE_LENGTH_OF_VEHICLE_BOUNDS_FOR_PLAYER_LOCKON_POS | Uses vehicle bounds for player lock-on. | b2189 |
| 203 | FLAG_PREFER_FRONT_SEAT | Prefers front seat over rear. | b2372 |