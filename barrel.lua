local BARREL_COLLISION = smlua_collision_util_get('barrel_collision')
local SUBSTITUTE_COLLISION = smlua_collision_util_get('ecm_substitute_collision')
local BOX_COLLISION = smlua_collision_util_get('ecm_box_collision')


E_MODEL_ECM_BARREL = smlua_model_util_get_id('barrel_geo')
E_MODEL_ECM_SUBSTITUTE = smlua_model_util_get_id('ecm_substitute_geo')
E_MODEL_ECM_BOX = smlua_model_util_get_id('ecm_box_geo')

---@param o Object
local function barrel_init(o)
    o.oFlags = o.oFlags | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE

    local collision = BARREL_COLLISION
    local m = gMarioStates[network_local_index_from_global(o.globalPlayerIndex)]
    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats ~= nil then
        if stats.hide_barrel_type == 'box' then
            collision = BOX_COLLISION
        elseif stats.hide_barrel_type == 'substitute' then
            collision = SUBSTITUTE_COLLISION
        end
    end

    o.collisionData = collision
    network_init_object(o, true,{})
end

---@param o Object
local function barrel_loop(o)
    o.activeFlags = o.activeFlags | ACTIVE_FLAG_UNK10
    local m = gMarioStates[network_local_index_from_global(o.globalPlayerIndex)]
    set_mario_action(m, ACT_DISAPPEARED, 0)
    cur_obj_update_floor_and_walls()
    local ceilHeight, pceil = find_ceil(m.pos.x,m.pos.y+83,m.pos.z)


    if  (m.controller.buttonDown & Z_TRIG) == 0 or m.floor.normal.y < 0.9 or math.abs(m.pos.y- o.oFloorHeight) >= 60 or (pceil ~= nil and math.abs(m.pos.y - ceilHeight) <= 83)then  
        m.squishTimer = 0    
        set_mario_action(m,ACT_STOP_CROUCHING,0)
        cur_obj_enable_rendering_and_become_tangible(m.marioObj)
        obj_mark_for_deletion(o)
        play_sound(SOUND_ACTION_TERRAIN_LANDING, m.marioObj.header.gfx.cameraToObject)
    elseif  (m.input & INPUT_A_PRESSED) ~= 0 then
        m.squishTimer = 0    
        set_mario_action(m,ACT_BACKFLIP,0)
        cur_obj_enable_rendering_and_become_tangible(m.marioObj)
        obj_mark_for_deletion(o)
        play_sound(SOUND_ACTION_TERRAIN_LANDING, m.marioObj.header.gfx.cameraToObject)
    elseif  (m.input & INPUT_B_PRESSED) ~= 0 then
        m.squishTimer = 0    
        set_mario_action(m,ACT_PUNCHING,0)
        cur_obj_enable_rendering_and_become_tangible(m.marioObj)
        obj_mark_for_deletion(o)
        play_sound(SOUND_ACTION_TERRAIN_LANDING, m.marioObj.header.gfx.cameraToObject)
    else
        o.oPosX = m.pos.x
        o.oPosZ = m.pos.z
        o.oPosY = m.pos.y + 1
        o.oFaceAngleYaw = m.faceAngle.y
        load_object_collision_model()
    end
end


id_bhvbarrel = hook_behavior(nil, OBJ_LIST_SURFACE, false, barrel_init, barrel_loop, 'bhvEcmBarrel')
