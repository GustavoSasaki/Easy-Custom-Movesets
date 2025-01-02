local table_insert = table.insert

local function getNotNil(value,valueType,defaultValue)
    if value ~= nil and type(value) == valueType then
        if type(value) == "number" then
            return value/100
        end
        return value
    end
    return defaultValue
end

--- @param cs CharacterStats
local function clean_character_stats(cs) 
    cs['name'] = getNotNil(cs['name'], "string", "Untitled")
    cs['swimming_speed'] = getNotNil(cs['swimming_speed'], "number", 1.0)
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