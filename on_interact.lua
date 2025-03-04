--- @param m MarioState
--- @param stats CharacterStats
--- @param coin Object
--- @param interactType InteractionType
local function apply_interact_coin(m, stats, coin, interactType)
    if interactType ~= INTERACT_COIN then
        return
    end

    local healAdded = coin.oDamageOrCoinValue * stats.coin_heal_multiplier * 3
    if healAdded > 0 then
        m.healCounter = m.healCounter + healAdded
    else
        m.hurtCounter = m.hurtCounter - healAdded
    end
end

--- @param m MarioState
--- @param interactee Object
--- @param interactType InteractionType
local function blau(m, interactee, interactType, interactValue)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end
    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end
    
    apply_interact_coin(m, stats, interactee, interactType)
end
hook_event(HOOK_ON_INTERACT, blau)
