--- @class CharacterStats
--- @field public name string
--- @field public swimming_speed number
--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_swimming_speed(m, stats)
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
local function getSlopeAddedVelocity(m)
    local floor = m.floor;

    if (floor == nil and mario_floor_is_slope(m) == false) then
        return 0
    end

    local steepness = math.sqrt(floor.normal.x * floor.normal.x + floor.normal.z * floor.normal.z);
    local floorDYaw = m.floorAngle - m.faceAngle.y;

    local slopeClass;
    local slopeAccel = 1.7;
    if m.action ~= ACT_SOFT_BACKWARD_GROUND_KB and m.action ~= ACT_SOFT_FORWARD_GROUND_KB then
        slopeClass = mario_get_floor_class(m)
    end

    if slopeClass == SURFACE_CLASS_VERY_SLIPPERY then
        slopeAccel = 5.3
    elseif slopeClass == SURFACE_CLASS_SLIPPERY then
        slopeAccel = 2.7
    elseif slopeClass == SURFACE_CLASS_NOT_SLIPPERY then
        slopeAccel = 0.0
    end

    return (floorDYaw > -0x4000 and floorDYaw < 0x4000) and (slopeAccel * steepness) or (-slopeAccel * steepness)
end

--- @param m gMarioStates
--- @param stats CharacterStats
local function getTargetSpeed(m, stats)
    local maxTargetSpeed = m.floor ~= nil and m.floor.type == SURFACE_SLOW and 24.0 or 32.0

    local targetSpeed = (m.intendedMag < maxTargetSpeed) and m.intendedMag or maxTargetSpeed
    if m.quicksandDepth > 10.0 then
        targetSpeed = targetSpeed * (6.25 / m.quicksandDepth)
    end

    --print(targetSpeed + targetSpeed * stats.target_speed)
    return targetSpeed + targetSpeed * stats.target_speed
end

--- @param m gMarioStates
--- @param stats CharacterStats
local function apply_ground_speed(m, stats)
    if (m.action ~= ACT_WALKING) then
        return
    end

    local slopeAddedForwardVel = getSlopeAddedVelocity(m)
    --print(slopeAddedForwardVel)
    local beforeSlopeForwardVel = m.forwardVel - slopeAddedForwardVel
    --print(beforeSlopeForwardVel)

    local targetSpeed = getTargetSpeed(m, stats)

    if beforeSlopeForwardVel <= 0.0 then
        m.forwardVel = beforeSlopeForwardVel + (1.1 * stats.ground_speed)
    elseif m.forwardVel <= targetSpeed then
        m.forwardVel = beforeSlopeForwardVel + ((1.1 - (beforeSlopeForwardVel / (43 * stats.speed_decay_factor))) * stats.ground_speed )
    elseif m.floor ~= nil and m.floor.normal.y >= 0.95 then
        m.forwardVel = beforeSlopeForwardVel - (1.0 * stats.ground_speed)
    end

    m.forwardVel = m.forwardVel + slopeAddedForwardVel
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

    apply_swimming_speed(m, stats)
    --print(m.forwardVel)
    apply_ground_speed(m, stats)
    --print(m.forwardVel)
   -- print("---------")
end

hook_event(HOOK_BEFORE_PHYS_STEP, mario_before_phys_step)