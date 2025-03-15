--- @param m MarioState
local function on_death(m)
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end
    if stats.explode_on_death then
        spawn_sync_object(id_bhvExplosion, E_MODEL_EXPLOSION, m.pos.x, m.pos.y, m.pos.z, nil)
    end
end

hook_event(HOOK_ON_DEATH, on_death)
