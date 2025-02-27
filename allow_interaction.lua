


--- @param m MarioState
--- @param interactee Object
--- @param interactType InteractionType
local function allow_interact(m, interactee, interactType)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return true
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return true
    end

    if stats.disable_burning and interactType == INTERACT_FLAME then
        return false
    end

    return true
end

hook_event(HOOK_ALLOW_INTERACT, allow_interact)
