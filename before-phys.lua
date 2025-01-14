--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_swimming_speed(m, stats)
    if (m.action & ACT_FLAG_SWIMMING) == 0 then
        return
    end

    local hScale = 1.0
    local vScale = 1.0

    hScale = hScale * stats.swimming_speed
    if m.action ~= ACT_WATER_PLUNGE then
        vScale = vScale * stats.swimming_speed
    end

    m.vel.x = m.vel.x * hScale
    m.vel.y = m.vel.y * vScale
    m.vel.z = m.vel.z * hScale
end

--- @param m gMarioStates
local function isGroundedSlowing(m)
    return m.action == ACT_BRAKING or m.action == ACT_DECELERATING or m.action == ACT_HOLD_DECELERATING
end
--- @param m gMarioStates
local function isGrounded(m)
    return m.action == ACT_WALKING or m.action == ACT_HOLD_WALKING or m.action == ACT_HEAVY_HOLD_WALKING or m.action ==
               ACT_CRAWLING or m.action == ACT_FINISH_TURNING_AROUND or isGroundedSlowing(m)
end

--- @param m gMarioStates
local function isJumping(m)
    return
        m.action == ACT_JUMP or m.action == ACT_DOUBLE_JUMP or m.action == ACT_HOLD_JUMP or m.action == ACT_FREEFALL or
            m.action == ACT_SIDE_FLIP or m.action == ACT_WALL_KICK_AIR or m.action == ACT_TWIRLING or m.action ==
            ACT_WATER_JUMP or m.action == ACT_WATER_JUMP or m.action == ACT_HOLD_WATER_JUMP or m.action ==
            ACT_STEEP_JUMP or m.action == ACT_TRIPLE_JUMP or m.action == ACT_BACKFLIP or m.action == ACT_LONG_JUMP or
            m.action == ACT_RIDING_SHELL_JUMP or m.action == ACT_RIDING_SHELL_FALL or m.action == ACT_DIVE or m.action ==
            ACT_JUMP_KICK
end

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_walking_speed(m, stats)
    if isGrounded(m) == false and isJumping(m) == false then
        return
    end

    local hScale = stats.walking_speed
    if m.action == ACT_CRAWLING then
        hScale = stats.crawling_speed
    elseif m.action == ACT_HOLD_WALKING or m.action == ACT_HEAVY_HOLD_WALKING then
        hScale = stats.hold_walking_speed
    elseif isJumping(m) then
        hScale = stats.in_air_speed
    elseif isGroundedSlowing(m) then
        hScale = stats.grounded_slowing_speed
    end

    m.vel.x = m.vel.x * hScale
    m.vel.z = m.vel.z * hScale
end

--- @param m gMarioStates
local function mario_before_phys_step(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    apply_swimming_speed(m, stats)
    apply_walking_speed(m, stats)
end

hook_event(HOOK_BEFORE_PHYS_STEP, mario_before_phys_step)
