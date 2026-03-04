
_G.charSelect.hook_on_character_change(function(_,currChar)
    local stats = stats_from_name(_G.charSelect.character_get_full_table()[currChar][1].name)

    if  _G.honeyQueenMoveset and stats and stats.honeyQueen_fly_on then
        local animation = stats.honeyQueen_fly_animation
        if stats.honeyQueen_fly_animation == "default" then
            animation = "honeyqueen_fly_idle"
        elseif stats.honeyQueen_fly_animation == "ground pound" then
            animation = CHAR_ANIM_GROUND_POUND
        elseif stats.honeyQueen_fly_animation == "water idle" then
            animation = CHAR_ANIM_WATER_IDLE
        end
        _G.honeyQueenMoveset.current_character_set_flags({
            can_fly=true,
            render_wing_cap_fly=stats.honeyQueen_fly_render_cap,
            fly_animation=animation,
            max_fly_timer=stats.honeyQueen_max_fly_timer,
            render_hud=stats.honeyQueen_render_hud
            
        })
    end
end
)