ACT_WALL_SLIDE = (0x0BF | ACT_FLAG_AIR | ACT_FLAG_MOVING | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION)

gWallSlideState = {}
for i = 0, (MAX_PLAYERS - 1) do
    gWallSlideState[i] = {}
    local e = gWallSlideState[i]
    e.wall = nil
end

local function act_wall_slide(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    if (m.input & INPUT_A_PRESSED) ~= 0 then

        local rc = set_mario_action(m, stats.wall_slide_jump_type, 0)
        m.vel.y = stats.wall_slide_jump_strength

        if m.forwardVel < stats.wall_slide_jump_forward_vel then
            m.forwardVel = stats.wall_slide_jump_forward_vel
        end
        m.wallKickTimer = 0
        return rc
    end

    -- attempt to stick to the wall a bit. if it's 0, sometimes you'll get kicked off of slightly sloped walls
    mario_set_forward_vel(m, -0.1)

    if m.vel.y < -10 then
        m.particleFlags = m.particleFlags | PARTICLE_DUST
    end

    play_sound(SOUND_MOVING_TERRAIN_SLIDE + m.terrainSoundAddend, m.marioObj.header.gfx.cameraToObject)
    set_mario_animation(m, MARIO_ANIM_START_WALLKICK)

    if perform_air_step(m, 0) == AIR_STEP_LANDED then
        mario_set_forward_vel(m, 0.0)
        if check_fall_damage_or_get_stuck(m, ACT_HARD_BACKWARD_GROUND_KB) == 0 then
            return set_mario_action(m, ACT_FREEFALL_LAND, 0)
        end
    end

    m.actionTimer = m.actionTimer + 1
    if m.wall == nil and m.actionTimer > 2 then
        mario_set_forward_vel(m, 0.0)
        return set_mario_action(m, ACT_FREEFALL, 0)
    end

    return 0
end

local function act_wall_slide_gravity(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    m.vel.y = m.vel.y - ( 4 * stats.wall_slide_gravity )

    if m.vel.y < -75 *stats.wall_slide_max_gravity then
        m.vel.y = -75 * stats.wall_slide_max_gravity
    end
end


hook_mario_action(ACT_WALL_SLIDE, { every_frame = act_wall_slide, gravity = act_wall_slide_gravity } )