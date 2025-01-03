
--- @param m gMarioStates
local function apply_gravity(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.charStats.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    m.vel.y =  m.vel.y - stats.gravity
end


hook_event(ACTION_HOOK_GRAVITY, apply_gravity)