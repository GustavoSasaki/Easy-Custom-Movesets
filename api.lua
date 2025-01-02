local table_insert = table.insert

local function getNotNil(value,valueType,defaultValue)
    if value ~= nil and type(value) == valueType then
        if type(value) == "number" then
            return value/100 -1.0
        end
        return value
    end
    return defaultValue
end

--- @param cs CharacterStats
local function clean_character_stats(cs) 
    cs['name'] = getNotNil(cs['name'], "string", "Untitled")
    cs['swimming_speed'] = getNotNil(cs['swimming_speed'], "number", 1.0)

    local allJumpsStrength = getNotNil(cs['jump_strength'], "number", 1.0)
    cs['single_jump_strength'] = getNotNil(cs['single_jump_strength'], "number", allJumpsStrength)
    cs['double_jump_strength'] = getNotNil(cs['double_jump_strength'], "number", allJumpsStrength)
    cs['triple_jump_strength'] = getNotNil(cs['triple_jump_strength'], "number", allJumpsStrength)
    cs['back_flip_strength'] = getNotNil(cs['back_flip_strength'], "number", allJumpsStrength)
    cs['side_flip_strength'] = getNotNil(cs['side_flip_strength'], "number", allJumpsStrength)
    cs['long_jump_strength'] = getNotNil(cs['long_jump_strength'], "number", allJumpsStrength)
    cs['kick_jump_strength'] = getNotNil(cs['kick_jump_strength'], "number", allJumpsStrength)
end


--- @class CharacterStats
--- @field public name string|nil (Default "Untitled")
--- @field public swimming_speed number|nuil (Default 100)

--- @param characterStats CharacterStats
local function character_add(characterStats)
    clean_character_stats(characterStats)
    table_insert(characterStatsTable, characterStats)
end


--- @param name string
--- @return CharacterStats|nil
local function stats_from_name(name)
    for i = 1, #characterStatsTable do
        if characterStatsTable[i].name == name then
            return characterStatsTable[i]
        end
    end
    return nil
end


hook_event(HOOK_UPDATE, function()
    gPlayerSyncTable[0].char_select_name = _G.charSelect.character_get_current_table().name
end)

_G.charStats = {
    character_add = character_add,
    stats_from_name = stats_from_name,
}