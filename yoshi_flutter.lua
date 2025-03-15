ACT_YOSHI_FLUTTER = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION |
                                              ACT_FLAG_CONTROL_JUMP_HEIGHT)
YOSHI_FLUTTER_AUDIO = audio_sample_load('yoshi_flutter.mp3')

local DESCENDING = 0
local FLUTTERING = 1
local NEEDS_RELEASE_A_BUTTON = 2

--- @param m MarioState
--- @param stats CharacterStats
function resetYoshiFlutterCooldown(m, stats)
    gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown = stats.yoshi_flutter_cooldown
end

--- @param num integer
--- Limits an integer in the s16 range
local function s16(num)
    num = math.floor(num) & 0xFFFF
    if num >= 32768 then
        return num - 65536
    end
    return num
end

--- @param m MarioState
--- @return number
local function get_new_head_angle(m)
    local prevHeadAngle = m.marioObj.header.gfx.angle.x
    local targetHeadAngle = m.actionArg == 1 and 6000 or 0
    return approach_f32(prevHeadAngle, targetHeadAngle, 500, 500)
end

--- @param m MarioState
--- @return number
local function get_new_accel(m)
    local prevAccel = m.marioObj.header.gfx.animInfo.animAccel
    local targetAccel = m.actionArg == 1 and (0x10000 * 9) or 0x10000
    return approach_f32(prevAccel, targetAccel, 0x10000, 0x10000)
end

--- @param m MarioState
local function set_particles(m)
    m.actionTimer = m.actionTimer + 1
    if m.actionArg == 1 then
        if m.vel.y > 0 and m.actionTimer % 4 == 0 then
            set_mario_particle_flags(m, PARTICLE_DUST, 0);
        end
    end
end
--- @param m MarioState
--- @param stats CharacterStats
local function action_step(m, stats)
    update_air_without_turn(m);
    local accel = get_new_accel(m)

    local airStep = perform_air_step(m, AIR_STEP_CHECK_LEDGE_GRAB | AIR_STEP_CHECK_HANG)
    if airStep == AIR_STEP_NONE then
        local animation = m.actionArg == 1 and stats.yoshi_flutter_animation or CHAR_ANIM_DOUBLE_JUMP_FALL
        set_character_anim_with_accel(m, animation, accel);
        local angleSpeed = 0x800 * stats.yoshi_flutter_angle_speed
        m.faceAngle.y = m.intendedYaw - approach_s32(s16(m.intendedYaw - m.faceAngle.y), 0, angleSpeed, angleSpeed)

    elseif airStep == AIR_STEP_LANDED then
        resetYoshiFlutterCooldown(m, stats)
        set_mario_action(m, ACT_JUMP_LAND, 0);
        m.faceAngle.x = 0;

    elseif airStep == AIR_STEP_HIT_WALL then
        resetYoshiFlutterCooldown(m, stats)

        if (m.forwardVel > 16) then
            queue_rumble_data_mario(m, 5, 40);
            mario_bonk_reflection(m, 0);
            m.faceAngle.y = m.faceAngle.y + 0x8000;
        end

        if (m.wall ~= nil) then
            set_mario_action(m, ACT_AIR_HIT_WALL, 0);
        end
        if (m.vel.y > 0) then
            m.vel.y = 0
        end

    elseif airStep == AIR_STEP_HIT_LAVA_WALL then
        resetYoshiFlutterCooldown(m, stats)
        lava_boost_on_wall(m);

    elseif airStep == AIR_STEP_GRABBED_LEDGE then
        resetYoshiFlutterCooldown(m, stats)
        set_character_animation(m, CHAR_ANIM_IDLE_ON_LEDGE);
        drop_and_set_mario_action(m, ACT_LEDGE_GRAB, 0);

    elseif airStep == AIR_STEP_GRABBED_CEILING then
        resetYoshiFlutterCooldown(m, stats)
        set_mario_action(m, ACT_START_HANGING, 0);
    end

end

--- @param m MarioState
--- @param stats CharacterStats
--- @return boolean
local function isStartFluterring(m, stats)
    return gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown >= stats.yoshi_flutter_cooldown and
               gPlayerSyncTable[m.playerIndex].yoshiFlutterReactivations > 0 and (m.controller.buttonDown & A_BUTTON) ~= 0 and
               m.actionArg == DESCENDING and m.vel.y < 0 and (m.pos.y - m.floorHeight) > 10
end

--- @param m MarioState
--- @param stats CharacterStats
local function set_vel_y(m, stats)

    if isStartFluterring(m, stats) then
        m.actionArg = FLUTTERING
        m.actionTimer = 0
        gPlayerSyncTable[m.playerIndex].yoshiFlutterReactivations  = gPlayerSyncTable[m.playerIndex].yoshiFlutterReactivations  -1
        gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown = stats.yoshi_flutter_cooldown / 2
    end

    if (m.controller.buttonDown & A_BUTTON) ~= 0 and m.actionArg == FLUTTERING then
        if m.vel.y < 0 then
            m.vel.y = m.vel.y + stats.yoshi_flutter_stength_descending
        else
            m.vel.y = m.vel.y + stats.yoshi_flutter_stength_ascending
        end
        gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown = math.max(
            gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown - 2, 0)
        if m.vel.y > stats.yoshi_flutter_max_y_vel then
            m.vel.y = stats.yoshi_flutter_max_y_vel
            m.actionArg = NEEDS_RELEASE_A_BUTTON
            audio_sample_stop(YOSHI_FLUTTER_AUDIO)
            gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown = 0
        end
    end

    if (m.controller.buttonDown & A_BUTTON) == 0 then
        audio_sample_stop(YOSHI_FLUTTER_AUDIO)
        m.actionArg = DESCENDING
    end

    gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown = math.min(
        gPlayerSyncTable[m.playerIndex].yoshiFlutterCooldown + 1, 100)
end

--- @param m MarioState
local function act_yoshi_flutter(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    if check_kick_or_dive_in_air(m) ~= 0 then
        return true
    end

    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0)
    end

    if isStartFluterring(m, stats) then
        audio_sample_play(YOSHI_FLUTTER_AUDIO, m.pos, 1)
    end

    m.marioObj.header.gfx.angle.x = get_new_head_angle(m)
    action_step(m, stats)

    set_vel_y(m, stats)
    if m.forwardVel > 30 then
        m.forwardVel = m.forwardVel - 1
    end
    set_particles(m)

end

hook_mario_action(ACT_YOSHI_FLUTTER, {
    every_frame = act_yoshi_flutter
})

