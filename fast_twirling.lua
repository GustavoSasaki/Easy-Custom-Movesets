ACT_FAST_TWIRLING = allocate_mario_action(ACT_FLAG_AIR | ACT_GROUP_AIRBORNE | ACT_FLAG_ATTACKING | ACT_FLAG_SWIMMING_OR_FLYING | ACT_FLAG_ATTACKING)

function act_fast_twirling(m)

    local startTwirlYaw = m.twirlYaw
    local yawVelTarget = (m.input & INPUT_A_DOWN) ~= 0 and 0x2000 or 0x1800

    if (m.controller.buttonDown & Z_TRIG) == 0 then
        m.angleVel.y = approach_s32(m.angleVel.y, yawVelTarget, 0x200, 0x200);
        m.twirlYaw = m.twirlYaw + m.angleVel.y
        m.actionState = m.angleVel.y
    else
        m.angleVel.y = approach_s32(m.angleVel.y, yawVelTarget*3, 0x200*3, 0x200*3);
        m.twirlYaw = m.twirlYaw + m.angleVel.y
    end

    set_character_animation(m, m.actionArg == 0 and CHAR_ANIM_START_TWIRL or CHAR_ANIM_TWIRL)
    if is_anim_past_end(m) then
        m.actionArg = 1
    end
     if startTwirlYaw > m.twirlYaw then
         play_sound(SOUND_ACTION_TWIRL, m.marioObj.header.gfx.cameraToObject)
     end

    update_lava_boost_or_twirling(m)

    local stepResult = perform_air_step(m, 0)
    if stepResult == AIR_STEP_LANDED then

        set_mario_action(m, ACT_TWIRL_LAND, 0)
        if (m.controller.buttonDown & Z_TRIG) ~= 0 then
            play_mario_heavy_landing_sound(m, SOUND_ACTION_TERRAIN_HEAVY_LANDING);
            set_mario_particle_flags(m, (PARTICLE_MIST_CIRCLE | PARTICLE_HORIZONTAL_STAR), false);
            set_camera_shake_from_hit(SHAKE_GROUND_POUND)
        end
    elseif stepResult == AIR_STEP_HIT_WALL then
        mario_bonk_reflection(m, false)
    elseif stepResult == AIR_STEP_HIT_LAVA_WALL then
        lava_boost_on_wall(m)
    end

    m.marioObj.header.gfx.angle.y = m.marioObj.header.gfx.angle.y + m.twirlYaw;
end

hook_mario_action(ACT_FAST_TWIRLING, {
    every_frame = act_fast_twirling
}, INT_GROUND_POUND_OR_TWIRL)
