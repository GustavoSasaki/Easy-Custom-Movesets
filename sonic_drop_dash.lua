ACT_DROP_DASH = allocate_mario_action(ACT_FLAG_AIR | ACT_GROUP_MOVING | ACT_FLAG_MOVING | ACT_FLAG_ATTACKING |
                                          ACT_FLAG_INVULNERABLE | ACT_FLAG_RIDING_SHELL)
local drop_dash_sound = audio_sample_load("dropdash.ogg")
--- @param m MarioState
function act_drop_dash(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    update_sonic_slide_animation(m)
    update_air_without_turn(m);

    local step = perform_air_step(m, 0)
    if step == AIR_STEP_LANDED then
        set_mario_action(m, ACT_SONIC_DASH_CHARGE, stats.drop_dash_charge_vel);
    elseif step == AIR_STEP_HIT_WALL then
        set_mario_action(m, ACT_BACKWARD_GROUND_KB, 1)
        m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
        play_sound(SOUND_ACTION_HIT, m.marioObj.header.gfx.cameraToObject)
    elseif step == AIR_STEP_HIT_LAVA_WALL then
        lava_boost_on_wall(m);
    end
end

function act_metal_drop_dash_gravity(m)
    m.vel.y = math.max(-150, m.vel.y - 10)
end

hook_mario_action(ACT_DROP_DASH, {
    every_frame = act_drop_dash,
    gravity = act_metal_drop_dash_gravity
})

--- @param m MarioState
--- @param stats CharacterStats
function enter_drop_dash(m, stats)
    if stats.drop_dash_on and (m.input & INPUT_B_PRESSED) ~= 0 and isJumping(m) then
        audio_sample_play(drop_dash_sound, m.pos, 1)
        set_mario_action(m, ACT_DROP_DASH, 0)
        m.vel.y = -stats.drop_dash_gravity
    end
end
