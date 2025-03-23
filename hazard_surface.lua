local marioHasCap = false;

--- @param m MarioState
--- @param stats CharacterStats
--- @param hazard_type number
local function apply_lava_damage(m, stats, hazard_type)
    if hazard_type ~= HAZARD_TYPE_LAVA_WALL then
        return
    elseif (m.flags & MARIO_METAL_CAP) ~= 0 then
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
--- @param hazard_type number
local function ignore_quicksand(m, hazard_type)
    if hazard_type == HAZARD_TYPE_QUICKSAND and
        (m.action == ACT_WAFT_FART or m.action == ACT_FAST_TWIRLING or m.action == ACT_GLIDE_DIVE or m.action ==
            ACT_GROUND_POUND_JUMP or m.action == ACT_IN_AIR_JUMP or m.action == ACT_MR_L_JUMP or m.action ==
            ACT_MR_L_FALL or m.action == ACT_SUPER_SIDE_FLIP or m.action == ACT_SUPER_SIDE_FLIP_KICK or m.action ==
            ACT_WALL_SLIDE or m.action == ACT_YOSHI_FLUTTER or m.action == ACT_SONIC_JUMP) then
        m.quicksandDepth = 0
        return true
    end

    return false
end

--- @param m MarioState
--- @param hazard_type number
local function hazard_surface_interact(m, hazard_type)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return true
    end

    apply_lava_damage(m, stats, hazard_type)
    if ignore_quicksand(m, hazard_type) then 
        return false
    end
    return true
end

hook_event(HOOK_ALLOW_HAZARD_SURFACE, hazard_surface_interact)
