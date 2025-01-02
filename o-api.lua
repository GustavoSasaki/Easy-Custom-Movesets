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
    cs['gravity'] = getNotNil(cs['gravity'], "number", 1.0)

    local allJumpsStrength = getNotNil(cs['jump_strength'], "number", 1.0)
    cs['single_jump_strength'] = getNotNil(cs['single_jump_strength'], "number", allJumpsStrength)
    cs['double_jump_strength'] = getNotNil(cs['double_jump_strength'], "number", allJumpsStrength)
    cs['triple_jump_strength'] = getNotNil(cs['triple_jump_strength'], "number", allJumpsStrength)
    cs['back_flip_strength'] = getNotNil(cs['back_flip_strength'], "number", allJumpsStrength)
    cs['side_flip_strength'] = getNotNil(cs['side_flip_strength'], "number", allJumpsStrength)
    cs['long_jump_strength'] = getNotNil(cs['long_jump_strength'], "number", allJumpsStrength)
    cs['kick_jump_strength'] = getNotNil(cs['kick_jump_strength'], "number", allJumpsStrength)
end

characterStatsTable = {}
for _, character in ipairs(initialCharacterStatsTable) do
    clean_character_stats(character)
    table_insert(characterStatsTable,character)
end

--- @param characterStats CharacterStats
local function upsert_table(characterStats)
    for i = 1, #characterStatsTable do
        if characterStatsTable[i].name == characterStats.name then
            characterStatsTable[i] = characterStats
        end
    end
    table_insert(characterStatsTable, characterStats)
end

--- @class CharacterStats
--- @field public name string|nil (Default "Untitled")
--- @field public swimming_speed number|nil (Default 100)
--- @field public gravity number|nil (Default 100)
--- @field public jump_strength number|nil (Default 100)
--- @field public single_jump_strength number|nil (Default jump_strength)
--- @field public double_jump_strength number|nil (Default jump_strength)
--- @field public triple_jump_strength number|nil (Default jump_strength)
--- @field public back_flip_strength number|nil (Default jump_strength)
--- @field public side_flip_strength number|nil (Default jump_strength)
--- @field public long_jump_strength number|nil (Default jump_strength)
--- @field public kick_jump_strength number|nil (Default jump_strength)

--- @param characterStats CharacterStats
local function character_add(characterStats)
    clean_character_stats(characterStats)
    upsert_table(characterStats)
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