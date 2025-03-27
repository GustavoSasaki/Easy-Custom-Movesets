ACT_GLIDE_DIVE = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_DIVING | ACT_FLAG_ATTACKING |
                                           ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)

--- @param num integer
--- Limits an integer in the s16 range
function s16(num)
    num = math.floor(num) & 0xFFFF
    if num >= 32768 then
        return num - 65536
    end
    return num
end

--- @param m MarioState
local function act_glide_dive(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    if m.actionArg == 0 then
        m.vel.y = 0
        m.forwardVel = m.forwardVel * 0.8
        play_mario_sound(m, SOUND_ACTION_THROW, CHAR_SOUND_HOOHOO);
        set_character_animation(m,CHAR_ANIM_FORWARD_SPINNING);

        if m.actionTimer == 10 or stats.glide_dive_disable_spin then
            m.actionArg = 1
            m.forwardVel = stats.glide_dive_forward_vel
        end
    elseif m.actionArg == 1 then
        if m.forwardVel > 30 then
            m.forwardVel = m.forwardVel - stats.glide_dive_slowdown
        end
        m.vel.y = stats.glide_dive_y_vel
        play_mario_sound(m, SOUND_ACTION_TERRAIN_JUMP, 0);
        set_character_animation(m,stats.glide_dive_render_with_wing_cap and CHAR_ANIM_WING_CAP_FLY or CHAR_ANIM_DIVE);
    end

    m.actionTimer = m.actionTimer + 1


    if (mario_check_object_grab(m) == 1) then
        mario_grab_used_object(m);
        if (m.heldObj ~= nil) then
            m.marioBodyState.grabPos = GRAB_POS_LIGHT_OBJ;
            if (m.action ~= ACT_DIVE) then
                return 1;
            end
        end
    end

    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0);
    end

    update_air_without_turn(m);

    local airStep = perform_air_step(m, 0)
    if airStep == AIR_STEP_NONE then
        local angleSpeed = 0x800 * stats.glide_dive_angle_speed
        m.faceAngle.y = m.intendedYaw - approach_s32(s16(m.intendedYaw - m.faceAngle.y), 0, angleSpeed, angleSpeed)
        m.marioObj.header.gfx.angle.x = -m.faceAngle.x;

    elseif airStep == AIR_STEP_LANDED then
        set_mario_action(m, ACT_JUMP_LAND, 0);
        m.faceAngle.x = 0;

    elseif airStep == AIR_STEP_HIT_WALL and
        not (m.wall == nil and gServerSettings.bouncyLevelBounds ~= BOUNCY_LEVEL_BOUNDS_OFF) then
        mario_bonk_reflection(m, 1);
        m.faceAngle.x = 0;

        if (m.vel.y > 0) then
            m.vel.y = 0
        end

        set_mario_particle_flags(m, PARTICLE_VERTICAL_STAR, 0);
        drop_and_set_mario_action(m, ACT_BACKWARD_AIR_KB, 0);

    elseif airStep == AIR_STEP_HIT_LAVA_WALL then
        lava_boost_on_wall(m);
    end

    if m.actionTimer > stats.glide_dive_max_time then
        set_mario_action(m, ACT_FREEFALL, 0);
    end

    if m.forwardVel < stats.glide_dive_min_forward_speed and m.actionArg ~= 0 then
        set_mario_action(m, ACT_FREEFALL, 0);
    end
    return 0
end

hook_mario_action(ACT_GLIDE_DIVE, {
    every_frame = act_glide_dive
}, INT_SUBTYPE_GRABS_MARIO)
