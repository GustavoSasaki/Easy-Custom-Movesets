--- @param m MarioState
--- @param stats CharacterStats
local function apply_jump_speed(m, stats)
    -- the jump constants are set at https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/src/game/mario.c#L924
    if m.action == ACT_JUMP or m.action == ACT_HOLD_JUMP then
        m.vel.y = m.vel.y + stats.single_jump_strength

    elseif m.action == ACT_DOUBLE_JUMP then
        m.vel.y = m.vel.y + stats.double_jump_strength

    elseif m.action == ACT_TRIPLE_JUMP then
        m.vel.y = m.vel.y + (stats.triple_jump_strength * 69)

    elseif m.action == ACT_BACKFLIP then
        m.vel.y = m.vel.y + stats.back_flip_strength

    elseif m.action == ACT_SIDE_FLIP then
        m.vel.y = m.vel.y + stats.side_flip_strength

    elseif m.action == ACT_LONG_JUMP then
        m.vel.y = m.vel.y + stats.long_jump_strength
        local speedIncreaseLongJump = m.forwardVel * 0.33
        m.forwardVel = m.forwardVel + speedIncreaseLongJump * stats.long_jump_velocity_multiplier
        if (m.forwardVel > stats.long_jump_max_velocity) then
            m.forwardVel = stats.long_jump_max_velocity
        end

    elseif m.action == ACT_JUMP_KICK then
        m.vel.y = m.vel.y + (20 * stats.kick_jump_strength)

    elseif m.action == ACT_DIVE then
        m.vel.y = m.vel.y + stats.dive_y_vel
        m.forwardVel = m.forwardVel + stats.dive_velocity
        if (m.forwardVel > stats.dive_max_velocity) then
            m.forwardVel = stats.dive_max_velocity
        end

    elseif m.action == ACT_MR_L_JUMP then
        m.bounceSquishTimer = 0
        m.vel.y = stats.mr_l_jump_strength
    elseif m.action == ACT_WAFT_FART then
        gPlayerSyncTable[m.playerIndex].fart = gPlayerSyncTable[m.playerIndex].fart - 1
        m.vel.y = stats.waft_fart_strength
        set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, false);
    elseif m.action == ACT_TWIRL_LAND and
        (stats.triple_jump_twirling_on or stats.back_flip_twirling_on or stats.side_flip_twirling_on) and
        (m.controller.stickX ~= 0 or m.controller.stickY ~= 0) then
        set_mario_action(m, ACT_IDLE, 0);
    elseif m.action == ACT_LONG_JUMP_LAND then
        gPlayerSyncTable[m.playerIndex].longJumpLandSpeed = m.forwardVel
    elseif m.action == ACT_SOFT_BONK and stats.wall_slide_on then
        m.faceAngle.y = m.faceAngle.y + 0x8000
        set_mario_action(m, ACT_WALL_SLIDE, 0)
    elseif m.action == ACT_IN_AIR_JUMP then
        set_anim_to_frame(m, 0)
    end
end

-- @param m MarioState
local function resetVelocityToPrevAction(m)
    m.forwardVel = gPlayerSyncTable[m.playerIndex].prevForwardVel
    m.vel.y = gPlayerSyncTable[m.playerIndex].prevVelY
end
--- @param m MarioState
--- @param stats CharacterStats
local function apply_in_air_jump(m, stats)
    if m.action == ACT_JUMP_LAND or m.action == ACT_FREEFALL_LAND or m.action == ACT_DOUBLE_JUMP_LAND or m.action ==
        ACT_SIDE_FLIP_LAND or m.action == ACT_HOLD_JUMP_LAND or m.action == ACT_HOLD_FREEFALL_LAND or m.action ==
        ACT_QUICKSAND_JUMP_LAND or m.action == ACT_HOLD_QUICKSAND_JUMP_LAND or m.action == ACT_TRIPLE_JUMP_LAND or
        m.action == ACT_LONG_JUMP_LAND or m.action == ACT_BACKFLIP_LAND or m.action == ACT_WALKING then

        gPlayerSyncTable[m.playerIndex].inAirJump = stats.in_air_jump
        gPlayerSyncTable[m.playerIndex].yoshiFlutterReactivations = stats.yoshi_flutter_reactivations
    end
end

--- @param action integer
--- @return boolean
local function isKnockBack(action)
    return action == ACT_HARD_BACKWARD_GROUND_KB or action == ACT_HARD_FORWARD_GROUND_KB or action ==
               ACT_BACKWARD_GROUND_KB or action == ACT_FORWARD_GROUND_KB or action == ACT_SOFT_BACKWARD_GROUND_KB or
               action == ACT_SOFT_FORWARD_GROUND_KB or action == ACT_HARD_BACKWARD_AIR_KB or action ==
               ACT_HARD_FORWARD_AIR_KB or action == ACT_BACKWARD_AIR_KB or action == ACT_FORWARD_WATER_KB or action == ACT_BACKWARD_WATER_KB
end

--- @param m MarioState
--- @param stats CharacterStats
local function apply_knock_back_resistance(m, stats)
    if m.action == ACT_THROWN_BACKWARD or m.action == ACT_THROWN_FORWARD then
        m.forwardVel = m.forwardVel * (1 - stats.knockback_resistance)
    elseif isKnockBack(m.action) and
        not (isKnockBack(m.prevAction) or m.prevAction == ACT_THROWN_BACKWARD or m.prevAction == ACT_THROWN_FORWARD) then
        m.forwardVel = m.forwardVel * (1 - stats.knockback_resistance)
    end
end

--- @param m MarioState
local function on_set_action(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    if stats.disable_double_jump then
        m.doubleJumpTimer = 0
    end

    if m.action == ACT_GROUND_POUND_LAND then
        set_camera_pitch_shake(0x60 * stats.ground_pound_shake, 0xC, 0x8000);
    end

    if m.action == ACT_SPAWN_NO_SPIN_AIRBORNE or m.action == ACT_SPAWN_NO_SPIN_LANDING or m.action ==
        ACT_SPAWN_SPIN_AIRBORNE or m.action == ACT_SPAWN_SPIN_LANDING then
        gPlayerSyncTable[m.playerIndex].fart = stats.waft_fart_per_level
        gPlayerSyncTable[m.playerIndex].yoshiFlutterReactivations = stats.yoshi_flutter_reactivations
        gPlayerSyncTable[m.playerIndex].inAirJump = stats.in_air_jump
    end

    if stats.kick_dive_on and m.action == ACT_DIVE and m.prevAction ~= ACT_JUMP_KICK then
        resetVelocityToPrevAction(m)
        set_mario_action(m, ACT_JUMP_KICK, 0)
    end

    if stats.disable_double_jump and m.action == ACT_DOUBLE_JUMP then
        resetVelocityToPrevAction(m)
        set_mario_action(m, ACT_JUMP, 0)
    end

    if stats.disable_twirling_land and m.action == ACT_TWIRL_LAND then
        if (m.input & INPUT_NONZERO_ANALOG) ~= 0 then
            m.action = ACT_WALKING
        else
            m.action = ACT_IDLE
        end
    end

    apply_jump_speed(m, stats)
    apply_in_air_jump(m, stats)
    apply_knock_back_resistance(m, stats)


    if m.prevAction == ACT_CROUCHING and m.action == ACT_PUNCHING then
        set_mario_action(m,ACT_PEELOUT,0)
    end

    if stats.glide_dive_on and m.action == ACT_DIVE and  m.pos.y > (m.floorHeight + 10.0) and m.prevAction ~= ACT_GROUND_POUND then
        set_mario_action(m, ACT_GLIDE_DIVE, 0);
    end

    if m.prevAction == ACT_YOSHI_FLUTTER then
        audio_sample_stop(YOSHI_FLUTTER_AUDIO)
    end

end

hook_event(HOOK_ON_SET_MARIO_ACTION, on_set_action)
