ACT_SONIC_DASH = allocate_mario_action(ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING | ACT_FLAG_INVULNERABLE |
                                           ACT_FLAG_RIDING_SHELL)
ACT_SONIC_DASH_AIR = allocate_mario_action(ACT_FLAG_AIR | ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING |
                                               ACT_FLAG_INVULNERABLE | ACT_FLAG_RIDING_SHELL)
local peelRelease = audio_sample_load("PeelRelease.ogg")

--- @param m MarioState
local function is_above_water(m)
    return m.floorHeight <= m.waterLevel
end

--- @param m MarioState
local function is_above_lava(m)
    return m.floor ~= nil and m.floor.type == SURFACE_BURNING
end

--- @param m MarioState
function update_sonic_slide_animation(m)
    if gPlayerSyncTable[0].sonicAnimFrame >= m.marioObj.header.gfx.animInfo.curAnim.loopEnd then
        gPlayerSyncTable[0].sonicAnimFrame = gPlayerSyncTable[0].sonicAnimFrame -
                                                 m.marioObj.header.gfx.animInfo.curAnim.loopEnd
    end
    gPlayerSyncTable[0].sonicAnimFrame = gPlayerSyncTable[0].sonicAnimFrame + 2 * (m.forwardVel / 95)
    smlua_anim_util_set_animation(m.marioObj, "SONIC_BALL")
    set_anim_to_frame(m, gPlayerSyncTable[0].sonicAnimFrame)

end

--- @param m MarioState
--- @return boolean
local function act_sonic_slide_above_water(m)
    if is_above_water(m) then
        play_sound(SOUND_MOVING_TERRAIN_RIDING_SHELL + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject)
        set_mario_particle_flags(m, PARTICLE_SHALLOW_WATER_WAVE, 0)
        if m.forwardVel < 15 then
            set_mario_action(m, ACT_IDLE, 0)
            return true
        end
    end
    return false
end

--- @param m MarioState
--- @return boolean
local function act_sonic_slide_above_lava(m)
    if is_above_lava(m) then
        mario_set_forward_vel(m, m.forwardVel - 1.75)
        if m.forwardVel < 25 then
            set_mario_action(m, ACT_IDLE, 0)
            return true
        end
    end
    return false
end

--- @param m MarioState
--- @param stats CharacterStats
local function apply_slowdown(m, stats)
    if is_above_water(m) then
        mario_set_forward_vel(m, m.forwardVel - stats.sonic_dash_slowdown_water)
    elseif is_above_lava(m) then
        mario_set_forward_vel(m, m.forwardVel - stats.sonic_dash_slowdown_lava)
    else
        mario_set_forward_vel(m, m.forwardVel - stats.sonic_dash_slowdown)
    end
end

--- @param m MarioState
--- @param startYaw number
local function tilt_sonic_slide(m, startYaw)
    local dYaw = m.faceAngle.y - startYaw;
    local val02 = -convert_s16(dYaw * m.forwardVel * 5);
    val02 = clampf(val02, -1365, 1365)

    m.marioObj.header.gfx.angle.z = approach_s32(m.marioObj.header.gfx.angle.x, val02, 1365, 1365);
end

--- @param m MarioState
local function act_sonic_dash(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    local startYaw = m.faceAngle.y
    apply_slowdown(m, stats)
    if (m.controller.buttonDown & B_BUTTON) ~= 0 and m.forwardVel < 75 and is_above_water(m) == false and is_above_lava(m) ==
        false then
        m.forwardVel = stats.sonic_dash_max_vel
        audio_sample_play(peelRelease, m.pos, 0.55)
    end

    local changedAction = act_sonic_slide_above_water(m) or act_sonic_slide_above_lava(m)
    if changedAction then
        return
    end
    if m.forwardVel < 10 then
        set_mario_action(m, ACT_IDLE, 0)
        return
    end

    adjust_sound_for_speed(m)

    local stepResult = perform_ground_step(m)
    if stepResult == GROUND_STEP_HIT_WALL and m.forwardVel >= 20 then
        set_mario_action(m, ACT_GROUND_BONK, 1)
        m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
        play_sound(SOUND_ACTION_HIT, m.marioObj.header.gfx.cameraToObject)
    elseif stepResult == GROUND_STEP_LEFT_GROUND then
        set_mario_action(m, ACT_SONIC_DASH_AIR, 0)
    end
    m.particleFlags = m.particleFlags | PARTICLE_DUST

    update_sonic_slide_animation(m)

    if (m.input & INPUT_A_PRESSED) ~= 0 then
        set_mario_action(m, ACT_JUMP, 0)
    end

    local angleSpeed = 0x800 * stats.sonic_dash_angle_speed
    m.faceAngle.y = m.intendedYaw - approach_s32(s16(m.intendedYaw - m.faceAngle.y), 0, angleSpeed, angleSpeed)

    if (m.input & INPUT_ABOVE_SLIDE) ~= 0 then
        return set_mario_action(m, ACT_WALKING, 0)
    end
    tilt_sonic_slide(m, startYaw)
end
hook_mario_action(ACT_SONIC_DASH, act_sonic_dash, INT_KICK)

--- @param m MarioState
function act_sonic_dash_air(m)
    update_sonic_slide_animation(m)
    update_air_without_turn(m);

    local step = perform_air_step(m, 0)
    if step == AIR_STEP_LANDED then
        set_mario_action(m, ACT_SONIC_DASH, 0);
    elseif step == AIR_STEP_HIT_WALL and m.forwardVel >= 20 then
        set_mario_action(m, ACT_BACKWARD_GROUND_KB, 1)
        m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
        play_sound(SOUND_ACTION_HIT, m.marioObj.header.gfx.cameraToObject)
    elseif step == AIR_STEP_HIT_LAVA_WALL then
        lava_boost_on_wall(m);
    end

end
hook_mario_action(ACT_SONIC_DASH_AIR, act_sonic_dash_air, INT_KICK)
