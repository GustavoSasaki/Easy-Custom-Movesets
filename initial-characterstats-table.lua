initialCharacterStatsTable = {{
    -- bigger and faster long jump
    name = "Hatsune Miku",
    long_jump_max_velocity = 150,
    long_jump_velocity_multiplier = 200,
    long_jump_strength = 125,
    moveset_description = "big/fast long jump"
}, {
    -- float character
    name = "Sackboy",
    gravity = 95,
    ground_pound_dive_on = true,
    knockback_resistance = -10,
    goomba_damage_multiplier = 0,
    moveset_description = "less gravity"
}, {
    -- heavy character with better back/side flip
    name = "Peter Griffin",
    gravity = 115,
    back_flip_strength = 120,
    side_flip_strength = 120,
    knockback_resistance = 60,
    goomba_damage_multiplier = 0,
    moveset_description = "beeter side/back flip"
}, {
    -- float character with big long jump
    name = "Osaka",
    gravity = 85,
    long_jump_strength = 105,
    mr_l_jump_on = true,
    knockback_resistance = -5,
    moveset_description = "less gravity,mr.L jump"
}, {
    -- character with fast long jump
    name = "Tomo",
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 170,
    moveset_description = "better long jump"
}, {
    -- character with a faster and upward trajectory dive
    name = "Kagura",
    dive_y_vel = 15,
    dive_velocity = 120,
    dive_max_velocity = 120,
    moveset_description = "better dive"
}, {
    -- character with big kick
    name = "Chiyo",
    gravity = 140,
    kick_jump_strength = 250,
    triple_jump_strength = 130,
    swimming_speed = 95,
    water_damage_multiplier = 150,
    moveset_description = "high gravity, excelent kick/triple jump"
}, {
    -- character with bigger jumps and low airborn deceleration
    name = "Sakaki",
    swimming_speed = 250,
    jump_strength = 115,
    airborne_deceleration_speed = 50,
    wall_slide_on = true,

    moveset_description = "better all around jumps"
}, {
    -- weird character with bad normal jump, but good back/side/long jumps
    name = "Kaori",
    single_jump_strength = 80,
    double_jump_strength = 80,
    triple_jump_strength = 80,
    back_flip_strength = 130,
    side_flip_strength = 130,
    long_jump_strength = 130,
    moveset_description = "worst normal jumps, better special jumps"
}, {
    -- character with increase fall gravity, explode on death
    name = "Yomi",
    fall_gravity = 120,
    explode_on_death = true,
    jump_strength = 103,
    kick_dive_on = true
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
    jump_strength = 110,
    kick_dive_on = true,
    peel_out_on = true,
    peel_out_slowdown = 0.35,
    moveset_description = "faster, strong jumps, pell out"
}, {
    -- gonna go fast ( fast character with fast long )
    name = "Classic Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    -- gonna go fast ( fast character with fast long )
    name = "Modern Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    name = "Shadow the Hedgehog",
    walking_speed = 160,
    in_air_speed = 125,
    grounded_slowing_speed = 300,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    jump_strength = 95,
    explode_on_death = true,
    kill_toad = true,
    kill_pink_bomb_on = true
}, {
    -- character with fast air speed
    name = "Classic Tails",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    fall_gravity = 80,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    -- character with fast air speed
    name = "Modern Tails",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    fall_gravity = 80,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    -- character with fast air speed and higher back/side flip
    name = "Classic Knuckles",
    walking_speed = 115,
    in_air_speed = 130,
    gravity = 95,
    fall_gravity = 105,
    back_flip_strength = 115,
    side_flip_strength = 115,
    glide_dive_on = true,
    glide_dive_y_vel = -7,
    glide_dive_forward_vel = 60,
    glide_dive_max_time = 45,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    -- character with fast air speed and higher back/side flip
    name = "Modern Knuckles",
    walking_speed = 115,
    in_air_speed = 130,
    gravity = 95,
    fall_gravity = 105,
    back_flip_strength = 115,
    side_flip_strength = 115,
    glide_dive_on = true,
    glide_dive_y_vel = -7,
    glide_dive_forward_vel = 60,
    glide_dive_max_time = 5,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    -- heavy and fast character with big kick and small jumps
    name = "Classic Eggman",
    walking_speed = 161,
    jump_strength = 95,
    gravity = 117,
    kick_jump_strength = 180,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    -- heavy and fast character with big kick and small jumps
    name = "Modern Eggman",
    walking_speed = 161,
    jump_strength = 95,
    gravity = 117,
    kick_jump_strength = 180,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    name = "Classic Super Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    name = "Modern Super Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
}, {
    -- character with mr l jump 
    name = "Mr.L",
    mr_l_jump_on = true,
    jump_strength = 103,
    grounded_slowing_speed = 150,
    kill_toad = true,
    kill_pink_bomb_on = true,
    goomba_damage_multiplier = 200
}, {
    -- character with fast crawling and do twirling after back flip
    name = 'Baby Mario',
    single_jump_strength = 90,
    crawling_speed = 500,
    back_flip_twirling_on = true,
    back_flip_strength = 107,
    hold_walking_speed = 85,
    knockback_resistance = -5,
    disable_fall_damage = true

}, {
    -- character with mr l jump that has great horizontal maneuverability
    name = 'Neco-Arc',
    mr_l_jump_on = true,
    mr_l_air_speed = 140,
    mr_l_gravity = 135,
    mr_l_jump_strength = 85,
    wall_slide_on = true
}, {
    name = 'Neco-Arc Colors',
    mr_l_jump_on = true,
    mr_l_air_speed = 140,
    mr_l_gravity = 135,
    mr_l_jump_strength = 85,
    wall_slide_on = true
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
    side_flip_strength = 85,
    goomba_damage_multiplier = 50
}, {
    name = "Junio Sonic",
    walking_speed = 252,
    in_air_speed = 222,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 130,
    airborne_deceleration_speed = 50,
    jump_strength = 95,
    mr_l_jump_on = true,
    play_mr_l_anticipation_audio = false,
    peel_out_jump_on = true,
    peel_out_jump_reset_vel = false
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
    back_flip_strength = 85,
    goomba_damage_multiplier = 200
}, {
    -- character that do twirling when triple jump. It twirling low gravity, you can descending quickly with fast twirling ( press Z button)
    name = 'Komodo Joe',
    triple_jump_twirling_on = true,
    triple_jump_twirling_when = "start",
    fast_twirling_on = true,
    twirling_gravity = 90,
    fast_twirling_gravity = 110,
    kill_toad = true,
    kill_pink_bomb_on = true
}, {
    -- character with bad gas immunity, It has stronger long jump
    name = 'Dry Bones',
    gravity = 90,
    bad_gas_damage_multiplier = 0,
    long_jump_velocity_multiplier = 150,
    long_jump_max_velocity = 130,
    knockback_resistance = -5

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
    lava_damage_multiplier = 50,
    water_enemy_damage_multiplier = 50,
    piranha_plant_damage_multiplier = 1000
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
    dive_max_velocity = 110,
    wall_slide_on = true,
    wall_slide_jump_strength = 60,
    wall_slide_jump_type = ACT_JUMP
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
    triple_jump_strength = 87,
    kick_dive_on = true,
    goomba_damage_multiplier = 1000
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
    burning_damage_multiplier = 50,
    knockback_resistance = 30
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
    kick_jump_strength = 75,
    flying_enemy_damage_multiplier = 50
}, {
    -- no burning damage
    name = 'Thomas the Tank Engine',
    disable_burning = true,
    bad_gas_damage_multiplier = 0,
    lava_damage_multiplier = 0,
    ground_pound_max_y_vel = 130,
    ground_pound_shake = 150,
    knockback_resistance = 60,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = -1,
    peel_out_on = true,
    peel_out_slowdown = 0.65,
    peel_out_jump_reset_vel = false,
    disable_fall_damage = true,
    moveset_description = "peel out, bunch of damage resistance"
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
}, {
    -- foat character that can dive on ground pound
    name = 'Marvin the martian',
    ground_pound_dive_on = true,
    ground_pound_dive_y_vel = 40,
    gravity = 90,
    fall_gravity = 75,
    water_damage_multiplier = 125

}, {
    -- chracter with fast ground pound animation and can dive during ground pound
    name = 'Lego Mario',
    ground_pound_antecipation_speed_up = 'immediately',
    ground_pound_dive_on = true,
    ground_pound_dive_y_vel = 10,
    hold_walking_speed = 85,
    knockback_resistance = 35,
    flying_enemy_damage_multiplier = 50
}, {
    -- chracter with fast ground pound and immunity to burn
    name = 'Marty the Thwomp',
    ground_pound_antecipation_speed_up = 'small',
    ground_pound_max_y_vel = 200,
    ground_pound_gravity = 500,
    disable_burning = true,
    side_flip_strength = 90,
    back_flip_strength = 90,
    ground_pound_shake = 150,
    flying_enemy_damage_multiplier = 50,
    kill_toad = true
}, {
    -- character that can do fart after ground pound
    name = 'Turkey Wario',
    waft_fart_on = true,
    burning_damage_multiplier = 125,
    waft_fart_per_level = 3,
    gravity = 105,
    fall_gravity = 110,
    kill_toad = true,
    goomba_damage_multiplier = 50
}, {
    name = 'Slippy Toad',
    gravity = 90,
    fall_gravity = 85,
    ground_pound_dive_on = true,
    ground_pound_dive_y_vel = 10,
    waft_fart_on = true,
    water_damage_multiplier = 25,
    swimming_speed = 250,
    triple_jump_strength = 90
}, {
    -- character that can do ground pound jump
    name = 'Croc',
    ground_pound_antecipation_speed_up = 'small',
    ground_pound_jump_on = true,
    ground_pound_strength = 80,
    water_damage_multiplier = 50,
    swimming_speed = 200
}, {
    -- character that can do ground pound jump and ground pound dive
    name = 'Fae',
    ground_pound_antecipation_speed_up = 'medium',
    ground_pound_jump_on = true,
    ground_pound_jump_forward_vel = 20,
    ground_pound_dive_on = true,
    ground_pound_jump_dive_on = true,
    lava_damage_multiplier = 125
}, {
    name = 'Mips',
    ground_pound_antecipation_speed_up = 'immediately',
    ground_pound_jump_on = true,
    ground_pound_jump_forward_vel = 40,
    mr_l_jump_on = true,
    walking_speed = 133,
    water_damage_multiplier = 175,
    disable_breath_heal = true,
    single_jump_strength = 80,
    double_jump_strength = 80,
    triple_jump_strength = 80
}, {
    name = 'Mips Colors',
    ground_pound_antecipation_speed_up = 'immediately',
    ground_pound_jump_on = true,
    ground_pound_jump_forward_vel = 40,
    mr_l_jump_on = true,
    walking_speed = 133,
    water_damage_multiplier = 175,
    disable_breath_heal = true,
    single_jump_strength = 80,
    double_jump_strength = 80,
    triple_jump_strength = 80
}, {
    -- character that can do fart after ground pound. this fart getts lots of horizontal speed, but not heigth
    name = 'Talking Red',
    waft_fart_on = true,
    waft_fart_per_level = 15,
    waft_fart_velocity = 150,
    waft_fart_strength = 70
}, {
    -- character with saultube custom animation + speedy + ground pound jump
    name = 'Saul',
    ground_pound_dive_on = true,
    saultube_jump_animation = true,
    gravity = 120,
    in_air_speed = 140,
    walking_speed = 140,
    burning_damage_multiplier = 150,
    bat_damage_multiplier = 200,
    knockback_resistance = -150,
    ground_pound_jump_on = true,
    ground_pound_antecipation_speed_up = 'medium',
    wall_slide_on = true,
    wall_slide_jump_strength = 60,
    wall_slide_jump_type = ACT_JUMP
}, {
    name = 'Saul PFP',
    walking_speed = 120,
    ground_pound_dive_on = true,
    saultube_jump_animation = true,
    single_jump_strength = 95
}, {
    -- character with big triple jump with saultube custom animation
    -- also bad single and double jump
    name = 'BlazingMo',
    single_jump_strength = 80,
    double_jump_strength = 90,
    triple_jump_strength = 120,
    back_flip_strength = 115,
    saultube_triple_jump_animation = true
}, {
    -- character with triple jump after long jump + can dive after ground pound
    name = 'Octi',
    long_jump_triple_jump_on = true,
    ground_pound_dive_on = true,
    water_damage_multiplier = 25,
    swimming_speed = 200
}, {
    -- speedy and heavy character that can do ground pound jump and long jump triple jump
    name = 'Brobgonal The Second',
    walking_speed = 135,
    in_air_speed = 135,
    gravity = 110,
    ground_pound_antecipation_speed_up = 'small',
    ground_pound_jump_on = true,
    long_jump_triple_jump_on = true,
    ground_pound_jump_strength = 80
}, {
    -- character with fast but small long jump triple jump
    name = 'Phanuby',
    saultube_double_jump_animation = true,
    long_jump_triple_jump_on = true,
    long_jump_triple_jump_add_forward_vel = 50,
    long_jump_triple_jump_strength = 80,
    hold_walking_speed = 90,
    burning_damage_multiplier = 125,
    snow_water_damage_multiplier = 0,
    goomba_damage_multiplier = 200
}, {
    -- character witch start twirling when triple jump
    name = 'Marten',
    saultube_single_jump_animation = true,
    disable_damage = true,
    triple_jump_twirling_on = true,
    triple_jump_twirling_when = "start",
    twirling_dive_on = true,
    in_air_speed = 120
}, {
    -- character with super side flip
    name = 'BizzareScape',
    explode_on_death = true,
    saultube_double_jump_animation = true,
    double_jump_strength = 115,
    triple_jump_strength = 105,
    super_side_flip_on = true,
    burning_damage_multiplier = 200,
    lava_damage_multiplier = 200
}, {
    -- character witch mr l jump and an long jump triple jump with constant foward velocity
    name = 'Sonks_132',
    saultube_single_jump_animation = true,
    saultube_triple_jump_animation = true,
    mr_l_jump_on = true,
    back_flip_strength = 105,
    play_mr_l_anticipation_audio = false,
    long_jump_triple_jump_on = true,
    long_jump_triple_jump_forward_vel = 55,
    long_jump_triple_jump_strength = 90
}, {
    -- speedy character with an small fast super side flip with great maneuverability
    name = 'Asterix the gaul',
    super_side_flip_on = true,
    super_side_flip_strength = 70,
    super_side_flip_kick_foward_vel = 30,
    super_side_flip_add_foward_vel = 30,
    walking_speed = 130,
    knockback_resistance = 35,
    flying_enemy_damage_multiplier = 50
}, {
    -- character with ground pound jump and he can also do super side flip with lower speed
    name = 'Patrick Starfish',
    super_side_flip_on = true,
    super_side_flip_convert_foward_vel = 140,
    super_side_flip_min_velocity = 20,
    super_side_flip_strength = 65,
    ground_pound_jump_on = true,
    ground_pound_jump_strength = 60,
    water_damage_multiplier = 0,
    swimming_speed = 95
}, {
    name = 'QP',
    gravity = 95,
    long_jump_triple_jump_on = true,
    long_jump_triple_jump_add_forward_vel = 30,
    long_jump_triple_jump_strength = 90,
    ground_pound_jump_on = true,
    ground_pound_jump_strength = 65,
    ground_pound_jump_forward_vel = 30
}, {
    -- character with wall slide and can dive on ground pound
    name = 'Penelope Pussycat',
    wall_slide_on = true,
    ground_pound_dive_on = true,
    water_damage_multiplier = 150,
    bad_gas_damage_multiplier = 200
}, {
    -- fast character with small jumps that stick in the wall
    name = 'Ninji',
    super_side_flip_on = true,
    wall_slide_on = true,
    wall_slide_max_gravity = 0,
    in_air_speed = 150,
    walking_speed = 150,
    jump_strength = 85,
    wall_slide_jump_strength = 60,
    knockback_resistance = -5,
    flying_enemy_damage_multiplier = 200
}, {
    -- character that do an dive when jumping from weall slide. Also is great swimmer
    name = 'Yae',
    wall_slide_on = true,
    wall_slide_max_gravity = 20,
    wall_slide_jump_type = ACT_DIVE,
    wall_slide_jump_forward_vel = 48,
    wall_slide_jump_strength = 60,
    water_damage_multiplier = 0,
    swimming_speed = 250,
    long_jump_triple_jump_on = true,
    long_jump_triple_jump_strength = 90
}, {
    -- character with wall slide and big kicks
    name = 'Goemon',
    wall_slide_on = true,
    wall_slide_gravity = 30,
    wall_slide_jump_type = ACT_JUMP,
    jump_strength = 105,
    walking_speed = 110,
    in_air_speed = 110,
    kick_jump_strength = 150
}, {
    -- character that can do wall slide jump with low forward speed. Also can do ground pound jump
    name = 'Ebisumaru',
    wall_slide_on = true,
    wall_slide_jump_type = ACT_JUMP,
    wall_slide_jump_forward_vel = 5,
    ground_pound_jump_on = true,
    ground_pound_jump_strength = 60,
    wall_slide_max_gravity = 80,
    wall_slide_jump_strength = 60,
    ground_pound_antecipation_speed_up = 'small',
    ground_pound_max_y_vel = 200,
    saultube_double_jump_animation = true,
    fall_gravity = 130
}, {
    -- character that goes up when wall slide, also start twirling when jumping from wall slide
    name = 'Gnarpy',
    wall_slide_on = true,
    wall_slide_gravity = -20,
    gravity = 90,
    triple_jump_twirling_on = true,
    wall_slide_jump_forward_vel = 30,
    wall_slide_jump_strength = 35,
    wall_slide_jump_type = ACT_TWIRLING,
    twirling_ground_pound_on = true,
    triple_jump_twirling_when = "start",
    disable_twirling_land = true,
    goomba_damage_multiplier = 200,
    disable_fall_damage = true
}, {
    -- character with double jump
    name = 'Donald Duck',
    in_air_jump = 1,
    in_air_jump_strength = 35,
    swimming_speed = 150,
    ground_pound_jump_on = true,
    back_flip_twirling_on = true
}, {
    -- character with small jumps that can do 3 jump on the air. Each jump is smaller, and does not slowdown
    name = 'Connie',
    in_air_jump = 3,
    in_air_jump_strength = {25, 20, 15},
    in_air_jump_animation = {CHAR_ANIM_DOUBLE_JUMP_RISE, CHAR_ANIM_DOUBLE_JUMP_RISE, CHAR_ANIM_TRIPLE_JUMP},
    jump_strength = 85,
    walking_speed = 120,
    in_air_speed = 115,
    burning_damage_multiplier = 150,
    lava_damage_multiplier = 150,
    in_air_jump_forward_vel_slowdown = 0,
    long_jump_triple_jump_on = true
}, {
    -- character that can do 2 small jump that increase horizontal velocity
    name = 'Yumpi',
    in_air_jump = 2,
    in_air_jump_strength = {10, 5},
    in_air_jump_animation = {CHAR_ANIM_FLY_FROM_CANNON, CHAR_ANIM_TRIPLE_JUMP},
    in_air_jump_sound = {CHAR_SOUND_HOOHOO, CHAR_SOUND_YAHOO},
    in_air_jump_forward_vel_slowdown = {-50, -75},
    walking_speed = 105,
    ground_pound_dive_on = true,
    ground_pound_dive_y_vel = 40,
    ground_pound_antecipation_speed_up = 'medium',
    dive_velocity = 200,
    dive_max_velocity = 200,
    back_flip_strength = 85,
    side_flip_strength = 85
}, {
    -- character that when pressing B always do an kick, and if press again do an dive.
    name = 'Wapeach',
    kick_dive_on = true,
    kick_jump_strength = 135,
    super_side_flip_on = true,
    bad_gas_damage_multiplier = 0,
    fall_gravity = 110,
    ground_pound_shake = 120,
    ground_pound_max_y_vel = 200,
    ground_pound_gravity = 200,
    knockback_resistance = 35,
    kill_toad = true,
    kill_pink_bomb_on = true,
    flying_enemy_damage_multiplier = 50
}, {
    -- character with in air jump that can not do double jump.
    -- to do triple jump you need to long jump first.
    name = 'Parappa the Rapper',
    disable_double_jump = true,
    in_air_jump = 1,
    in_air_jump_strength = 5,
    in_air_jump_forward_vel_multiplier = 75,
    long_jump_triple_jump_on = true,
    kick_dive_on = true
}, {
    name = 'Joker Mario',
    bat_damage_multiplier = 1000,
    bad_gas_damage_multiplier = 0,
    saultube_triple_jump_animation = true,
    kill_toad = true,
    kill_pink_bomb_on = true,
    single_jump_strength = 80,
    double_jump_strength = 90,
    triple_jump_strength = 110,
    ground_pound_dive_on = true,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = 50
}, {
    name = 'Steve?',
    bat_damage_multiplier = 0
}, {
    -- character with double jump, but has one health
    name = 'The Kid',
    one_hit = true,
    burning_damage_multiplier = 800,
    in_air_jump = 1,
    in_air_jump_strength = 35,
    in_air_speed = 120
}, {
    -- speedy character with bad jumps that can wall slide and gound pound jump
    name = 'Fungus',
    gravity = 120,
    in_air_speed = 140,
    walking_speed = 140,
    burning_damage_multiplier = 150,
    bat_damage_multiplier = 200,
    knockback_resistance = -150,
    ground_pound_jump_on = true,
    ground_pound_antecipation_speed_up = 'medium',
    wall_slide_on = true,
    wall_slide_jump_strength = 60
}, {
    -- speedy character with bad jumps that can wall slide and gound pound jump
    name = 'DJ Toad',
    gravity = 120,
    in_air_speed = 140,
    walking_speed = 140,
    burning_damage_multiplier = 150,
    bat_damage_multiplier = 200,
    knockback_resistance = -150,
    ground_pound_jump_on = true,
    ground_pound_antecipation_speed_up = 'medium',
    wall_slide_on = true,
    wall_slide_jump_strength = 60,
    wall_slide_jump_type = ACT_JUMP
}, {
    name = 'Spider-Man',
    bat_damage_multiplier = 1000,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = 0,
    disable_fall_damage = true
}, {
    name = 'Hulk',
    bat_damage_multiplier = 1000,
    piranha_plant_damage_multiplier = -1,
    water_enemy_damage_multiplier = -1,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = 0
}, {
    name = 'Deadpool',
    bat_damage_multiplier = 1000,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = 0
}, {
    name = 'Venom',
    bat_damage_multiplier = 1000,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = 0
}, {
    name = 'Daredevil',
    bat_damage_multiplier = 1000,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = 0
}, {
    name = 'Wolverine',
    bat_damage_multiplier = 1000,
    disable_damage = true
}, {
    -- character that glides when diving. It can also do ground pound jump
    name = 'Charizard',
    glide_dive_on = false,
    water_damage_multiplier = 250,
    disable_burning = true,
    disable_breath_heal = true,
    ground_pound_jump_on = true,
    knockback_resistance = 50,
    water_enemy_damage_multiplier = 200,
    piranha_plant_damage_multiplier = 50,
    moveset_description = "glide dive, ground pound jump"
}, {
    -- character with a glide that is faster, slower decent but with bad angle control. She can also dive from ground pound
    name = 'Draco Centauros',
    glide_dive_on = true,
    glide_dive_slowdown = 0,
    glide_dive_max_time = 35,
    glide_dive_angle_speed = 10,
    glide_dive_y_vel = -4,
    glide_dive_forward_vel = 74,
    water_damage_multiplier = 200,
    ground_pound_dive_on = true,
    coin_heal_multiplier = 50,
    burning_damage_multiplier = 75,
    moveset_description = "fast glide without turn, ground pound dive"
}, {
    -- character with an glide with downard angle. He can also super side flipa nd have buffed back flip
    name = 'Spamton NEO',
    glide_dive_on = true,
    glide_dive_render_with_wing_cap = true,
    glide_dive_y_vel = -10,
    glide_dive_forward_vel = 80,
    glide_dive_angle_speed = 5,
    glide_dive_slowdown = 0.35,
    glide_dive_min_forward_speed = 40,
    super_side_flip_on = true,
    back_flip_strength = 115,
    moveset_description = "glide dive, great back flip, super side flip"
}, {
    name = 'Swimming Spamton',
    swimming_speed = 250,
    water_damage_multiplier = 90,
    super_side_flip_on = true,
    back_flip_strength = 115,
    ground_pound_dive_on = true,
    moveset_description = "ground pound dive, great back flip, super side flip"
}, {
    name = 'Spamton',
    super_side_flip_on = true,
    back_flip_strength = 115,
    ground_pound_jump_on = true,
    moveset_description = "ground pound jump, great back flip, super side flip"
}, {
    name = 'Addison Spamton',
    super_side_flip_on = true,
    back_flip_strength = 115,
    walking_speed = 130,
    moveset_description = "fast, great back flip, super side flip"
}, {
    name = 'Big Shot Spamton',
    super_side_flip_on = true,
    mr_l_jump_on = true,
    coin_heal_multiplier = 200,
    ground_pound_dive_on = true,
    moveset_description = "super side flip, mr.L jump"
}, {
    name = 'Flat-Shaded Spamto',
    super_side_flip_on = true,
    back_flip_strength = 115,
    long_jump_triple_jump_on = true,
    goomba_damage_multiplier = 1000,
    moveset_description = "super side flip, long jump triple jump"
}, {
    name = 'Ralsei Spamton',
    super_side_flip_on = true,
    back_flip_strength = 115,
    disable_double_jump = true,
    kick_dive_on = true,
    kick_jump_strength = 150,
    moveset_description = "super side flip,  kick dive, disable double jump"
}, {
    name = 'Spamario',
    super_side_flip_on = true,
    back_flip_strength = 115,
    ground_pound_dive_on = true,
    single_jump_strength = 90,
    double_jump_strength = 95,
    triple_jump_strength = 115,
    moveset_description = "super side flip, ground pound dive"
}, {
    name = 'Dress Spamton',
    super_side_flip_on = true,
    back_flip_strength = 115,
    fall_gravity = 85,
    moveset_description = "good back flip, super side flip"

}, {
    -- character with an glide that goes upward and lots of resistance
    name = 'Godzilla',
    glide_dive_on = true,
    glide_dive_render_with_wing_cap = true,
    glide_dive_disable_spin = true,
    glide_dive_min_forward_speed = 35,
    glide_dive_angle_speed = 45,
    glide_dive_slowdown = 1,
    disable_burning = true,
    disable_damage = true,
    walking_speed = 125,
    glide_dive_y_vel = 5,
    ground_pound_max_y_vel = 150,
    ground_pound_shake = 120,
    knockback_resistance = 60,
    kill_toad = true,
    kill_pink_bomb_on = true,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = 0,
    disable_fall_damage = true,
    moveset_description = "glide dive upward"
}, {
    name = 'Ori',
    wall_slide_on = true,
    wall_slide_jump_strength = 60,
    wall_slide_jump_type = ACT_JUMP,
    in_air_jump = 2,
    in_air_jump_strength = {20, 15},
    in_air_jump_animation = {CHAR_ANIM_DOUBLE_JUMP_RISE, CHAR_ANIM_WING_CAP_FLY},
    in_air_jump_forward_vel = {0, 60},
    moveset_description = "triple in air jumps, wall slide"
}, {
    -- charactar with bad jumps, wall slide and a small but speedy yoshi flutter 
    name = "Mlops' Yoshi",
    yoshi_flutter_on = true,
    yoshi_flutter_stength_descending = 18,
    yoshi_flutter_speed = 140,
    yoshi_flutter_stength_ascending = 5,
    yoshi_flutter_max_y_vel = 25,
    yoshi_flutter_cooldown = 20,
    yoshi_flutter_angle_speed = 65,
    yoshi_flutter_reactivations = 6,
    long_jump_velocity_multiplier = 200,
    long_jump_max_velocity = 350,
    jump_strength = 82,
    wall_slide_on = true,
    moveset_description = "fast yoshi flutters, wall slide"
}, {
    -- character that can do yoshi flutter one time in the air.Also has glide dive
    name = 'Rex',
    yoshi_flutter_on = true,
    yoshi_flutter_reactivations = 1,
    yoshi_flutter_max_y_vel = 36,
    yoshi_flutter_stength_ascending = 7,
    glide_dive_on = true,
    glide_dive_y_vel = -10,
    glide_dive_forward_vel = 60,
    glide_dive_angle_speed = 15,
    glide_dive_max_time = 35,
    burning_damage_multiplier = 75,
    water_damage_multiplier = 150,
    coin_heal_multiplier = 50,
    kill_toad = true,
    moveset_description = "yoshi flutter, gldie dive"
}, {
    -- he can fly
    name = 'yosi cube',
    yoshi_flutter_on = true,
    yoshi_flutter_speed = 135,
    yoshi_flutter_reactivations = 99,
    yoshi_flutter_cooldown = 15,
    disable_damage = true,
    moveset_description = "infinite yoshi flutter"

}, {
    -- since this is an default character, you will need to manually activate the moveset (just remove the --)
    name = 'Toad'
    -- gravity = 120,
    -- in_air_speed = 140,
    -- walking_speed = 140,
    -- burning_damage_multiplier = 150,
    -- bat_damage_multiplier = 200,
    -- knockback_resistance = -150,
    -- ground_pound_jump_on = true,
    -- ground_pound_antecipation_speed_up = 'medium',
    -- wall_slide_on = true,
    -- wall_slide_jump_strength = 60
}, {
    -- character with bad jumps that can do yoshi flutter and back flip twirling
    name = 'Mouser',
    yoshi_flutter_on = true,
    yoshi_flutter_reactivations = 1,
    yoshi_flutter_angle_speed = 50,
    yoshi_flutter_speed = 120,
    single_jump_strength = 75,
    double_jump_strength = 75,
    triple_jump_strength = 75,
    back_flip_strength = 115,
    side_flip_strength = 115,
    long_jump_strength = 115,
    kill_toad = true,
    kill_pink_bomb_on = true,
    back_flip_twirling_on = true,
    moveset_description = "yoshi flutter, back flip twirl"

}, {
    -- character with high gravity, but can triple jump twirling and glide dive 
    name = 'Morgana',
    knockback_resistance = -50,
    walking_speed = 135,
    in_air_speed = 135,
    gravity = 135,
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -25,
    glide_dive_forward_vel = 60,
    triple_jump_strength = 110,
    triple_jump_twirling_on = true,
    triple_jump_twirling_when = 'start',
    twirling_dive_on = true,
    moveset_description = "triple jump twirling, glide dive, high gravity"
}, {
    -- charactar with strong yoshi flutter with bad horizontal speed. He can also waft fart 
    name = 'Watto',
    yoshi_flutter_on = true,
    fall_gravity = 130,
    yoshi_flutter_angle_speed = 25,
    yoshi_flutter_max_y_vel = 40,
    yoshi_flutter_reactivations = 2,
    yoshi_flutter_stength_ascending = 7,
    yoshi_flutter_speed = 75,
    waft_fart_on = true,
    waft_fart_per_level = 3,
    waft_fart_velocity = 150,
    waft_fart_strength = 70,
    ground_pound_dive_on = true,
    moveset_description = "yoshi flutter, waft fart"
}, {
    -- character that can do peel out and side flip twirling
    name = 'Bolt',
    peel_out_on = true,
    peel_out_max_vel = 150,
    back_flip_twirling_on = true,
    back_flip_strength = 110,
    twirling_dive_on = true,
    burning_damage_multiplier = 150,
    water_damage_multiplier = 125,
    moveset_description = "peel out, back flip twirling"
}, {
    -- character that can do peel out losing little speed (but also having smaller maximum speed) 
    -- it can also wall slide, triple jump twirling and has bad single/double jump_strength
    name = 'Gargl',
    peel_out_on = true,
    peel_out_slowdown = 0.15,
    peel_out_max_vel = 100,
    peel_out_jump_reset_vel = false,
    wall_slide_on = true,
    wall_slide_jump_strength = 60,
    wall_slide_jump_type = ACT_JUMP,
    single_jump_strength = 75,
    double_jump_strength = 85,
    triple_jump_strength = 110,
    triple_jump_twirling_on = true,
    triple_jump_twirling_when = 'start',
    walking_speed = 110,
    special_triple_jump_animation = true,
    moveset_description = "peel out, triple jump twirling, bad single/double jumps"
}, {
    name = 'OMORI',
    kick_dive_on = true
}, {
    name = 'SUNNY'
}, {
    -- character that always dive first and can kick after.
    -- also can dive from ground, and can triple jump from long jump
    name = 'Mario (Lou Albano)',
    always_dive_first = true,
    dive_kick_on = true,
    ground_pound_dive_on = true,
    dive_velocity = 200,
    dive_max_velocity = 125,
    long_jump_triple_jump_on = true,
    moveset_description = "kick from dives,long jump triple jump"
}, {
    name = 'GamesCage',
    sonic_jump_on = true,
    peel_out_on = true,
    in_air_speed = 120,
    walking_speed = 120,
    wall_slide_on = true,
    wall_slide_jump_strength = 60,
    wall_slide_jump_type = ACT_JUMP,
    moveset_description = "pell out, wall slide, speedy"
}, {
    name = 'Dudaw Kirby',
    gravity = 85,
    fall_gravity = 80,
    jump_strength = 85,
    walking_speed = 120,
    in_air_speed = 110,
    in_air_jump = 10,
    in_air_jump_strength = 20,
    knockback_resistance = -50,
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -7,
    moveset_description = 'floaty character, in air jumps, glide dive'
}, {
    name = '(Moveset) Kirby',
    gravity = 85,
    fall_gravity = 80,
    jump_strength = 85,
    walking_speed = 120,
    in_air_speed = 110,
    knockback_resistance = -50,
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -7,
    moveset_description = 'floaty character, glide dive'
}, {
    name = 'Kirby',
    gravity = 85,
    fall_gravity = 80,
    jump_strength = 85,
    walking_speed = 120,
    in_air_speed = 110,
    knockback_resistance = -50,
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -7,
    in_air_jump = 10,
    in_air_jump_strength = 20,
    moveset_description = 'floaty character, in air jumps, glide dive'
}, {
    name = 'Meta Knight',
    gravity = 85,
    fall_gravity = 80,
    jump_strength = 85,
    walking_speed = 120,
    in_air_speed = 110,
    knockback_resistance = 50,
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -7,
    in_air_jump = 10,
    in_air_jump_strength = 20,
    moveset_description = 'floaty character, in air jumps, glide dive'
}, {
    name = 'King Dedede',
    gravity = 85,
    fall_gravity = 80,
    jump_strength = 85,
    walking_speed = 120,
    in_air_speed = 110,
    knockback_resistance = 50,
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -7,
    ground_pound_antecipation_speed_up = 'medium',
    ground_pound_jump_on = true,
    ground_pound_jump_forward_vel = 40,
    in_air_jump = 10,
    in_air_jump_strength = 20,
    moveset_description = 'floaty character, in air jumps, glide dive'
}, {
    name = 'Waddle Dee',
    gravity = 85,
    fall_gravity = 80,
    jump_strength = 85,
    walking_speed = 120,
    in_air_speed = 110,
    knockback_resistance = -50,
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -7,
    wall_slide_on = true,
    in_air_jump = 10,
    in_air_jump_strength = 20,
    moveset_description = 'floaty character, in air jumps, glide dive'
}, {
    name = 'Rocky',
    ground_pound_antecipation_speed_up = 'immediately',
    ground_pound_dive_on = true,
    ground_pound_jump_on = true,
    ground_pound_dive_y_vel = 10,
    hold_walking_speed = 85,
    knockback_resistance = 35,
    flying_enemy_damage_multiplier = 50,
    moveset_description = 'ground pound jump, ground pound dive'
}, {
    name = 'Tac',
    wall_slide_on = true,
    wall_slide_gravity = 30,
    wall_slide_jump_type = ACT_JUMP,
    jump_strength = 105,
    walking_speed = 110,
    in_air_speed = 110,
    kick_jump_strength = 150,
    moveset_description = "wall slide, big kicks"
}, {
    name = 'Knuckle Joe',
    wall_slide_on = true,
    wall_slide_max_gravity = 20,
    wall_slide_jump_type = ACT_DIVE,
    wall_slide_jump_forward_vel = 48,
    wall_slide_jump_strength = 60,
    long_jump_triple_jump_on = true,
    long_jump_triple_jump_strength = 90,
    moveset_description = "wall slide, great long jumps"
}, {
    name = 'Toothless',
    glide_dive_on = true,
    glide_dive_slowdown = 0,
    glide_dive_max_time = 35,
    glide_dive_angle_speed = 10,
    glide_dive_y_vel = -4,
    glide_dive_forward_vel = 74,
    water_damage_multiplier = 200,
    ground_pound_dive_on = true,
    coin_heal_multiplier = 50,
    burning_damage_multiplier = 75,
    moveset_description = "fast glide dive without turn, ground pound dive"
}, {
    name = 'Dart',
    glide_dive_on = true,
    mr_l_jump_on = true,
    play_mr_l_anticipation_audio = false,
    knockback_resistance = -50,
    moveset_description = "glide dive, mr L jump "
}, {
    name = 'Ruffrunner',
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_y_vel = -7,
    glide_dive_forward_vel = 60,
    glide_dive_max_time = 45,
    back_flip_twirling_on = true,
    back_flip_strength = 110,
    twirling_dive_on = true,
    twirling_gravity = 115,
    moveset_description = "glide dive, backflip twirl, twirl dive"
}, {
    name = 'Pouncer',
    glide_dive_on = true,
    glide_dive_disable_spin = true,
    glide_dive_min_forward_speed = 32,
    glide_dive_angle_speed = 45,
    glide_dive_slowdown = 0.75,
    glide_dive_y_vel = 8,
    single_jump_strength = 90,
    kick_dive_on = true,
    moveset_description = "upward glide dive, kick dive"
}, {
    -- character that can glide dive and peel out
    name = 'Chaos 0',
    water_damage_multiplier = 0,
    water_enemy_damage_multiplier = -1,
    swimming_speed = 250,
    ground_pound_dive_on = true,
    glide_dive_on = true,
    glide_dive_y_vel = -7,
    glide_dive_forward_vel = 60,
    glide_dive_max_time = 45,
    glide_dive_disable_spin = true,
    peel_out_on = true,
    peel_out_jump_reset_vel = false,
    kill_toad = true,
    kill_pink_bomb_on = true,
    charge_sonic_dash_on = true,
    moveset_description = "glide dive, peel out, fast swim"

}, {
    -- character with charge dash and drop dash
    name = '\"SONIC\"',
    drop_dash_on = true,
    charge_sonic_dash_on = true,
    kill_toad = true,
    kill_pink_bomb_on = true,
    walking_speed = 135,
    moveset_description = "fast, drop dash, charge dash"
}, {
    -- character with an drop dash that slowdown little inw ater/lava. Also yoshi flutter
    name = 'Weirdo',
    charge_sonic_dash_on = true,
    sonic_dash_slowdown_lava = 0.05,
    sonic_dash_slowdown_water = 0.05,
    coin_heal_multiplier = 50,
    yoshi_flutter_on = true,
    yoshi_flutter_reactivations = 1,
    yoshi_flutter_max_y_vel = 36,
    yoshi_flutter_stength_ascending = 7,
    moveset_description = "drop dash, yoshi flutter, coin heal less"
},
{
    -- character can climb wall by wall slide jumpign while holding in the direction of the wall.
    -- also has fast dash while having bad angle speed
    name = 'Whisper the Wolf',
    drop_dash_on = true,
    sonic_dash_angle_speed = 50,
    sonic_dash_max_vel = 150,
    wall_slide_on = true,
    wall_slide_jump_type = ACT_SIDE_FLIP,
    wall_slide_same_wall = true,
    sonic_jump_on = true,
    moveset_description = "wall slide, drop dash"
},
{
    name = 'E-102 Gamma',
    disable_burning = true,
    bad_gas_damage_multiplier = 0,
    lava_damage_multiplier = 0,
    ground_pound_max_y_vel = 130,
    ground_pound_shake = 150,
    knockback_resistance = 60,
    flying_enemy_damage_multiplier = 50,
    goomba_damage_multiplier = -1,
    peel_out_on = true,
    peel_out_slowdown = 0.65,
    peel_out_jump_reset_vel = false,
    disable_fall_damage = true,
    moveset_description = "peel out, bunch of damage resistance"
}
,
-- character with peel out, glide dive and no fall dagame
{
    name = 'NiGHTS',
    gravity = 80,
    glide_dive_on = true,
    glide_dive_render_with_wing_cap = true,
    glide_dive_disable_spin = true,
    glide_dive_min_forward_speed = 35,
    glide_dive_angle_speed = 45,
    glide_dive_forward_vel = 70,
    glide_dive_slowdown = 0.5,
    disable_fall_damage = true,
    peel_out_on = true,
    moveset_description = "glide dive, peel out, no fall damage"
},
{
    name = 'Blaze the Cat',
    peel_out_on = true,
    drop_dash_on = true,
    charge_sonic_dash_on = true,
    walking_speed = 140,
    in_air_speed = 80,
    moveset_description="peel out, charge dash, drop dash"
},
{
    -- the perfect character
    name = 'Burger Man',
    drop_dash_on = true,
    drop_dash_charge_vel = 150,
    sonic_dash_max_vel = 150,
    walking_speed = 150,
    in_air_speed = 150,
    disable_damage = true,
    waft_fart_on = true,
    waft_fart_per_level = 15,
    waft_fart_velocity = 150,
    waft_fart_strength = 70,
    moveset_description="takes no damage, drop dash, waft fart"
},
{
    name= 'Big The Cat',
    ground_pound_jump_on = true
},
{
    name = 'Matikanefukukitaru',
    walking_speed = 130,
    in_air_speed = 110,
    double_jump_strength = 120,
    triple_jump_strength = 120,
    back_flip_strength = 90,
    side_flip_strength = 90,
    long_jump_strength = 120,
    long_jump_triple_jump_on = true,
    peel_out_on = true,
    peel_out_max_vel = 150,
    bad_gas_damage_multiplier = 201,
    goomba_damage_multiplier = 200,
    knockback_resistance = 85,
    moveset_description = "",
    fromInitialTable = false
},
{
    name = 'Il Piantissimo',
    fall_gravity = 115,
    walking_speed = 110,
    jump_strength = 95,
    back_flip_strength = 95,
    long_jump_strength = 95,
    dive_y_vel = 15,
    always_dive_first = true,
    ground_pound_dive_on = true,
    wall_slide_on = true,
    wall_slide_jump_strength = 70,
    dive_angle_speed = 20,
    basic_jump_angle_speed = 20,
    moveset_description = "",
    fromInitialTable = false
},
{
    name = 'Ducky',
    swimming_speed = 160,
    gravity = 95,
    fall_gravity = 105,
    in_air_speed = 115,
    hold_walking_speed = 90,
    back_flip_strength = 120,
    long_jump_strength = 105,
    water_damage_multiplier = 200,
    burning_damage_multiplier = 200,
    water_enemy_damage_multiplier = 200,
    flying_enemy_damage_multiplier = 200,
    goomba_damage_multiplier = 300,
    disable_fall_damage = true,
    knockback_resistance = 80,
    kick_dive_on = true,
    basic_jump_angle_speed = 50,
    special_triple_jump_on = true,
    disable_special_triple_jump_bounce = true,
    special_triple_jump_animation_speedup = 20,
    moveset_description = "",
    fromInitialTable = false
},
{
    name = 'Mario Party Mario',
    double_jump_strength = 105,
    triple_jump_strength = 105,
    back_flip_strength = 95,
    ground_pound_jump_on = true,
    ground_pound_jump_forward_vel = 10,
    long_jump_triple_jump_on = true,
    long_jump_triple_jump_strength = 65,
    long_jump_triple_jump_add_forward_vel = 70,
    goomba_damage_multiplier = 300,
    knockback_resistance = 90,
    dive_kick_on = true,
    triple_jump_animation = "special",
    moveset_description = "Default moveset",
    fromInitialTable = false
},
{
    name = 'Gold Ship',
    swimming_speed = 90,
    gravity = 110,
    fall_gravity = 135,
    walking_speed = 125,
    in_air_speed = 135,
    hold_walking_speed = 200,
    crawling_speed = 150,
    side_flip_strength = 120,
    ground_pound_dive_on = true,
    back_flip_twirling_on = true,
    twirling_speed = 125,
    super_side_flip_on = true,
    peel_out_on = true,
    peel_out_max_vel = 150,
    peel_out_slowdown = 0.25,
    water_enemy_damage_multiplier = 300,
    piranha_plant_damage_multiplier = 300,
    bat_damage_multiplier = 300,
    knockback_resistance = 120,
    explode_on_death = true,
    kill_toad = true,
    kill_pink_bomb_on = true,
    triple_jump_animation = "special_v2",
    special_triple_jump_animation_speedup = 20,
    moveset_description = "Default moveset",
    fromInitialTable = false
},
{
    name = 'Tuxie',
    swimming_speed = 300,
    gravity = 120,
    walking_speed = 150,
    in_air_speed = 150,
    hold_walking_speed = 200,
    side_flip_strength = 110,
    long_jump_strength = 90,
    kick_jump_strength = 200,
    ground_pound_jump_on = true,
    water_damage_multiplier = 0,
    snow_water_damage_multiplier = 0,
    burning_damage_multiplier = 50,
    water_enemy_damage_multiplier = 50,
    piranha_plant_damage_multiplier = 200,
    knockback_resistance = 30,
    dive_angle_speed = 5,
    moveset_description = "",
    fromInitialTable = false
},
{
    name = 'Scatman',
    gravity = 85,
    fall_gravity = 80,
    double_jump_strength = 105,
    triple_jump_strength = 110,
    back_flip_strength = 90,
    mr_l_jump_on = true,
    twirling_speed = 150,
    waft_fart_on = true,
    super_side_flip_on = true,
    coin_heal_multiplier = 50,
    all_jumps_angle_speed = 25,
    single_jump_animation = "special_v2",
    moveset_description = "",
    fromInitialTable = false
},
{

    name = 'Chicken Jockey',
    gravity = 130,
    walking_speed = 120,
    in_air_speed = 120,
    jump_strength = 90,
    yoshi_flutter_on = true,
    peel_out_on = true,
    peel_out_max_vel = 180,
    peel_out_slowdown = 1,
    goomba_damage_multiplier = 300,
    disable_fall_damage = true,
    knockback_resistance = 50,
    kill_toad = true,
    kill_pink_bomb_on = true,
    dive_angle_speed = 25,
    moveset_description = "Default moveset",
    fromInitialTable = false
},
{
    name = 'Chuck',
    waft_fart_on = true,
    waft_fart_velocity = 175,
    waft_fart_strength = 60,
    waft_fart_per_level = 5,
    charge_sonic_dash_on = true,
    drop_dash_on = true,
    moveset_description = "Default moveset",
    fromInitialTable = false
},
{
    name = 'Omega',
    airborne_deceleration_speed = 50,
    in_air_speed = 120,
    hold_walking_speed = 85,
    triple_jump_strength = 105,
    back_flip_strength = 85,
    dive_velocity = 95,
    long_jump_velocity_multiplier = 200,
    mr_l_jump_on = true,
    knockback_resistance = 80,
    explode_on_death = true,
    kill_toad = true,
    kill_pink_bomb_on = true,
    dive_angle_speed = 5,
    basic_jump_angle_speed = 15,
    triple_jump_animation = "special_v2",
    moveset_description = "Default moveset",
    fromInitialTable = false
},
{
name = 'Baby Yoshi',
swimming_speed = 90,
gravity = 110,
fall_gravity = 90,
walking_speed = 120,
hold_walking_speed = 85,
crawling_speed = 150,
ground_pound_dive_on = true,
waft_fart_on = true,
waft_fart_velocity = 130,
waft_fart_strength = 60,
yoshi_flutter_on = true,
yoshi_flutter_angle_speed = 50,
yoshi_flutter_speed = 135,
yoshi_flutter_reactivations = 5,
yoshi_flutter_cooldown = 15,
yoshi_flutter_max_time = 35,
yoshi_flutter_stength_descending = 20,
yoshi_flutter_stength_ascending = 10,
fromInitialTable = false
},
{
    name = 'SAMUS ARAN',
    fall_gravity = 110,
    hold_walking_speed = 120,
    back_flip_twirling_on = true,
    wall_slide_on = true,
    wall_slide_gravity = 0.6,
    wall_slide_max_gravity = 0.3,
    in_air_jump = 1,
    bad_gas_damage_multiplier = 50,
    burning_damage_multiplier = 150,
    lava_damage_multiplier = 150,
    water_enemy_damage_multiplier = 150,
    piranha_plant_damage_multiplier = 50,
    flying_enemy_damage_multiplier = 50,
    knockback_resistance = 130,
    explode_on_death = true,
    single_jump_animation = "special",
    special_triple_jump_animation_speedup = 50,
    moveset_description = "",
    in_air_jump_animation=CHAR_ANIM_FORWARD_SPINNING,
    wall_slide_jump_type = ACT_JUMP,
    all_jumps_angle_speed=15,
    fromInitialTable = false
}
}