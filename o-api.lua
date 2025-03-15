local table_insert = table.insert

local function getNotNil(value, valueType, defaultValue)
    if value ~= nil and type(value) == valueType then
        if type(value) == "number" then
            return value / 100 - 1.0
        end
        return value
    end
    return defaultValue
end

--- @param cs CharacterStats
local function clean_character_stats(cs)
    cs['name'] = getNotNil(cs['name'], "string", "Untitled")
    cs['swimming_speed'] = getNotNil(cs['swimming_speed'], "number", 0.0) + 1

    cs['gravity'] = getNotNil(cs['gravity'], "number", 0.0)
    cs['fall_gravity'] = getNotNil(cs['fall_gravity'], "number", cs['gravity'])
    cs['explode_on_death'] = getNotNil(cs['explode_on_death'], "boolean", false)
    cs['airborne_deceleration_speed'] = getNotNil(cs['airborne_deceleration_speed'], "number", 0.0)

    -- the jump constants are set at https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/src/game/mario.c#L924
    local allJumpsStrength = getNotNil(cs['jump_strength'], "number", 0.0)
    cs['single_jump_strength'] = 42 * getNotNil(cs['single_jump_strength'], "number", allJumpsStrength)
    cs['double_jump_strength'] = 52 * getNotNil(cs['double_jump_strength'], "number", allJumpsStrength)
    cs['triple_jump_strength'] = getNotNil(cs['triple_jump_strength'], "number", allJumpsStrength)
    cs['back_flip_strength'] = 62 * getNotNil(cs['back_flip_strength'], "number", allJumpsStrength)
    cs['side_flip_strength'] = 62 * getNotNil(cs['side_flip_strength'], "number", allJumpsStrength)
    cs['long_jump_strength'] = 30 * getNotNil(cs['long_jump_strength'], "number", allJumpsStrength)
    cs.kick_jump_strength = getNotNil(cs.kick_jump_strength, "number", allJumpsStrength)

    cs['dive_y_vel'] = cs['dive_y_vel'] ~= nil and type(cs['dive_y_vel']) == "number" and cs['dive_y_vel'] or 0
    cs['dive_velocity'] = 15 * getNotNil(cs['dive_velocity'], "number", 0)
    cs['dive_max_velocity'] = 48 * (getNotNil(cs['dive_max_velocity'], "number", 0.0) + 1)

    cs.ground_pound_antecipation_speed_up = getNotNil(cs.ground_pound_antecipation_speed_up, "string", "zero")
    cs.ground_pound_dive_on = getNotNil(cs.ground_pound_dive_on, "boolean", false)
    cs.ground_pound_dive_y_vel= cs.ground_pound_dive_y_vel ~= nil and type(cs.ground_pound_dive_y_vel) == "number" and cs.ground_pound_dive_y_vel or 0
    cs.ground_pound_dive_forward_vel  = cs.ground_pound_dive_forward_vel ~= nil and type(cs.ground_pound_dive_forward_vel) == "number" and cs.ground_pound_dive_forward_vel or cs['dive_max_velocity']
    cs.ground_pound_gravity = getNotNil(cs.ground_pound_gravity, "number", cs.gravity)
    cs.ground_pound_max_y_vel= 75 * (getNotNil(cs.ground_pound_max_y_vel, "number", 0.0) + 1)
    cs.waft_fart_on= getNotNil(cs.waft_fart_on, "boolean", false)
    cs.waft_fart_velocity= cs.waft_fart_velocity ~= nil and type(cs.waft_fart_velocity) == "number" and cs.waft_fart_velocity or 100
    cs.waft_fart_strength= cs.waft_fart_strength ~= nil and type(cs.waft_fart_strength) == "number" and cs.waft_fart_strength or 93
    cs.waft_fart_per_level= cs.waft_fart_per_level ~= nil and type(cs.waft_fart_per_level) == "number" and cs.waft_fart_per_level or 1
    cs.ground_pound_shake=  (getNotNil(cs.ground_pound_shake, "number", 0.0) + 1)
    cs.ground_pound_jump_on=  getNotNil(cs.ground_pound_jump_on, "boolean", false)
    cs.ground_pound_jump_strength=  cs.ground_pound_jump_strength ~= nil and type(cs.ground_pound_jump_strength) == "number" and cs.ground_pound_jump_strength or 70
    cs.ground_pound_jump_forward_vel=  cs.ground_pound_jump_forward_vel ~= nil and type(cs.ground_pound_jump_forward_vel) == "number" and cs.ground_pound_jump_forward_vel or 5
    cs.ground_pound_jump_dive_on=  getNotNil(cs.ground_pound_jump_dive_on, "boolean", false)

    cs['long_jump_velocity_multiplier'] = 1.5 * getNotNil(cs['long_jump_velocity_multiplier'], "number", 0.0)
    cs['long_jump_max_velocity'] = 48 * (getNotNil(cs['long_jump_max_velocity'], "number", 0.0) + 1)

    cs['walking_speed'] = (getNotNil(cs['walking_speed'], "number", 0.0) + 1)
    cs['in_air_speed'] = (getNotNil(cs['in_air_speed'], "number", 0.0) + 1)
    cs['hold_walking_speed'] = (getNotNil(cs['hold_walking_speed'], "number", cs['walking_speed']) + 1)
    cs['crawling_speed'] = (getNotNil(cs['crawling_speed'], "number", cs['walking_speed']) + 1)
    cs['grounded_slowing_speed'] = (getNotNil(cs['grounded_slowing_speed'], "number", 0.0) + 1)

    cs['mr_l_jump_on'] = getNotNil(cs['mr_l_jump_on'], "boolean", false)
    cs['mr_l_jump_strength'] = cs['mr_l_jump_strength'] ~= nil and type(cs['mr_l_jump_strength']) == "number" and
                                   cs['mr_l_jump_strength'] or 93
    cs['mr_l_gravity'] = getNotNil(cs['mr_l_gravity'], "number", 0.4)
    cs['mr_l_air_speed'] = getNotNil(cs['mr_l_air_speed'], "number", -0.4) + 1
    cs['play_mr_l_anticipation_audio'] = getNotNil(cs['play_mr_l_anticipation_audio'], "boolean", true)

    cs.bad_gas_damage_multiplier = getNotNil(cs.bad_gas_damage_multiplier, "number", 0.0) 
    cs.water_damage_multiplier = getNotNil(cs.water_damage_multiplier, "number", 0.0) 
    cs.snow_water_damage_multiplier = getNotNil(cs.snow_water_damage_multiplier, "number",  cs.water_damage_multiplier ) 
    cs.disable_breath_heal = getNotNil(cs.disable_breath_heal, "boolean", false)
    cs.burning_damage_multiplier = getNotNil(cs.burning_damage_multiplier, "number",  0.0 ) 
    cs.disable_burning = getNotNil(cs.disable_burning, "boolean", false)
    cs.disable_damage = getNotNil(cs.disable_damage, "boolean", false)
    cs.lava_damage_multiplier = getNotNil(cs.lava_damage_multiplier, "number", 0.0) 

    cs.twirling_dive_on = getNotNil(cs.twirling_dive_on, "boolean", false)
    cs.twirling_gravity = getNotNil(cs.twirling_gravity, "number", cs.gravity)
    cs.triple_jump_twirling_on = getNotNil(cs.triple_jump_twirling_on, "boolean", false)
    cs.triple_jump_twirling_when = getNotNil(cs.triple_jump_twirling_when, "string", "fall")
    cs.fast_twirling_on = getNotNil(cs.fast_twirling_on, "boolean", false)
    cs.fast_twirling_gravity = getNotNil(cs.fast_twirling_gravity, "number", cs.twirling_gravity)
    cs.back_flip_twirling_on = getNotNil(cs.back_flip_twirling_on, "boolean", false)
    cs.side_flip_twirling_on = getNotNil(cs.side_flip_twirling_on, "boolean", false)
    cs.twirling_ground_pound_on = getNotNil(cs.twirling_ground_pound_on, "boolean", false)
    cs.twirling_speed = (getNotNil(cs.twirling_speed, "number", cs.in_air_speed) + 1)

    cs.saultube_jump_animation = getNotNil(cs.saultube_jump_animation, "boolean", false)
    cs.saultube_single_jump_animation = getNotNil(cs.saultube_single_jump_animation, "boolean", cs.saultube_jump_animation )
    cs.saultube_double_jump_animation = getNotNil(cs.saultube_double_jump_animation, "boolean", cs.saultube_jump_animation )
    cs.saultube_triple_jump_animation = getNotNil(cs.saultube_triple_jump_animation, "boolean", cs.saultube_jump_animation )

    cs.long_jump_triple_jump_on= getNotNil(cs.long_jump_triple_jump_on, "boolean", false)
    cs.long_jump_triple_jump_strength = getNotNil(cs.long_jump_triple_jump_strength, "number", cs.triple_jump_strength)
    cs.long_jump_triple_jump_forward_vel =  cs.long_jump_triple_jump_forward_vel ~= nil and type(cs.long_jump_triple_jump_forward_vel) == "number" and cs.long_jump_triple_jump_forward_vel or nil
    cs.long_jump_triple_jump_add_forward_vel =  cs.long_jump_triple_jump_add_forward_vel ~= nil and type(cs.long_jump_triple_jump_add_forward_vel) == "number" and cs.long_jump_triple_jump_add_forward_vel or 0

    cs.super_side_flip_on= getNotNil(cs.super_side_flip_on, "boolean", false)
    cs.super_side_flip_strength= cs.super_side_flip_strength ~= nil and type(cs.super_side_flip_strength) == "number" and cs.super_side_flip_strength or 75

    cs.super_side_flip_convert_foward_vel= getNotNil(cs.super_side_flip_convert_foward_vel, "number", 0) + 1
    cs.super_side_flip_add_foward_vel=cs.super_side_flip_add_foward_vel ~= nil and type(cs.super_side_flip_add_foward_vel) == "number" and cs.super_side_flip_add_foward_vel or 20
    cs.super_side_flip_kick_strength= getNotNil(cs.super_side_flip_kick_strength, "number", 0.5) + 1
    cs.super_side_flip_kick_forward_vel= cs.super_side_flip_kick_forward_vel ~= nil and type(cs.super_side_flip_kick_forward_vel) == "number" and cs.super_side_flip_kick_forward_vel or nil
    cs.super_side_flip_gravity= getNotNil(cs.super_side_flip_gravity, "number", -0.25) + 1
    cs.super_side_flip_max_gravity= getNotNil(cs.super_side_flip_max_gravity, "number", 0) + 1
    cs.super_side_flip_min_velocity= cs.super_side_flip_min_velocity ~= nil and type(cs.super_side_flip_min_velocity) == "number" and cs.super_side_flip_min_velocity or 36

    cs.wall_slide_on = getNotNil(cs.wall_slide_on, "boolean", false)
    cs.wall_slide_gravity = getNotNil(cs.wall_slide_gravity, "number", -0.5) + 1
    cs.wall_slide_max_gravity = getNotNil(cs.wall_slide_max_gravity, "number", -0.73) + 1
    cs.wall_slide_jump_forward_vel = cs.wall_slide_jump_forward_vel ~= nil and type(cs.wall_slide_jump_forward_vel) == "number" and cs.wall_slide_jump_forward_vel or 20
    cs.wall_slide_jump_strength = cs.wall_slide_jump_strength ~= nil and type(cs.wall_slide_jump_strength) == "number" and cs.wall_slide_jump_strength or 75
    cs.wall_slide_jump_type = cs.wall_slide_jump_type ~= nil and type(cs.wall_slide_jump_type) == "number" and cs.wall_slide_jump_type or ACT_TRIPLE_JUMP

    cs.in_air_jump = cs.in_air_jump ~= nil and type(cs.in_air_jump) == "number" and cs.in_air_jump or 0
    cs.in_air_jump_strength = cs.in_air_jump_strength == nil and  42 or cs.in_air_jump_strength
    cs.in_air_jump_animation = cs.in_air_jump_animation == nil and CHAR_ANIM_DOUBLE_JUMP_RISE or  cs.in_air_jump_animation 
    cs.in_air_jump_sound =  cs.in_air_jump_sound == nil and CHAR_SOUND_HOOHOO or cs.in_air_jump_sound 
    cs.in_air_jump_forward_vel = cs.in_air_jump_forward_vel == nil and  0 or cs.in_air_jump_forward_vel

    cs.kick_dive_on = getNotNil(cs.kick_dive_on, "boolean", false)
    cs.disable_double_jump = getNotNil(cs.disable_double_jump, "boolean", false)

    if cs.in_air_jump_forward_vel_multiplier == nil then
        cs.in_air_jump_forward_vel_multiplier = 0.25
    elseif type(cs.in_air_jump_forward_vel_multiplier) == "number" then
        cs.in_air_jump_forward_vel_multiplier= getNotNil(cs.in_air_jump_forward_vel_multiplier, "number", -0.75) + 1
    else
        local fowardVelMultiplier = {}
        for i = 1, #cs.in_air_jump_forward_vel_multiplier do
            table.insert(fowardVelMultiplier, getNotNil( cs.in_air_jump_forward_vel_multiplier[i], "number", -0.75) + 1)
        end
        cs.in_air_jump_forward_vel_multiplier = fowardVelMultiplier
    end
    if cs.in_air_jump_forward_vel_slowdown == nil then
        cs.in_air_jump_forward_vel_slowdown = 0.2
    elseif type(cs.in_air_jump_forward_vel_slowdown) == "number" then
        cs.in_air_jump_forward_vel_slowdown= getNotNil(cs.in_air_jump_forward_vel_slowdown, "number", -0.8) + 1
    else
        local fowardVelSlowdown = {}
        for i = 1, #cs.in_air_jump_forward_vel_slowdown do
            table.insert(fowardVelSlowdown, getNotNil( cs.in_air_jump_forward_vel_slowdown[i], "number", -0.8) + 1)
        end
        cs.in_air_jump_forward_vel_slowdown = fowardVelSlowdown
    end

    cs.knockback_resistance = getNotNil(cs.knockback_resistance, "number", 0) + 1
    cs.disable_coin_heal= getNotNil(cs.disable_coin_heal, "boolean", false)
    cs.coin_heal_multiplier = cs.disable_coin_heal == true and 0 or getNotNil(cs.coin_heal_multiplier, "number", 0) 
    cs.bat_damage_multiplier = getNotNil(cs.bat_damage_multiplier, "number", 0) 
    cs.one_hit = getNotNil(cs.one_hit, "boolean", false)
    cs.disable_twirling_land = cs.disable_twirling_land ~= nil and type(cs.disable_twirling_land) == "boolean" and cs.disable_twirling_land or (cs.triple_jump_twirling_on or cs.back_flip_twirling_on or cs.side_flip_twirling_on)
    
    cs.glide_dive_on = getNotNil(cs.glide_dive_on, "boolean", false)
    cs.glide_dive_forward_vel = cs.glide_dive_forward_vel ~= nil and type(cs.glide_dive_forward_vel) == "number" and cs.glide_dive_forward_vel or 50
    cs.glide_dive_slowdown = cs.glide_dive_slowdown ~= nil and type(cs.glide_dive_slowdown) == "number" and cs.glide_dive_slowdown or 0.25
    cs.glide_dive_angle_speed =  getNotNil(cs.glide_dive_angle_speed, "number", -0.25) + 1
    cs.glide_dive_min_forward_speed = cs.glide_dive_min_forward_speed ~= nil and type(cs.glide_dive_min_forward_speed) == "number" and cs.glide_dive_min_forward_speed or 0
    cs.glide_dive_max_time = cs.glide_dive_max_time ~= nil and type(cs.glide_dive_max_time) == "number" and cs.glide_dive_max_time or 999
    cs.glide_dive_y_vel = cs.glide_dive_y_vel ~= nil and type(cs.glide_dive_y_vel) == "number" and cs.glide_dive_y_vel or -5
    cs.glide_dive_render_with_wing_cap = getNotNil(cs.glide_dive_render_with_wing_cap, "boolean", false)
    cs.glide_dive_disable_spin = getNotNil(cs.glide_dive_disable_spin, "boolean", false)

    cs.water_enemy_damage_multiplier = getNotNil(cs.water_enemy_damage_multiplier, "number", 0)
    cs.piranha_plant_damage_multiplier = getNotNil(cs.piranha_plant_damage_multiplier, "number", 0)

    cs.yoshi_flutter_on = getNotNil(cs.yoshi_flutter_on, "boolean", false)
    cs.yoshi_flutter_animation = cs.yoshi_flutter_animation ~= nil and type(cs.yoshi_flutter_animation) == "number" and cs.yoshi_flutter_animation or CHAR_ANIM_RUNNING
    cs.yoshi_flutter_angle_speed =  getNotNil(cs.yoshi_flutter_angle_speed, "number", -0.10) + 1
    cs.yoshi_flutter_cooldown = cs.yoshi_flutter_cooldown ~= nil and type(cs.yoshi_flutter_cooldown) == "number" and cs.yoshi_flutter_cooldown or 21
    cs.yoshi_flutter_stength_descending = cs.yoshi_flutter_stength_descending ~= nil and type(cs.yoshi_flutter_stength_descending) == "number" and cs.yoshi_flutter_stength_descending or 17
    cs.yoshi_flutter_stength_ascending = cs.yoshi_flutter_stength_ascending ~= nil and type(cs.yoshi_flutter_stength_ascending) == "number" and cs.yoshi_flutter_stength_ascending or 6
    cs.yoshi_flutter_max_y_vel= cs.yoshi_flutter_max_y_vel ~= nil and type(cs.yoshi_flutter_max_y_vel) == "number" and cs.yoshi_flutter_max_y_vel or 28
    cs.yoshi_flutter_reactivations= cs.yoshi_flutter_reactivations ~= nil and type(cs.yoshi_flutter_reactivations) == "number" and cs.yoshi_flutter_reactivations or 2
    cs.yoshi_flutter_speed =  getNotNil(cs.yoshi_flutter_speed, "number", 0) + 1

end

characterStatsTable = {}
for _, character in ipairs(initialCharacterStatsTable) do
    clean_character_stats(character)
    table_insert(characterStatsTable, character)
end

--- @param characterStats CharacterStats
local function upsert_table(characterStats)
    for i = 1, #characterStatsTable do
        if characterStatsTable[i].name == characterStats.name then
            characterStatsTable[i] = characterStats
        end
    end
    table_insert(characterStatsTable, characterStats)
end

--- @class CharacterStats
--- @field public name string|nil (Default "Untitled")
--- @field public swimming_speed number|nil (Default 100)
--- @field public gravity number|nil (Default 100)
--- @field public fall_gravity number|nil (Default gravity)
--- @field public explode_on_death boolean|nil (Default false)
--- @field public airborne_deceleration_speed number|nil (Default 100)
--- @field public jump_strength number|nil (Default 100)
--- @field public single_jump_strength number|nil (Default jump_strength)
--- @field public double_jump_strength number|nil (Default jump_strength)
--- @field public triple_jump_strength number|nil (Default jump_strength)
--- @field public back_flip_strength number|nil (Default jump_strength)
--- @field public side_flip_strength number|nil (Default jump_strength)
--- @field public long_jump_strength number|nil (Default jump_strength)
--- @field public kick_jump_strength number|nil (Default jump_strength)
--- @field public dive_y_vel number|nil (Default 0)
--- @field public dive_velocity number|nil (Default 100)
--- @field public dive_max_velocity number|nil (Default 100)
--- @field public ground_pound_dive_on boolean|nil (Default false)
--- @field public ground_pound_dive_y_vel number|nil (Default 0)
--- @field public ground_pound_dive_forward_vel number|nil (Default dive_max_velocity)
--- @field public long_jump_velocity_multiplier number|nil (Default 100)
--- @field public long_jump_max_velocity number|nil (Default 100)
--- @field public walking_speed number|nil (Default 100)
--- @field public in_air_speed number|nil (Default 100)
--- @field public hold_walking_speed number|nil (Default walking_speed)
--- @field public crawling_speed number|nil (Default walking_speed)
--- @field public grounded_slowing_speed number|nil (Default 100)
--- @field public mr_l_jump_on boolean|nil (Default false)
--- @field public mr_l_jump_strength number|nil (Default 93)
--- @field public mr_l_gravity number|nil (Default 140)
--- @field public mr_l_air_speed number|nil (Default 60)
--- @field public play_mr_l_anticipation_audio boolean|nil (Default true)
--- @field public back_flip_twirling_on boolean (Default false)
--- @field public side_flip_twirling_on boolean (Default false)
--- @field public twirling_ground_pound_on boolean|nil (Default false)
--- @field public twirling_dive_on boolean|nil (Default false)
--- @field public twirling_gravity number|nil (Default gravity)
--- @field public fast_twirling_on boolean|nil (Default false)
--- @field public fast_twirling_gravity number|nil (Default twirling_gravity)
--- @field public triple_jump_twirling_on boolean (Default false)
--- @field public triple_jump_twirling_when string|nil (Default fall)
--- @field public twirling_speed number|nil (Default in_air_speed)
--- @field public bad_gas_damage_multiplier number|nil (Default 100)
--- @field public water_damage_multiplier number|nil (Default 100)
--- @field public snow_water_damage_multiplier number|nil (Default water_damage_multiplier)
--- @field public disable_breath_heal boolean|nil (Default false)
--- @field public burning_damage_multiplier number|nil (Default 100)
--- @field public disable_burning boolean|nil (Default false)
--- @field public disable_damage boolean|nil (Default false)
--- @field public lava_damage_multiplier number|nil (Default 100)
--- @field public ground_pound_antecipation_speed_up string|nil (Default "zero")
--- @field public ground_pound_gravity string|nil (Default gravity)
--- @field public ground_pound_max_y_vel number|nil (Default 100)
--- @field public waft_fart_on boolean|nil (Default false)
--- @field public waft_fart_velocity number|nil (Default 100)
--- @field public waft_fart_strength number|nil (Default 93)
--- @field public waft_fart_per_level number|nil (Default 1)
--- @field public ground_pound_shake number|nil (Default 100)
--- @field public ground_pound_jump_on boolean|nil (Default false)
--- @field public ground_pound_jump_strength number|nil (Default 70)
--- @field public ground_pound_jump_forward_vel number|nil (Default 5)
--- @field public ground_pound_jump_dive_on boolean|nil (Default false)
--- @field public saultube_jump_animation boolean|nil (Default false)
--- @field public saultube_single_jump_animation boolean|nil (Default saultube_jump_animation)
--- @field public saultube_double_jump_animation boolean|nil (Default saultube_jump_animation)
--- @field public saultube_triple_jump_animation boolean|nil (Default saultube_jump_animation)
--- @field public long_jump_triple_jump_on boolean|nil (Default false)
--- @field public long_jump_triple_jump_strength number|nil (Default triple_jump_strength)
--- @field public long_jump_triple_jump_forward_vel number|nil (Default nil)
--- @field public long_jump_triple_jump_add_forward_vel number|nil (Default 0)
--- @field public super_side_flip_on boolean|nil (Default false)
--- @field public super_side_flip_strength number|nil (Default 75)
--- @field public super_side_flip_convert_foward_vel number|nil (Default 100)
--- @field public super_side_flip_add_foward_vel number|nil (Default 20)
--- @field public super_side_flip_kick_strength number|nil (Default 150)
--- @field public super_side_flip_kick_forward_vel number|nil (Default nil)
--- @field public super_side_flip_gravity number|nil (Default 75)
--- @field public super_side_flip_max_gravity number|nil (Default 93)
--- @field public super_side_flip_min_velocity number|nil (Default 36)
--- @field public wall_slide_on boolean (Default false)
--- @field public wall_slide_gravity number  (Default 0.5)
--- @field public wall_slide_max_gravity number  (Default 0.26)
--- @field public wall_slide_jump_forward_vel number  (Default 20)
--- @field public wall_slide_jump_strength number  (Default 75)
--- @field public wall_slide_jump_type number  (Default ACT_TRIPLE_JUMP)
--- @field public in_air_jump number (Default 0)
--- @field public in_air_jump_strength number|number[] (Default 42)
--- @field public in_air_jump_animation CharacterAnimID (Default CHAR_ANIM_DOUBLE_JUMP_RISE)
--- @field public in_air_jump_sound number|number[]  (Default CHAR_SOUND_HOOHOO)
--- @field public in_air_jump_forward_vel_multiplier number|number[]  (Default 0.25)
--- @field public in_air_jump_forward_vel_slowdown number|number[]  (Default 0.2)
--- @field public in_air_jump_forward_vel number|number[]  (Default 0)
--- @field public kick_dive_on boolean (Default false)
--- @field public disable_double_jump boolean (Default false)
--- @field public disable_twirling_land boolean (Default triple_jump_twirling_on or back_flip_twirling_on or side_flip_twirling_on)
--- @field public knockback_resistance number (Default 100)
--- @field public coin_heal_multiplier number (Default 0)
--- @field public disable_coin_heal boolean (Default false)
--- @field public bat_damage_multiplier number (Default 0)
--- @field public one_hit boolean (Default false)
--- @field public glide_dive_on boolean (Default false)
--- @field public glide_dive_forward_vel number (Default 50)
--- @field public glide_dive_slowdown number (Default 0)
--- @field public glide_dive_angle_speed number (Default 75)
--- @field public glide_dive_min_forward_speed number (Default 999)
--- @field public glide_dive_max_time number (Default 999)
--- @field public glide_dive_y_vel number (Default -5)
--- @field public glide_dive_render_with_wing_cap boolean (Default false)
--- @field public glide_dive_disable_spin boolean (Default false)
--- @field public water_enemy_damage_multiplier number (Default 0)
--- @field public piranha_plant_damage_multiplier number (Default 0)
--- @field public yoshi_flutter_on boolean (Default false)
--- @field public yoshi_flutter_animation CharacterAnimID (Default CHAR_ANIM_RUNNING)
--- @field public yoshi_flutter_angle_speed number (Default 90)
--- @field public yoshi_flutter_cooldown number (Default 21)
--- @field public yoshi_flutter_stength_descending number (Default 17)
--- @field public yoshi_flutter_stength_ascending number (Default 6)
--- @field public yoshi_flutter_max_y_vel number (Default 28)
--- @field public yoshi_flutter_reactivations number (Default 2)
--- @field public yoshi_flutter_speed number (Default 1)
--- @param characterStats CharacterStats
local function character_add(characterStats)
    clean_character_stats(characterStats)
    upsert_table(characterStats)
end

--- @param name string
--- @return CharacterStats|nil
local function stats_from_name(name)
    for i = 1, #characterStatsTable do
        if characterStatsTable[i].name == name then
            return characterStatsTable[i]
        end
    end
    return nil
end

hook_event(HOOK_UPDATE, function()
    gPlayerSyncTable[0].char_select_name = _G.charSelect.character_get_current_table().name
end)

_G.customMoves = {
    character_add = character_add,
    stats_from_name = stats_from_name
}

--- @param m MarioState
hook_event(HOOK_ON_PLAYER_CONNECTED, function(m)

    for i = #characterStatsTable, 1, -1 do

        if _G.charSelect.character_get_number_from_string(characterStatsTable[i].name) == nil then
          table.remove(characterStatsTable, i)
        end
    end

    gPlayerSyncTable[0].prevVelY = 0
    gPlayerSyncTable[0].prevForwardVel = 0

    gPlayerSyncTable[0].fart = 1
    gPlayerSyncTable[0].longJumpLandSpeed = 0
    gPlayerSyncTable[0].longJumpTimer = 100
    gPlayerSyncTable[0].inAirJump = 0
    gPlayerSyncTable[0].yoshiFlutterCooldown = 0
    gPlayerSyncTable[0].yoshiFlutterReactivations = 1
end)
