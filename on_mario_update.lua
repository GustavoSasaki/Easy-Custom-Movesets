local ACT_AIRBORNE = 0x080 -- https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/include/sm64.h#L266


--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_burning_damage_multiplier(m, stats)
    if m.action ~= ACT_BURNING_GROUND and  m.action ~= ACT_BURNING_FALL and m.action ~= ACT_BURNING_JUMP then
        return
    end

    m.health = m.health - 10 * stats.burning_damage_multiplier

    if (m.health < 0x100) then
        if (m.playerIndex ~= 0) then
            --never kill remote marios
            m.health = 0x100;
        else
            m.health = 0xFF;
        end
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

    apply_burning_damage_multiplier(m,stats)
--  apply_lava_damage_multiplier(m,stats)

  gPlayerSyncTable[m.playerIndex].prevHurtCounter = m.hurtCounter

end

hook_event(HOOK_MARIO_UPDATE, mario_update)

-- local function isHurtCounterChanged(m)
--     if m.hurtCounter == 0 then
--         return false
--     end
--     return m.hurtCounter ~= (gPlayerSyncTable[m.playerIndex].prevHurtCounter - 1)
-- end
-- 
-- --- @param m gMarioStates
-- local function before_mario_update(m)
--     if (m == nil) then
--         return
--     end
--     if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
--         return
--     end
--     local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
--     if stats == nil then
--         return
--     end
-- 
--     if m.hurtCounter > gPlayerSyncTable[m.playerIndex].prevHurtCounter then
--         m.hurtCounter = m.hurtCounter + (m.hurtCounter - gPlayerSyncTable[m.playerIndex].prevHurtCounter)
--     end
--     gPlayerSyncTable[m.playerIndex].prevHurtCounter = m.hurtCounter
-- 
--     if m.hurtCounter == 1 and ((m.health - 128) % 8 == 0) then
--         m.health = m.health - 64
--     end
-- 
-- end
-- 
-- hook_event(HOOK_BEFORE_MARIO_UPDATE, before_mario_update)
