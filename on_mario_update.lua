local ACT_AIRBORNE = 0x080 -- https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/include/sm64.h#L266

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_burning_damage_multiplier(m, stats)
    if m.action ~= ACT_BURNING_GROUND and m.action ~= ACT_BURNING_FALL and m.action ~= ACT_BURNING_JUMP then
        return
    end

    m.health = m.health - 10 * stats.burning_damage_multiplier

    if (m.health < 0x100) then
        if (m.playerIndex ~= 0) then
            -- never kill remote marios
            m.health = 0x100;
        else
            m.health = 0xFF;
        end
    end
end

--- @param m gMarioStates
--- @param stats CharacterStats
local function skip_action_timer_in_ground_pound(m, stats)
    if stats.ground_pound_antecipation_speed_up == "immediately" then
        m.actionTimer = 10
    elseif stats.ground_pound_antecipation_speed_up == "fast" then
        m.actionTimer = m.actionTimer + 4
    elseif stats.ground_pound_antecipation_speed_up == "medium" then
        m.actionTimer = m.actionTimer + 1
    elseif stats.ground_pound_antecipation_speed_up == "small" then
        if m.actionTimer == 2 or m.actionTimer == 6 then
            m.actionTimer = m.actionTimer + 1
        end
    end
end

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_ground_pound_stats(m, stats)
    if m.action ~= ACT_GROUND_POUND then
        return
    end

    if m.actionTimer < 10 then
        skip_action_timer_in_ground_pound(m, stats)
    end

    if stats.ground_pound_dive_on and m.action == ACT_GROUND_POUND and m.actionTimer >= 6 and
        (m.input & INPUT_B_PRESSED) ~= 0 then
        m.vel.y = stats.ground_pound_dive_y_vel
        m.forwardVel = stats.ground_pound_dive_forward_vel
        set_mario_action(m, ACT_DIVE, 0)
    end
end

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_mr_l(m, stats)
    if stats.mr_l_jump_on == false then
        return
    end

    if m.action == ACT_CROUCHING then
        if m.actionTimer == 7 then
            if stats.play_mr_l_anticipation_audio then
                audio_sample_play(MR_L_ANTICIPATION_AUDIO, m.pos, 0.5)
            end
        end
        m.actionTimer = m.actionTimer + 1
        if m.actionTimer > 4 then
            m.bounceSquishTimer = math.floor(m.actionTimer / 1.3)
        end
    end

    if m.prevAction == ACT_CROUCHING then
        if m.bounceSquishTimer > 16 and (m.action == ACT_STOP_CROUCHING or m.action == ACT_START_CRAWLING) then
            set_mario_action(m, ACT_MR_L_JUMP, 0)
        else
            audio_sample_stop(MR_L_ANTICIPATION_AUDIO)
            m.actionTimer = 0
            m.bounceSquishTimer = 0
        end
    end
end

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_saultube_animation(m, stats)
    if _G.jumpingAnimExists == false then
        return
    end

    if stats.saultube_single_jump_animation and m.action == ACT_JUMP then
        _G.jumpingAnim.change_single_jump_animation(m)
    elseif stats.saultube_double_jump_animation and m.action == ACT_DOUBLE_JUMP then
        _G.jumpingAnim.change_double_jump_animation(m)
    elseif stats.saultube_triple_jump_animation and m.action == ACT_TRIPLE_JUMP then
        _G.jumpingAnim.change_triple_jump_animation(m)
    end

end

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_long_jump_triple_jump(m, stats)
    local isLongJumpLand = (m.action == ACT_LONG_JUMP_LAND or m.action == ACT_LONG_JUMP_LAND_STOP or m.action ==
                               ACT_WALKING)
    if stats.long_jump_triple_jump_on and isLongJumpLand and (m.controller.buttonDown & A_BUTTON) ~= 0 and
        (m.input & INPUT_Z_PRESSED) == 0 and gPlayerSyncTable[m.playerIndex].longJumpTimer < 10 and m.forwardVel >= 40.0 then
        set_mario_action(m, ACT_TRIPLE_JUMP, 0);
        m.vel.y = (stats.long_jump_triple_jump_strength + 1) * 69
        if (stats.long_jump_triple_jump_forward_vel) then
            m.forwardVel = stats.long_jump_triple_jump_forward_vel
        end
        m.forwardVel = m.forwardVel + stats.long_jump_triple_jump_add_forward_vel
    end
end

--- @param m gMarioStates
local function mario_update(m)
    if (m == nil) then
        return
    end
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    if (m.action & ACT_AIRBORNE) ~= 0 then
        m.forwardVel = approach_f32(m.forwardVel, 0, 0.35 * stats.airborne_deceleration_speed,
            0.35 * stats.airborne_deceleration_speed)

        local dragThreshold = m.action and ACT_LONG_JUMP and stats.long_jump_max_velocity or 32;
        if (m.forwardVel > dragThreshold) then
            m.forwardVel = m.forwardVel - stats.airborne_deceleration_speed
        end
        if (m.forwardVel < -16.0) then
            m.forwardVel = m.forwardVel + (stats.airborne_deceleration_speed * 2)
        end
    end

    if stats.back_flip_twirling_on and m.action == ACT_BACKFLIP and m.vel.y < 8 then
        set_mario_action(m, ACT_TWIRLING, 0)
    end

    if stats.twirling_ground_pound_on and m.action == ACT_TWIRLING and (m.input & INPUT_Z_PRESSED) ~= 0 then
        set_mario_action(m, ACT_GROUND_POUND, 0)
    end

    if stats.twirling_dive_on and (m.action == ACT_TWIRLING or m.action == ACT_FAST_TWIRLING) and
        (m.input & INPUT_B_PRESSED) ~= 0 then
        set_mario_action(m, ACT_DIVE, 0)
    end

    apply_mr_l(m, stats)

    if m.action == ACT_TRIPLE_JUMP and stats.triple_jump_twirling_on then
        if stats.triple_jump_twirling_when == "start" then
            set_mario_action(m, ACT_TWIRLING, 0)
        elseif stats.triple_jump_twirling_when == "fall" and m.vel.y < 4 then
            set_mario_action(m, ACT_TWIRLING, 0)
        end
    end

    if m.action == ACT_SIDE_FLIP and stats.side_flip_twirling_on and m.vel.y < 4 then
        set_mario_action(m, ACT_TWIRLING, 0)
    end

    if m.action == ACT_TWIRLING and stats.fast_twirling_on then
        set_mario_action(m, ACT_FAST_TWIRLING, 0)
    end

    if stats.waft_fart_on and m.action == ACT_GROUND_POUND and (m.input & INPUT_Z_PRESSED) ~= 0 and
        gPlayerSyncTable[m.playerIndex].fart > 0 and m.actionTimer > 6 then
        m.forwardVel = stats.waft_fart_velocity
        set_camera_pitch_shake(0x60, 0x3, 0x8000);
        set_camera_roll_shake(0x30, 0x3, 0x8000);
        set_mario_action(m, ACT_WAFT_FART, 0)
    end

    if stats.ground_pound_jump_on and (m.controller.buttonDown & A_BUTTON) ~= 0 and
        (m.action == ACT_GROUND_POUND_LAND or
            (m.prevAction == ACT_GROUND_POUND_LAND and m.action == ACT_BUTT_SLIDE_STOP)) then
        set_mario_action(m, ACT_GROUND_POUND_JUMP, 0)
        m.vel.y = stats.ground_pound_jump_strength
        m.forwardVel = stats.ground_pound_forward_vel
    end

    apply_burning_damage_multiplier(m, stats)
    apply_ground_pound_stats(m, stats)
    apply_saultube_animation(m, stats)

    if (m.action == ACT_LONG_JUMP_LAND) then
        gPlayerSyncTable[m.playerIndex].longJumpTimer = 0
    end

    apply_long_jump_triple_jump(m, stats)

    if (gPlayerSyncTable[m.playerIndex].longJumpTimer < 100) then
        gPlayerSyncTable[m.playerIndex].longJumpTimer = gPlayerSyncTable[m.playerIndex].longJumpTimer + 1
    end

    gPlayerSyncTable[m.playerIndex].prevHurtCounter = m.hurtCounter
    local isLongJumpLand = (m.action == ACT_LONG_JUMP_LAND or m.action == ACT_LONG_JUMP_LAND_STOP or m.action ==
                               ACT_WALKING or m.action == ACT_TURNING_AROUNG)

    if stats.super_side_flip_on and analog_stick_held_back(m) == 1 and isLongJumpLand and (m.controller.buttonDown & A_BUTTON) ~= 0 
    and gPlayerSyncTable[m.playerIndex].longJumpTimer < 20  and gPlayerSyncTable[m.playerIndex].longJumpLandSpeed > stats.super_side_flip_min_velocity then
        set_mario_action(m, ACT_SUPER_SIDE_FLIP, 0);
        m.vel.y = stats.super_side_flip_strength
        m.forwardVel = - (m.forwardVel * stats.super_side_flip_convert_foward_vel + stats.super_side_flip_add_foward_vel)
    end

end

hook_event(HOOK_MARIO_UPDATE, mario_update)
