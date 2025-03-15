local function on_mods_loaded()
    if (_G.jumpingAnimExists) then
        _G.jumpingAnim.set_IsActive(false)
    end

    for _, character in ipairs(_G.customMoves.characterStatsTable ) do
        _G.customMoves.add_moveset_description(character)
    end
end
hook_event(HOOK_ON_MODS_LOADED, on_mods_loaded)
