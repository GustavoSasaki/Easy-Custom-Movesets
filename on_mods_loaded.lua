local function on_mods_loaded()
    if(_G.jumpingAnimExists) then
        _G.jumpingAnim.set_IsActive(false)
    end
end
hook_event(HOOK_ON_MODS_LOADED, on_mods_loaded)
