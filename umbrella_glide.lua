-- This code was made by Chaorrin, all credits to him
ACT_UMBRELLA_GLIDE = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_MOVING)

--- @param m MarioState
--- @param stats CharacterStats
function apply_umbrella_glide(m,stats)
    if stats.chaorrin_umbrella_glide_on == false then return end
    if m.prevAction == ACT_UMBRELLA_GLIDE  then return end
    
    if (m.controller.buttonDown & A_BUTTON) ~= 0 and m.vel.y < -15 and  (
        m.action == ACT_JUMP or
        m.action == ACT_SONIC_JUMP or
        m.action == ACT_DOUBLE_JUMP or
        m.action == ACT_TRIPLE_JUMP or
        m.action == ACT_LONG_JUMP or
        m.action == ACT_BACKFLIP or
        m.action == ACT_SIDE_FLIP or
        m.action == ACT_WALL_KICK_AIR
    ) then

        set_mario_action(m, ACT_UMBRELLA_GLIDE, 0)
            -- spawn paddle
            spawn_sync_object(    id_bhvBigumbrella,   E_MODEL_BIG_PADDLE, m.pos.x, m.pos.y, m.pos.z, function(o)
                o.globalPlayerIndex = m.marioObj.globalPlayerIndex
        end)
    end
end


--- @param m MarioState
--- @param stats CharacterStats
local function set_glide_animation(m,stats)
    if stats.chaorrin_umbrella_animation == "default" then
        smlua_anim_util_set_animation(m.marioObj, "Umbrella_Glide")
        return MARIO_ANIM_DROWNING_PART1 --any animation
    elseif stats.chaorrin_umbrella_animation == "hang ceiling" then
        return MARIO_ANIM_HANG_ON_CEILING
    elseif stats.chaorrin_umbrella_animation == "pole grab" then
        return MARIO_ANIM_GRAB_POLE_SHORT
    elseif stats.chaorrin_umbrella_animation == "t pose" then
        return CHAR_ANIM_START_TWIRL
    end
end

--- @param m MarioState
local function act_umbrella_glide(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    if check_kick_or_dive_in_air(m) ~= 0 then
        return true
    end

    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    end

    -- apply movement when using action
    local animation = set_glide_animation(m,stats)
    common_air_action_step(m, ACT_JUMP_LAND, animation, AIR_STEP_NONE)
        
    
    
    -- setup when action starts (horizontal speed and voiceline)
    if m.actionTimer == 0 then
        if stats.chaorrin_umbrella_caps_foward_speed and  m.forwardVel > 20 then
            mario_set_forward_vel(m, 20)
        end

        play_mario_sound(m, SOUND_ACTION_TERRAIN_JUMP, CHAR_SOUND_HELLO);
    end
    
    if m.actionTimer % 3== 0 then
        set_mario_particle_flags(m, PARTICLE_SPARKLES, 0)
    end

    -- avoid issue with flying and then make the hover end after 2 secs or when stopping holding the button
    if m.actionTimer >= stats.chaorrin_umbrella_max_timer or (m.controller.buttonDown & A_BUTTON) == 0 then
        local velY = m.vel.y
        set_mario_action(m, ACT_FREEFALL, 0)
        m.vel.y = velY
    end

    m.actionTimer = m.actionTimer + 1
end

--- @param m MarioState
local function apply_gravity(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end
    m.vel.y = math.max(-stats.chaorrin_umbrella_vertical_speed, m.vel.y -stats.chaorrin_umbrella_vertical_speed)
end

hook_mario_action(ACT_UMBRELLA_GLIDE, {
    every_frame =act_umbrella_glide,
    gravity = apply_gravity
})
    