ACT_IN_AIR_JUMP = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_CONTROL_JUMP_HEIGHT)

local function act_in_air_jump(m)
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

    local sound = stats.in_air_jump_sound
    if type(stats.in_air_jump_sound) ~= "number" then
        sound = stats.in_air_jump_sound[stats.in_air_jump - gPlayerSyncTable[m.playerIndex].inAirJump]
    end
    play_mario_sound(m, SOUND_ACTION_TERRAIN_JUMP,sound)
    
    local animation = stats.in_air_jump_animation 
    if type(stats.in_air_jump_animation) ~= "number" then
        animation = stats.in_air_jump_animation[stats.in_air_jump - gPlayerSyncTable[m.playerIndex].inAirJump]
    end
    if stats.in_air_jump_animation == CHAR_ANIM_DOUBLE_JUMP_RISE and m.vel.y < 0 then
        animation = CHAR_ANIM_DOUBLE_JUMP_FALL
    end

    common_air_action_step(m, ACT_JUMP_LAND, animation, AIR_STEP_CHECK_LEDGE_GRAB | AIR_STEP_CHECK_HANG)
end

hook_mario_action(ACT_IN_AIR_JUMP, {
    every_frame = act_in_air_jump
})
