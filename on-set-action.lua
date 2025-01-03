--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_jump_speed(m, stats)
    -- the jump constants are set at https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/src/game/mario.c#L924
    if m.action == ACT_JUMP or m.action == ACT_HOLD_JUMP then
        m.vel.y = m.vel.y + stats.single_jump_strength
        return
    end
    if m.action == ACT_DOUBLE_JUMP then
        m.vel.y = m.vel.y + stats.double_jump_strength
        return
    end
    if m.action == ACT_TRIPLE_JUMP then
        m.vel.y = m.vel.y + stats.triple_jump_strength
        return
    end
    if m.action == ACT_BACKFLIP then
        m.vel.y = m.vel.y + stats.back_flip_strength
        return
    end

    if m.action == ACT_SIDE_FLIP then
        m.vel.y = m.vel.y + stats.side_flip_strength
        return
    end
    if m.action == ACT_LONG_JUMP then
        m.vel.y = m.vel.y + stats.long_jump_strength
        return
    end
    if m.action == ACT_JUMP_KICK then
        m.vel.y = m.vel.y + stats.kick_jump_strength
        return
    end
end

--- @param m gMarioStates
local function on_set_action(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.charStats.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end
    apply_jump_speed(m, stats)
end

hook_event(HOOK_ON_SET_MARIO_ACTION, on_set_action)