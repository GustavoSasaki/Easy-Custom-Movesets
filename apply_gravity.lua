--- @param m gMarioStates
--- @return boolean
local function isMarioWingCapDescending(m)
    return (m.flags & MARIO_WING_CAP) ~= 0 and m.vel.y < 0 and (m.input & INPUT_A_DOWN)
end

--- @param m gMarioStates
local function apply_twirl_gravity(m)
    m.vel.y = m.vel.y + 4 -- cancel normal gravity

    local angleVel = m.angleVel.y <= 0x2000 and m.angleVel.y or m.actionState

    local heaviness = 1.0
    if angleVel > 1024 then
        heaviness = 1024.0 / angleVel
    end

    m.vel.y = m.vel.y - 4.0 * heaviness

    local terminalVelocity = -75.0 * heaviness
    if m.vel.y < terminalVelocity then
        m.vel.y = terminalVelocity
    end
end

--- @param m gMarioStates
local function apply_gravity(m)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end

    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    -- gravity magic number defined at https://github.com/coop-deluxe/sm64coopdx/blob/f85b8419afc6266ac0af22c5723eebe3effa1f7d/src/game/mario_step.c#L689
    if isMarioWingCapDescending(m) then
        m.vel.y = m.vel.y - 2 * stats.gravity
    else
        local isFalling = (m.vel.y - 4 * stats.gravity - 4) < 0
        if m.action == ACT_TWIRLING then
            m.vel.y = m.vel.y - 4 * stats.twirling_gravity
        elseif m.action == ACT_FAST_TWIRLING then
            if (m.controller.buttonDown & Z_TRIG) == 0 then
                apply_twirl_gravity(m)
            else
                m.vel.y = m.vel.y - 4 * stats.fast_twirling_gravity
            end
        elseif m.action == ACT_MR_L_JUMP then
            m.vel.y = m.vel.y - 4 * stats.mr_l_gravity
        elseif isFalling then
            m.vel.y = m.vel.y - 4 * stats.fall_gravity
        else
            m.vel.y = m.vel.y - 4 * stats.gravity
        end
    end
end

hook_event(ACTION_HOOK_GRAVITY, apply_gravity)