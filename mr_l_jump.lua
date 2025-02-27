ACT_MR_L_JUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_ATTACKING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION |
                                          AIR_STEP_NONE)

ACT_MR_L_FALL = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | AIR_STEP_NONE)

MR_L_ANTICIPATION_AUDIO = audio_sample_load('MR_L_anticipation.mp3')
MR_L_JUMP_AUDIO = audio_sample_load('MR_L_jump.mp3')


--- @param m MarioState
function act_mr_l_jump(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    m.actionTimer = m.actionTimer + 1
    if m.actionTimer % 3 ~= 2 then
        m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
    end
    
    if m.actionTimer == 5 then
        audio_sample_play(MR_L_JUMP_AUDIO, m.pos, 0.5)
    end
    if m.actionTimer == 11 then
        play_mario_sound(m, SOUND_ACTION_TERRAIN_JUMP, CHAR_SOUND_YAHOO);
    end

    m.intendedMag = m.intendedMag * stats.mr_l_air_speed;
    common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_SINGLE_JUMP, AIR_STEP_NONE);

    if m.vel.y < 0 then
        set_mario_action(m, ACT_MR_L_FALL, 0)
    end
end

--- @param m MarioState
function act_mr_l_fall(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    m.intendedMag = m.intendedMag * stats.mr_l_air_speed;
    common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_GENERAL_FALL, AIR_STEP_NONE);
end

hook_mario_action(ACT_MR_L_JUMP, {
    every_frame = act_mr_l_jump
})

hook_mario_action(ACT_MR_L_FALL, {
    every_frame = act_mr_l_fall
})
