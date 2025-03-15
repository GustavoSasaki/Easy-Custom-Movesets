


--- @param m MarioState
--- @param interactee Object
--- @param interactType InteractionType
local function allow_interact(m, interactee, interactType)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return true
    end

    if stats.disable_burning and interactType == INTERACT_FLAME then
        return false
    end

    return true
end

hook_event(HOOK_ALLOW_INTERACT, allow_interact)
