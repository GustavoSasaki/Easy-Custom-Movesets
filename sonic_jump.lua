ACT_SONIC_JUMP = allocate_mario_action(ACT_GROUP_AIRBORNE | ACT_FLAG_MOVING | ACT_FLAG_AIR | ACT_FLAG_CONTROL_JUMP_HEIGHT |
                                       ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_FLAG_SHORT_HITBOX | ACT_FLAG_ATTACKING)
local jumpsound = audio_sample_load("cdjump.ogg")
--- @param m MarioState
function sonic_jump(m)
    if (m.input & INPUT_Z_PRESSED) ~= 0 then
        return set_mario_action(m, ACT_GROUND_POUND, 0);
    end

    -- fix m.vel.x and m.vel.z not updating correctly
    mario_set_forward_vel(m,m.forwardVel)
    local step = perform_air_step(m, 0)
    if step == AIR_STEP_LANDED then
        set_mario_action(m, ACT_JUMP_LAND, 0);

    elseif step == AIR_STEP_HIT_WALL then
        if m.forwardVel > 16 then
            if gServerSettings.bouncyLevelBounds == BOUNCY_LEVEL_BOUNDS_OFF or m.wall ~= nil then
                queue_rumble_data_mario(m, 5, 40);
                mario_bonk_reflection(m, 0);
                m.faceAngle.y = m.faceAngle.y + 0x8000;
            end

            if (m.wall ~= nil) then
                set_mario_action(m, ACT_AIR_HIT_WALL, 0);
            else
                if m.vel.y > 0 then
                    m.vel.y = 0
                end

            end
        else
            mario_set_forward_vel(m, 0);
        end

    elseif step == AIR_STEP_GRABBED_LEDGE then
        set_character_animation(m, CHAR_ANIM_IDLE_ON_LEDGE);
        drop_and_set_mario_action(m, ACT_LEDGE_GRAB, 0);
        
    elseif step == AIR_STEP_GRABBED_CEILING then
        set_mario_action(m, ACT_START_HANGING, 0);

    elseif step == AIR_STEP_HIT_LAVA_WALL then
        lava_boost_on_wall(m);
    end
    m.actionTimer = m.actionTimer + 1
end

hook_mario_action(ACT_SONIC_JUMP, sonic_jump)


--- @param m MarioState
--- @param stats CharacterStats
function enter_sonic_jump(m,stats)
    if not stats.sonic_jump_on then return end
    
    set_mario_action(m,ACT_SONIC_JUMP,0)

    audio_sample_play(jumpsound, m.pos, 1)
    set_character_animation(m, CHAR_ANIM_A_POSE)
    smlua_anim_util_set_animation(m.marioObj, "JUMPBALL_METAL")

    m.vel.y = stats.sonic_jump_strength
    m.forwardVel = gPlayerSyncTable[m.playerIndex].prevForwardVel
    print(m.forwardVel)
    mario_set_forward_vel(m, math.min(m.forwardVel + stats.sonic_jump_add_forward_vel,160))
end