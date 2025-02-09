
ACT_GROUND_POUND_JUMP = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_CONTROL_JUMP_HEIGHT)

function act_ground_pound_jump(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    if m.vel.y >= -4  and m.actionTimer % 2 == 0 then
        set_mario_particle_flags(m, PARTICLE_DUST, false);
    end


    play_mario_sound(m, SOUND_ACTION_TERRAIN_HEAVY_LANDING, CHAR_SOUND_YAH_WAH_HOO);
    common_air_action_step(m, ACT_BACKFLIP_LAND, CHAR_ANIM_SINGLE_JUMP, 0);

    if (m.action == ACT_BACKFLIP_LAND) then
        queue_rumble_data_mario(m, 5, 40);
    end

    if stats.ground_pound_jump_dive_on and (m.input & INPUT_B_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_DIVE, 0);
    end

    m.actionTimer = m.actionTimer + 1
end

hook_mario_action(ACT_GROUND_POUND_JUMP, {
    every_frame = act_ground_pound_jump
})
