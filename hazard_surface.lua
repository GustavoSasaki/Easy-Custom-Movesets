local marioHasCap = false;
local function apply_lava_damage(m, stats)
    if hazard_type ~= HAZARD_TYPE_LAVA_WALL then
        return
    elseif (m.flags & MARIO_METAL_CAP) ~= 0 then
        return
    end

    local damageAdded = (marioHasCap and 12 or 18) * stats.lava_damage_multiplier
    if damageAdded > 0 then
        m.hurtCounter = m.hurtCounter + damageAdded
    else
        m.healCounter = m.healCounter - damageAdded
    end
end

--- @param m gMarioStates
local function hazard_surface_interact(m, hazard_type)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return true
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return true
    end

    apply_lava_damage(m,stats)
    return true
end

hook_event(HOOK_ALLOW_HAZARD_SURFACE, hazard_surface_interact)
