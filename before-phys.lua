--- @class CharacterStats
--- @field public name string
--- @field public swimming_speed number

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_swimming_speed(m,stats)
    if (m.action & ACT_FLAG_SWIMMING) == 0 then
        return
    end

    local hScale = 1.0
    local vScale = 1.0

    if (m.action & ACT_FLAG_SWIMMING) ~= 0 then
        hScale = hScale * stats.swimming_speed
        if m.action ~= ACT_WATER_PLUNGE then
            vScale = vScale * stats.swimming_speed
        end
    end

    m.vel.x = m.vel.x * hScale
    m.vel.y = m.vel.y * vScale
    m.vel.z = m.vel.z * hScale
end

--- @param m gMarioStates
local function mario_before_phys_step(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.charStats.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    apply_swimming_speed(m,stats)
end

hook_event(HOOK_BEFORE_PHYS_STEP, mario_before_phys_step)