ACT_WAFT_FART = allocate_mario_action(AIR_STEP_NONE | ACT_GROUP_AIRBORNE | ACT_FLAG_AIR |
                                          ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)
WAFT_FART_AUDIO = audio_sample_load('waft_fart.mp3')

function act_waft_fart(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    if m.actionTimer < 16 and m.actionTimer % 4 <= 1 then
        set_mario_particle_flags(m, PARTICLE_MIST_CIRCLE, false);
        queue_rumble_data_mario(m, 10, 80);
    end

    if m.actionTimer < 64  then
        set_mario_particle_flags(m, PARTICLE_DUST, false);
    end
    if m.actionTimer == 5 then
        audio_sample_play(WAFT_FART_AUDIO, m.pos, 1)
    end
    if m.actionTimer == 8 then
        play_character_sound_if_no_flag(m, CHAR_SOUND_ON_FIRE, MARIO_MARIO_SOUND_PLAYED);
    end

    m.actionTimer = m.actionTimer + 1
    m.peakHeight = m.pos.y

    if (m.input & INPUT_B_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_DIVE, 0);
    end

    common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_FIRE_LAVA_BURN, AIR_STEP_NONE);

end

hook_mario_action(ACT_WAFT_FART, {
    every_frame = act_waft_fart
})
