local table_insert = table.insert

---@param name string
---@param swimming_speed number|nil (Default 1.0)
local function character_add(name, velocity,swimming_speed)
    table_insert(characterStatsTable, {
        name = type(name) == "string" and name or "Untitled",
        swimming_speed = type(swimming_speed) == "number" and swimming_speed or 1.0
    })
end

--- @class CharacterStats
--- @field public name string
--- @field public swimming_speed number

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