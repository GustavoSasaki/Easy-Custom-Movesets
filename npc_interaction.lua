define_custom_obj_fields({
    oToadDying = 'u32',
    oToadAssassin = 'u32'
})

--- @param toad Object
local function die_toad(toad)
    obj_mark_for_deletion(toad)
    spawn_mist_particles();
    spawn_triangle_break_particles(20, 138, 0.7, 3);
    play_sound(SOUND_GENERAL_BREAK_BOX, toad.header.gfx.cameraToObject);
    gMarioStates[toad.oToadAssassin].numLives = gMarioStates[toad.oToadAssassin].numLives + 1
end

--- @param toad Object
local function bhv_custom_toad(toad)
    if toad.oToadDying == 1 then
        local collisionFlags = object_step();
        if ((collisionFlags & OBJ_COL_FLAG_GROUNDED) == OBJ_COL_FLAG_GROUNDED) then
            die_toad(toad)
        end
    end
end

hook_behavior(id_bhvToadMessage, OBJ_LIST_PUSHABLE, false, nil, bhv_custom_toad)


--- @param bomb_on Object
local function bhv_custom_pink_bomb_on(bomb_on)
    if bomb_on.oToadDying == 1 then
        local collisionFlags = object_step();
        if ((collisionFlags & OBJ_COL_FLAG_GROUNDED) == OBJ_COL_FLAG_GROUNDED) then
            obj_mark_for_deletion(bomb_on)
            spawn_sync_object(id_bhvExplosion, E_MODEL_EXPLOSION, bomb_on.oPosX, bomb_on.oPosY, bomb_on.oPosZ, nil)
        end
    end
end

hook_behavior(id_bhvBobombBuddyOpensCannon, OBJ_LIST_PUSHABLE, false, nil, bhv_custom_pink_bomb_on)
hook_behavior(id_bhvBobombBuddy, OBJ_LIST_PUSHABLE, false, nil, bhv_custom_pink_bomb_on)

