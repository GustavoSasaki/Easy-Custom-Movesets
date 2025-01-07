local ACT_AIRBORNE = 0x080 -- https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/include/sm64.h#L266

--- @param m gMarioStates
local function mario_update(m)
    if (m == nil) then
        return
    end
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.charStats.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
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
            m.forwardVel = m.forwardVel + (stats.airborne_deceleration_speed * 2 )
        end
    end
end


hook_event(HOOK_MARIO_UPDATE, mario_update)