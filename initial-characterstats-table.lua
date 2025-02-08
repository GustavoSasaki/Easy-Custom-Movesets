initialCharacterStatsTable = {{
    -- bigger and faster long jump
    name = "Hatsune Miku",
    long_jump_max_velocity = 150,
    long_jump_velocity_multiplier = 200,
    long_jump_strength = 125
}, {
    -- float character
    name = "Sackboy",
    gravity = 95
}, {
    -- heavy character with better back/side flip
    name = "Peter Griffin",
    gravity = 115,
    back_flip_strength = 120,
    side_flip_strength = 120
}, {
    -- float character with big long jump
    name = "Osaka",
    gravity = 85,
    long_jump_strength = 105,
    mr_l_jump_on = true
}, {
    -- character with fast long jump
    name = "Tomo",
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 170
}, {
    -- character with a faster and upward trajectory dive
    name = "Kagura",
    dive_y_vel = 15,
    dive_velocity = 120,
    dive_max_velocity = 120
}, {
    -- character with big kick
    name = "Chiyo",
    gravity = 140,
    kick_jump_strength = 250,
    triple_jump_strength = 130,
    swimming_speed = 95
}, {
    -- character with bigger jumps and low airborn deceleration
    name = "Sakaki",
    swimming_speed = 250,
    jump_strength = 115,
    airborne_deceleration_speed = 50
}, {
    -- weird character with bad normal jump, but good back/side/long jumps
    name = "Kaori",
    single_jump_strength = 80,
    double_jump_strength = 80,
    triple_jump_strength = 80,
    back_flip_strength = 130,
    side_flip_strength = 130,
    long_jump_strength = 130
}, {
    -- character with increase fall gravity, explode on death
    name = "Yomi",
    fall_gravity = 120,
    explode_on_death = true,
    jump_strength = 103
}, {
    -- float and fast character
    name = "Cream the Rabbit",
    gravity = 90,
    walking_speed = 120,
    in_air_speed = 120,
    grounded_slowing_speed = 110
}, {
    -- fast character with bigger single/double/triple jump
    name = "Silver the Hedgehog",
    walking_speed = 115,
    hold_walking_speed = 90,
    in_air_speed = 115,
    single_jump_strength = 105,
    double_jump_strength = 110,
    triple_jump_strength = 115
}, {
    -- character with faster walking speed and jump height
    name = "Pepsiman",
    walking_speed = 130,
    jump_strength = 110
}, {
    -- gonna go fast ( fast character with fast long )
    name = "Classic Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95
}, {
    -- gonna go fast ( fast character with fast long )
    name = "Modern Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95
}, {
    name = "Shadow the Hedgehog",
    walking_speed = 160,
    in_air_speed = 125,
    grounded_slowing_speed = 300,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    jump_strength = 95,
    explode_on_death = true
}, {
    -- character with fast air speed
    name = "Classic Tails",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    fall_gravity = 80
}, {
    -- character with fast air speed
    name = "Modern Tails",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    fall_gravity = 80
}, {
    -- character with fast air speed and higher back/side flip
    name = "Classic Knuckles",
    walking_speed = 115,
    in_air_speed = 130,
    gravity = 95,
    fall_gravity = 105,
    back_flip_strength = 115,
    side_flip_strength = 115
}, {
    -- character with fast air speed and higher back/side flip
    name = "Modern Knuckles",
    walking_speed = 115,
    in_air_speed = 130,
    gravity = 95,
    fall_gravity = 105,
    back_flip_strength = 115,
    side_flip_strength = 115
}, {
    -- heavy and fast character with big kick and small jumps
    name = "Classic Eggman",
    walking_speed = 161,
    jump_strength = 95,
    gravity = 117,
    kick_jump_strength = 180
}, {
    -- heavy and fast character with big kick and small jumps
    name = "Modern Eggman",
    walking_speed = 161,
    jump_strength = 95,
    gravity = 117,
    kick_jump_strength = 180
}, {
    name = "Classic Super Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95
}, {
    name = "Modern Super Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95
}, {
    -- character with mr l jump 
    name = "Mr.L",
    mr_l_jump_on = true,
    jump_strength = 103,
    grounded_slowing_speed = 150
}, {
    -- character with fast crawling and do twirling after back flip
    name = 'Baby Mario',
    single_jump_strength = 90,
    crawling_speed = 500,
    back_flip_twirling_on = true,
    back_flip_strength = 107,
    hold_walking_speed = 85

}, {
    -- character with mr l jump that has great horizontal maneuverability
    name = 'Neco-Arc',
    mr_l_jump_on = true,
    mr_l_air_speed = 140,
    mr_l_gravity = 135,
    mr_l_jump_strength = 85
}, {
    name = 'Neco-Arc Colors',
    mr_l_jump_on = true,
    mr_l_air_speed = 140,
    mr_l_gravity = 135,
    mr_l_jump_strength = 85
}, {
    -- character that can do twirling after back flip and ground pound while twirling
    name = 'Yui',
    back_flip_twirling_on = true,
    twirling_ground_pound_on = true,
    back_flip_strength = 120,
    fall_gravity = 95,
    gravity = 97
}, {
    -- character with bad jumps, but do twiling on triple jump and can do dive upward trajectory on twiling.
    name = "Tumble",
    triple_jump_twirling_on = true,
    twirling_dive_on = true,
    dive_y_vel = 40,
    single_jump_strength = 85,
    double_jump_strength = 85

}, {
    -- character that do twirling after back flip/triple jump and has increase twirling gravity
    name = "Megumin",
    explode_on_death = true,
    triple_jump_twirling_on = true,
    triple_jump_strength = 105,
    back_flip_twirling_on = true,
    twirling_gravity = 120,
    hold_walking_speed = 90
}, {
    name = "Megumin (Recolor)",
    explode_on_death = true,
    triple_jump_twirling_on = true,
    triple_jump_strength = 105,
    back_flip_twirling_on = true,
    twirling_gravity = 120,
    hold_walking_speed = 90
}, {
    -- float and fast character that do twirling after triple jump
    -- also, can do ground pound on twirling
    -- have bad back flip/side flip
    name = 'Toon Link',
    fall_gravity = 90,
    hold_walking_speed = 90,
    triple_jump_twirling_on = true,
    twirling_ground_pound_on = true,
    walking_speed = 140,
    back_flip_strength = 85,
    side_flip_strength = 85
}, {
    name = "Junio Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    mr_l_jump_on = true,
    play_mr_l_anticipation_audio = false
}, {
    -- character that do twirling when starting triple jump/side flip, can do dive when twirling. Also, horrible long jump
    name = "MyMelodyHD",
    triple_jump_twirling_on = true,
    triple_jump_twirling_when = "start",
    side_flip_twirling_on = true,
    twirling_dive_on = true,
    long_jump_strength = 50
}, {
    -- character that do twirling when side flip. It twirling has increase gravity and horizontal speed 
    name = 'Luma',
    side_flip_twirling_on = true,
    fast_twirling_on = true,
    twirling_gravity = 130,
    twirling_speed = 250,
    back_flip_strength = 85
}, {
    -- character that do twirling when triple jump. It twirling low gravity, you can descending quickly with fast twirling ( press Z button)
    name = 'Komodo Joe',
    triple_jump_twirling_on = true,
    triple_jump_twirling_when = "start",
    fast_twirling_on = true,
    twirling_gravity = 90,
    fast_twirling_gravity = 110
}, {
    -- character with bad gas immunity, It has stronger long jump
    name = 'Dry Bones',
    gravity = 90,
    bad_gas_damage_multiplier = 0,
    long_jump_velocity_multiplier = 150,
    long_jump_max_velocity = 130

}, {
    -- character witch can stand in water long, swim faster
    name = 'Alpharad',
    water_damage_multiplier = 25,
    swimming_speed = 300,
    single_jump_strength = 90,
    triple_jump_strength = 110
}, {
    -- character witch can stand in water long, swim faster
    name = 'Fyrus',
    water_damage_multiplier = 25,
    swimming_speed = 300,
    back_flip_strength = 110,
    side_flip_strength = 110
}, {
    -- character witch can stand in water long, swim faster
    name = 'Giwi',
    water_damage_multiplier = 25,
    swimming_speed = 300,
    gravity = 90,
    fall_gravity = 110,
    long_jump_max_velocity = 130,
    long_jump_velocity_multiplier = 150
}, {
    -- character witch can stand in water long, swim faster
    name = 'Jaiden',
    water_damage_multiplier = 25,
    swimming_speed = 300,
    mr_l_jump_on = true,
    mr_l_air_speed = 120,
    back_flip_strength = 80
}, {
    -- character that dont take water damage, but cant heal breathing
    name = 'Kidd',
    water_damage_multiplier = 0,
    swimming_speed = 350,
    disable_breath_heal = true,
    single_jump_strength = 90,
    burning_damage_multiplier = 50,
    lava_damage_multiplier = 50
}, {
    -- character witch can stand in water long, swim faster
    name = 'Smith',
    water_damage_multiplier = 50,
    swimming_speed = 250,
    triple_jump_twirling_on = true,
    triple_jump_twirling_when = "start",
    twirling_speed = 90
}, {
    -- character witch can stand in water long, swim faster
    name = 'VOID',
    water_damage_multiplier = 50,
    swimming_speed = 250,
    dive_y_vel = 35,
    dive_velocity = 100,
    dive_max_velocity = 110
}, {
    -- character witch can stand in water long, swim faster
    name = 'Vulpixie',
    water_damage_multiplier = 50,
    swimming_speed = 250,
    fall_gravity = 95,
    back_flip_twirling_on = true,
    back_flip_strength = 103
}, {
    -- character witch can swin faster, but cant stand in water for too long  
    name = 'Weegee',
    water_damage_multiplier = 200,
    swimming_speed = 400,
    walking_speed = 120,
    triple_jump_strength = 87
}, {
    -- character witch can stand in water/snow water long, swim faster
    name = 'King Penguin',
    water_damage_multiplier = 0,
    snow_water_damage_multiplier = 0,
    swimming_speed = 300,
    kick_jump_strength = 200,
    hold_walking_speed = 200,
    gravity = 120,
    in_air_speed = 150,
    walking_speed = 150,
    burning_damage_multiplier = 50
}, {
    -- speedy character with weakness to burning
    name = 'Geno',
    burning_damage_multiplier = 170,
    bad_gas_damage_multiplier = 130,
    hold_walking_speed = 85,
    walking_speed = 135,
    in_air_speed = 135,
    back_flip_strength = 110,
    lava_damage_multiplier = 170
}, {
    -- float character with stronger long jump
    name = 'Mallow',
    gravity = 95,
    fall_gravity = 85,
    long_jump_strength = 125,
    kick_jump_strength = 75
}, {
    -- no burning damage
    name = 'Thomas the Tank Engine',
    disable_burning = true,
    bad_gas_damage_multiplier = 0,
    lava_damage_multiplier = 0,
    ground_pound_max_y_vel = 130
}, {
    name = 'Squidward',
    water_damage_multiplier = 0,
    swimming_speed = 300,
    burning_damage_multiplier = 50,
    lava_damage_multiplier = 50,
    double_jump_strength = 110
}, {
    -- inume to damage character, also he is fast and slippery 
    name = 'Nabbit',
    disable_damage = true,
    water_damage_multiplier = 0,
    snow_water_damage_multiplier = 0,
    bad_gas_damage_multiplie = 0,
    disable_burning = true,
    walking_speed = 120,
    in_air_speed = 120,
    grounded_slowing_speed = 150

}, {
    name = 'VL & CJes',
    jump_strength = 106,
    grounded_slowing_speed = 150,
    back_flip_twirling_on = true,
    twirling_ground_pound_on = true
},
{
    -- foat character that can dive on ground pound
    name = 'Marvin the martian',
    ground_pound_dive_on =  true,
    ground_pound_dive_y_vel = 40,
    gravity = 90,
    fall_gravity = 75,
    water_damage_multiplier = 125

}, {
    -- chracter with fast ground pound animation and can dive during ground pound
    name = 'Lego Mario',
    ground_pound_antecipation_speed_up = 'immediately',
    ground_pound_dive_on =  true,
    ground_pound_dive_y_vel = 10,
    hold_walking_speed = 85,
},
{
    -- chracter with fast ground pound and immunity to burn
    name = 'Marty the Thwomp',
    ground_pound_antecipation_speed_up = 'small',
    ground_pound_max_y_vel = 200,
    ground_pound_gravity = 500,
    disable_burning = true,
    side_flip_strength = 90,
    back_flip_strength = 90
}}
