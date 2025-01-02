
--- @param m gMarioStates
local function apply_gravity(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.charStats.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    -- gravity magic number defined at https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/src/game/mario_step.c#L689
    m.vel.y =  m.vel.y - 4*stats.gravity
end


hook_event(ACTION_HOOK_GRAVITY, apply_gravity)