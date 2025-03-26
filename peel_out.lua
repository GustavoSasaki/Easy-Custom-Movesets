local peeloutinput = U_JPAD
local peeloutrelease = audio_sample_load("peeloutrelease.mp3")
local peeloutcharge = audio_sample_load("peeloutcharge.ogg")

local ACT_PEELOUT = allocate_mario_action(ACT_GROUP_STATIONARY)

local gStateExtras = {}
for i = 0, (MAX_PLAYERS - 1) do
    gStateExtras[i] = {}
    local e = gStateExtras[i]
    e.animation = 0
    e.animSpeed = 1
end

function convert_s16(num)
    local min = -32768
    local max = 32767
    while (num < min) do
        num = max + (num - min)
    end
    while (num > max) do
        num = min + (num - max)
    end
    return num
end

--- @param m MarioState
local function spawn_terrain_particles(m)

    if (m.terrainSoundAddend == (SOUND_TERRAIN_WATER << 16)) then
        set_mario_particle_flags(m, PARTICLE_SHALLOW_WATER_SPLASH, 0);
    else
        if (m.terrainSoundAddend == (SOUND_TERRAIN_SAND << 16)) then
            set_mario_particle_flags(m, PARTICLE_DIRT, 0);
        elseif (m.terrainSoundAddend == (SOUND_TERRAIN_SNOW << 16)) then
            set_mario_particle_flags(m, PARTICLE_SNOW, 0);
        end
    end
end

--- @param m MarioState
--- @param stats CharacterStats
--- @param spinrev number
local function spawn_particles(m,stats,spinrev)
    if spinrev >= stats.peel_out_max_vel and m.actionTimer % 2 == 0 then
        spawn_terrain_particles(m)
    elseif spinrev >= stats.peel_out_max_vel/2 and spinrev < stats.peel_out_max_vel and m.actionTimer % 3 == 0 then
        spawn_terrain_particles(m)
    elseif spinrev >= stats.peel_out_max_vel/2 and (m.actionTimer % 5 < 4) then
        set_mario_particle_flags(m, PARTICLE_DUST, 0);
    end
end

--- @param m MarioState
--- @param Speed number
local function SetRunAnims(m, Speed)
    local e = gStateExtras[m.playerIndex]
    e.animSpeed = 0x10000

    if Speed < 50 and Speed > -50 then
        e.animation = CHAR_ANIM_RUNNING_UNUSED
    else
        e.animation = CHAR_ANIM_RUNNING
    end

end


--- @param m MarioState
local function act_peelout(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    local stepResult = perform_ground_step(m)
    local s = gPlayerSyncTable[m.playerIndex]
    local e = gStateExtras[m.playerIndex]
    if stepResult ~= GROUND_STEP_LEFT_GROUND then
        m.vel.y = 0
    else
        mario_set_forward_vel(m, m.forwardVel)
        s.lastPosX = m.pos.x
        s.lastPosZ = m.pos.z
        if (m.input & (INPUT_NONZERO_ANALOG)) ~= 0 then
            if analog_stick_held_back(m) ~= 0 then
                m.faceAngle.y = m.faceAngle.y + 0x8000
                m.forwardVel = -m.forwardVel
            elseif m.forwardVel < 10 then
                m.forwardVel = m.forwardVel + 1
            end
        end
    end

    if m.actionTimer == 0 then
        s.spinrev = 0
        s.lastPosX = m.pos.x
        s.lastPosZ = m.pos.z
        audio_sample_play(peeloutcharge, m.pos, 1)
    end
    if m.pos.y == m.floorHeight then
        play_step_sound(m, 9, 45)
        m.pos.x = s.lastPosX
        m.pos.z = s.lastPosZ
        m.marioObj.header.gfx.pos.x = s.lastPosX
        m.marioObj.header.gfx.pos.y = m.pos.y
        m.marioObj.header.gfx.pos.z = s.lastPosZ
        if m.controller.buttonPressed & peeloutinput ~= 0 then
            audio_sample_play(peeloutrelease, m.pos, 1)
            set_mario_action(m, ACT_WALKING, 0)
            mario_set_forward_vel(m, 100)
            m.forwardVel = s.spinrev
            prevForwardVel = s.spinrev
            set_camera_shake_from_hit(SHAKE_MED_DAMAGE)
            set_camera_shake_from_point(SHAKE_POS_MEDIUM, m.pos.x, m.pos.y, m.pos.z)
            m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
            s.spinrev = 10
        end
        if m.pos.y < m.waterLevel - 100 then
            local max_water_velocity = 0.625 * stats.peel_out_max_vel
            if s.spinrev > max_water_velocity then
                s.spinrev = max_water_velocity
            end
        end

        s.spinrev = math.min( s.spinrev + 5, stats.peel_out_max_vel)
        spawn_particles(m,stats,s.spinrev)
    end

    m.faceAngle.y = m.intendedYaw - approach_s32(convert_s16(m.intendedYaw - m.faceAngle.y), 0, 0x300, 0x300)
    set_mario_anim_with_accel(m, e.animation, s.spinrev / 5 * e.animSpeed)
    SetRunAnims(m, s.spinrev)
    m.actionTimer = m.actionTimer + 1
end
hook_mario_action(ACT_PEELOUT, act_peelout)

local prevForwardVel = 0
--- @param m MarioState
--- @param stats CharacterStats
local function update_walk_speed_without_max_cap(m,stats)
    local maxTargetSpeed = m.floor ~= nil and m.floor.type == SURFACE_SLOW and 24 or 32
    local targetSpeed = math.min(m.intendedMag, maxTargetSpeed)
    if m.quicksandDepth > 10.0 then
        targetSpeed = (targetSpeed * 6.25) / m.quicksandDepth
    end

    if m.forwardVel <= 0.0 then
        m.forwardVel = m.forwardVel + 1.1
    elseif m.forwardVel <= targetSpeed then
        m.forwardVel = m.forwardVel + 1.1 - m.forwardVel / 43;
    elseif m.floor ~= nil and m.floor.normal.y >= 0.95 then
        m.forwardVel = m.forwardVel - stats.peel_out_slowdown
    end

    apply_slope_accel(m);
end

local peelOutAfter = false
--- @param m MarioState
--- @param stats CharacterStats
local function update_peel_out_after(m,stats)
    if m.prevAction == ACT_PEELOUT then
        peelOutAfter = true
    end
    if peelOutAfter and m.action ~= ACT_WALKING and m.action ~= ACT_BRAKING then
        peelOutAfter = false

        if stats.peel_out_jump_reset_vel and (m.action == ACT_JUMP or m.action == ACT_DOUBLE_JUMP) then
            local forwardVel = m.forwardVel
            m.forwardVel = 32
            set_mario_action(m,m.action,0)
            m.forwardVel = math.max(forwardVel - (stats.peel_out_max_vel/8), 32)
        end
    end
end

--- @param m MarioState
--- @return boolean
local function should_start_dashing(m)
    if m.controller.buttonPressed & peeloutinput == 0 then
        return false
    end
    return (m.action & ACT_FLAG_IDLE ~= 0) or
               (m.action == ACT_BRAKING_STOP or m.action == ACT_BRAKING or m.action == ACT_DECELERATING) and
               m.controller.buttonPressed & peeloutinput ~= 0 and m.forwardVel < 16
end

--- @param m MarioState
function enter_peel_out_state(m)
    if m.playerIndex ~= 0 then
        return
    end
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    if should_start_dashing(m) then
        m.forwardVel = 0
        set_mario_action(m, ACT_PEELOUT, 0)
    end

    update_peel_out_after(m,stats)

    if peelOutAfter and m.action == ACT_WALKING and prevForwardVel > 48 then
        m.forwardVel = prevForwardVel
        update_walk_speed_without_max_cap(m,stats)
    end
    prevForwardVel = m.forwardVel

end

local function before_phys(m)
    if peelOutAfter and m.action == ACT_WALKING and prevForwardVel > 48 and m.playerIndex == 0 then
        mario_set_forward_vel(m, prevForwardVel)
    end
end
hook_event(HOOK_BEFORE_PHYS_STEP, before_phys)

