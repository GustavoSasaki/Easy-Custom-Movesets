--- @param m MarioState
local function isAboveWater(m)
    return m.pos.y >= (m.waterLevel - 140)
end

--- @param m MarioState
--- @param stats CharacterStats
local function apply_damage_multipliers(m, stats)
    if m.health < 0x100 then
        return
    end

    if m.hurtCounter ~= 0 or m.healCounter ~= 0 then
        return
    end

    local isIntangible = (m.action & ACT_FLAG_INTANGIBLE) ~= 0
    local isInPoisonGas = (m.input & INPUT_IN_POISON_GAS) ~= 0
    local isMetal = (m.flags & MARIO_METAL_CAP) ~= 0
    local isSwimming = (m.action & ACT_FLAG_SWIMMING) ~= 0
    local terrainIsSnow = (m.area.terrainType & TERRAIN_MASK) == TERRAIN_SNOW
    local isDebugMode = gDebugLevelSelect

    -- Poison Gas Damage
    if isInPoisonGas and not isIntangible and not isMetal and not isDebugMode then
        m.health = m.health - (4 * stats.bad_gas_damage_multiplier)
        return
    end

    -- Water Damage
    if isSwimming and not isIntangible then
        if isAboveWater(m) then
            -- Healing while above water
            if stats.disable_breath_heal then
                m.health = m.health - 0x1A
            elseif not terrainIsSnow or stats.snow_water_damage_multiplier <= 0 then
                m.health = m.health + 0x1A
            end
        elseif not isDebugMode then
            -- Damage while underwater
            local damageMultiplier = terrainIsSnow and (3 * stats.snow_water_damage_multiplier) or
                                         (1 * stats.water_damage_multiplier)
            m.health = m.health - damageMultiplier
        end
    end
end

--- @param m MarioState
--- @param stats CharacterStats
local function apply_lava_damage_multiplier(m, stats)

    if m.floor.type ~= SURFACE_BURNING then
        return
    elseif (m.action & ACT_GROUP_MASK) == ACT_GROUP_CUTSCENE then
        return
    elseif m.action == ACT_BUBBLED or m.action == ACT_FLAG_RIDING_SHELL then
        return
    elseif (m.flags & MARIO_METAL_CAP) ~= 0 then
        return
    elseif gDjuiInMainMenu then
        return
    elseif m.pos.y > (m.floorHeight + 10.0) then
        return
    end

    local damageAdded = (marioHasCap and 12 or 18) * stats.lava_damage_multiplier
    if damageAdded > 0 then
        m.hurtCounter = m.hurtCounter + damageAdded
    else
        m.healCounter = m.healCounter - damageAdded
    end
end

--- @param m MarioState
local function before_mario_update(m)
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

    apply_damage_multipliers(m, stats)
    apply_lava_damage_multiplier(m, stats)
    if stats.disable_damage then
        m.hurtCounter = 0
    end
end

hook_event(HOOK_BEFORE_MARIO_UPDATE, before_mario_update)