ACT_SUPER_SIDE_FLIP = allocate_mario_action(ACT_FLAG_MOVING | ACT_FLAG_ALLOW_FIRST_PERSON)
ACT_SUPER_SIDE_FLIP_KICK =
    allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)

local function act_super_side_flip(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    m.actionTimer = m.actionTimer + 1
    if m.actionTimer % 3 == 2 then
        m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
    end
    set_mario_particle_flags(m, PARTICLE_DUST, false);

    m.actionTimer = m.actionTimer + 1
    m.peakHeight = m.pos.y

    play_mario_sound(m, SOUND_ACTION_TERRAIN_JUMP, 0);

    if (common_air_action_step(m, ACT_SIDE_FLIP_LAND, CHAR_ANIM_SLIDEFLIP, AIR_STEP_CHECK_LEDGE_GRAB) ~=
        AIR_STEP_GRABBED_LEDGE) then
        m.marioObj.header.gfx.angle.y = m.marioObj.header.gfx.angle.y + 0x8000;
    end

    if (m.marioObj.header.gfx.animInfo.animFrame == 6) then
        play_sound(SOUND_ACTION_SIDE_FLIP_UNK, m.marioObj.header.gfx.cameraToObject);
    end

    if (m.input & INPUT_B_PRESSED) ~= 0 then
        set_mario_action(m, ACT_SUPER_SIDE_FLIP_KICK, 0);
        m.vel.y = stats.super_side_flip_kick_strength * 20
        if stats.super_side_flip_kick_forward_vel then
            m.forwardVel = stats.super_side_flip_kick_forward_vel
        end
    end

end

local function act_super_side_flip_gravity(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    m.vel.y = m.vel.y - 4 * stats.super_side_flip_gravity

    if m.vel.y < (-75 * stats.super_side_flip_max_gravity) then
        m.vel.y = -75 * stats.super_side_flip_max_gravity
    end
end

hook_mario_action(ACT_SUPER_SIDE_FLIP, {
    every_frame = act_super_side_flip,
    gravity = act_super_side_flip_gravity
})

local function act_super_side_flip_kick(m)

    if (m.actionState == 0) then
        play_character_sound_if_no_flag(m, CHAR_SOUND_PUNCH_HOO, MARIO_ACTION_SOUND_PLAYED);
        m.marioObj.header.gfx.animInfo.animID = -1
        set_character_animation(m, CHAR_ANIM_AIR_KICK);
        m.actionState = 1;
    end

    local animFrame = m.marioObj.header.gfx.animInfo.animFrame;
    if (animFrame == 0) then
        m.marioBodyState.punchState = (2 << 6) | 6;
    end
    if (animFrame >= 0 and animFrame < 8) then
        m.flags = m.flags | MARIO_KICKING;
    end

    update_air_without_turn(m);

    local airStep = perform_air_step(m, 0)
    if (airStep == AIR_STEP_LANDED) then
        set_mario_action(m, ACT_FREEFALL_LAND, 0);
    elseif (airStep == AIR_STEP_HIT_WALL) then
        if (m.wall ~= nil or gServerSettings.bouncyLevelBounds == BOUNCY_LEVEL_BOUNDS_OFF) then
            mario_set_forward_vel(m, 0);
        end
    end
    m.peakHeight = m.pos.y
    m.actionTimer = m.actionTimer + 1
    return false
end

hook_mario_action(ACT_SUPER_SIDE_FLIP_KICK, {
    every_frame = act_super_side_flip_kick,
    gravity = act_super_side_flip_gravity
}, INT_KICK)
