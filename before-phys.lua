--- @param m MarioState
--- @param stats CharacterStats
local function apply_swimming_speed(m, stats)
    if (m.action & ACT_FLAG_SWIMMING) == 0 or m.action == ACT_FORWARD_WATER_KB or m.action == ACT_BACKWARD_WATER_KB then
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

--- @param m MarioState
local function isGroundedSlowing(m)
    return m.action == ACT_BRAKING or m.action == ACT_DECELERATING or m.action == ACT_HOLD_DECELERATING
end
--- @param m MarioState
local function isGrounded(m)
    return m.action == ACT_WALKING or m.action == ACT_HOLD_WALKING or m.action == ACT_HEAVY_HOLD_WALKING or m.action ==
               ACT_CRAWLING or m.action == ACT_FINISH_TURNING_AROUND or isGroundedSlowing(m)
end

--- @param m MarioState
local function isJumping(m)
    return
        m.action == ACT_JUMP or m.action == ACT_DOUBLE_JUMP or m.action == ACT_HOLD_JUMP or m.action == ACT_FREEFALL or
            m.action == ACT_SIDE_FLIP or m.action == ACT_WALL_KICK_AIR or m.action == ACT_TWIRLING or m.action ==
            ACT_FAST_TWIRLING or m.action == ACT_STEEP_JUMP or m.action == ACT_TRIPLE_JUMP or m.action == ACT_BACKFLIP or
            m.action == ACT_LONG_JUMP or m.action == ACT_RIDING_SHELL_JUMP or m.action == ACT_RIDING_SHELL_FALL or
            m.action == ACT_DIVE or m.action == ACT_JUMP_KICK or m.action == ACT_WAFT_FART or m.action == ACT_SUPER_SIDE_FLIP or m.action == ACT_SUPER_SIDE_FLIP_KICK
            or m.action == ACT_YOSHI_FLUTTER or m.action == ACT_GLIDE_DIVE
end

--- @param m MarioState
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
    elseif m.action == ACT_TWIRLING or m.action == ACT_FAST_TWIRLING then
        hScale = stats.twirling_speed
    elseif m.action == ACT_YOSHI_FLUTTER and m.actionArg == 1 then
        hScale = stats.yoshi_flutter_speed
    elseif isJumping(m) then
        hScale = stats.in_air_speed
    elseif isGroundedSlowing(m) then
        hScale = stats.grounded_slowing_speed
    end

    if m.vel.x < 200 and m.vel.x > -200 then
        m.vel.x = m.vel.x * hScale
    end
    if m.vel.z < 200 and m.vel.z > -200 then
        m.vel.z = m.vel.z * hScale
    end
end

--- @param m MarioState
--- @param stats CharacterStats
local function apply_ground_pound_cap_velocity(m, stats)
    if m.action ~= ACT_GROUND_POUND then
        return
    end

    if m.vel.y <= -75 then
        m.vel.y = gPlayerSyncTable[m.playerIndex].prevYvel
        -- re-applying gravity
        m.vel.y = m.vel.y - 4 * (1 + stats.ground_pound_gravity)
    end

    if m.vel.y < -stats.ground_pound_max_y_vel then
        m.vel.y = -stats.ground_pound_max_y_vel
    end
end

--- @param m MarioState
local function mario_before_phys_step(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    apply_swimming_speed(m, stats)
    apply_walking_speed(m, stats)
    apply_ground_pound_cap_velocity(m, stats)

    gPlayerSyncTable[m.playerIndex].prevYvel = m.vel.y
end

hook_event(HOOK_BEFORE_PHYS_STEP, mario_before_phys_step)
