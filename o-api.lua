local table_insert = table.insert

local function getNotNil(value, valueType, defaultValue)
    if value ~= nil and type(value) == valueType then
        if type(value) == "number" then
            return value / 100 - 1.0
        end
        return value
    end
    return defaultValue
end

--- @param cs CharacterStats
local function clean_character_stats(cs)
    cs['name'] = getNotNil(cs['name'], "string", "Untitled")
    cs['swimming_speed'] = getNotNil(cs['swimming_speed'], "number", 0.0) + 1

    cs['gravity'] = getNotNil(cs['gravity'], "number", 0.0)
    cs['fall_gravity'] = getNotNil(cs['fall_gravity'], "number", cs['gravity'])
    cs['explode_on_death'] = getNotNil(cs['explode_on_death'], "boolean", false)
    cs['airborne_deceleration_speed'] = getNotNil(cs['airborne_deceleration_speed'], "number", 0.0)

    -- the jump constants are set at https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/src/game/mario.c#L924
    local allJumpsStrength = getNotNil(cs['jump_strength'], "number", 0.0)
    cs['single_jump_strength'] = 42 * getNotNil(cs['single_jump_strength'], "number", allJumpsStrength)
    cs['double_jump_strength'] = 52 * getNotNil(cs['double_jump_strength'], "number", allJumpsStrength)
    cs['triple_jump_strength'] = 69 * getNotNil(cs['triple_jump_strength'], "number", allJumpsStrength)
    cs['back_flip_strength'] = 62 * getNotNil(cs['back_flip_strength'], "number", allJumpsStrength)
    cs['side_flip_strength'] = 62 * getNotNil(cs['side_flip_strength'], "number", allJumpsStrength)
    cs['long_jump_strength'] = 30 * getNotNil(cs['long_jump_strength'], "number", allJumpsStrength)
    cs['kick_jump_strength'] = 20 * getNotNil(cs['kick_jump_strength'], "number", allJumpsStrength)

    cs['dive_y_vel'] = cs['dive_y_vel'] ~= nil and type(cs['dive_y_vel']) == "number" and cs['dive_y_vel'] or 0
    cs['dive_velocity'] = 15 * getNotNil(cs['dive_velocity'], "number", 0)
    cs['dive_max_velocity'] = 48 * (getNotNil(cs['dive_max_velocity'], "number", 0.0) + 1)

    cs['long_jump_velocity_multiplier'] = 1.5 * getNotNil(cs['long_jump_velocity_multiplier'], "number", 0.0)
    cs['long_jump_max_velocity'] = 48 * (getNotNil(cs['long_jump_max_velocity'], "number", 0.0) + 1)

    cs['walking_speed'] = (getNotNil(cs['walking_speed'], "number", 0.0) + 1)
    cs['in_air_speed'] = (getNotNil(cs['in_air_speed'], "number", 0.0) + 1)
    cs['hold_walking_speed'] = (getNotNil(cs['hold_walking_speed'], "number", cs['walking_speed']) + 1)
    cs['crawling_speed'] = (getNotNil(cs['crawling_speed'], "number", cs['walking_speed']) + 1)
    cs['grounded_slowing_speed'] = (getNotNil(cs['grounded_slowing_speed'], "number", 0.0) + 1)

    cs['mr_l_jump_on'] = getNotNil(cs['mr_l_jump_on'], "boolean", false) 
    cs['mr_l_jump_strength'] = cs['mr_l_jump_strength'] ~= nil and type(cs['mr_l_jump_strength']) == "number" and cs['mr_l_jump_strength'] or 93
    cs['mr_l_gravity'] = getNotNil(cs['mr_l_gravity'], "number", 0.4)
    cs['mr_l_air_speed'] = getNotNil(cs['mr_l_air_speed'], "number", -0.4) + 1
    cs['play_mr_l_anticipation_audio'] = getNotNil(cs['play_mr_l_anticipation_audio'], "boolean", true) 

    cs.twirling_dive_on = getNotNil(cs.twirling_dive_on, "boolean", false) 
    cs.twirling_gravity = getNotNil(cs.twirling_gravity, "number", cs.gravity) 

    cs['back_flip_twirling_on'] = getNotNil(cs['back_flip_twirling_on'], "boolean", false) 
    cs['twirling_ground_pound_on'] = getNotNil(cs['twirling_ground_pound_on'], "boolean", false) 
end

characterStatsTable = {}
for _, character in ipairs(initialCharacterStatsTable) do
    clean_character_stats(character)
    table_insert(characterStatsTable, character)
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
--- @field public fall_gravity number|nil (Default gravity)
--- @field public explode_on_death bool|nil (Default false)
--- @field public airborne_deceleration_speed number|nil (Default 100)
--- @field public jump_strength number|nil (Default 100)
--- @field public single_jump_strength number|nil (Default jump_strength)
--- @field public double_jump_strength number|nil (Default jump_strength)
--- @field public triple_jump_strength number|nil (Default jump_strength)
--- @field public back_flip_strength number|nil (Default jump_strength)
--- @field public side_flip_strength number|nil (Default jump_strength)
--- @field public long_jump_strength number|nil (Default jump_strength)
--- @field public kick_jump_strength number|nil (Default jump_strength)
--- @field public dive_y_vel number|nil (Default 0)
--- @field public dive_velocity number|nil (Default 100)
--- @field public dive_max_velocity number|nil (Default 100)
--- @field public long_jump_velocity_multiplier number|nil (Default 100)
--- @field public long_jump_max_velocity number|nil (Default 100)
--- @field public walking_speed number|nil (Default 100)
--- @field public in_air_speed number|nil (Default 100)
--- @field public hold_walking_speed number|nil (Default walking_speed)
--- @field public crawling_speed number|nil (Default walking_speed)
--- @field public grounded_slowing_speed number|nil (Default 100)
--- @field public mr_l_jump_on bool|nil (Default false)
--- @field public mr_l_jump_strength number|nil (Default 93)
--- @field public mr_l_gravity number|nil (Default 140)
--- @field public mr_l_air_speed number|nil (Default 60)
--- @field public play_mr_l_anticipation_audio number|nil (Default true)
--- @field public back_flip_twirling_on bool|nil (Default false)
--- @field public twirling_ground_pound_on bool|nil (Default false)
--- @field public twirling_dive_on bool|nil (Default false)
--- @field public twirling_gravity number|nil (Default gravity)

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

_G.customMoves = {
    character_add = character_add,
    stats_from_name = stats_from_name
}
