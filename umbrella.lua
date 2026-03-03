E_MODEL_BIG_PADDLE = smlua_model_util_get_id("Umbrella_geo")

COL_BIG_PADDLE = smlua_collision_util_get("nil")

----------------------------------
function bhv_big_umbrella_init(obj)
    obj.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    cur_obj_become_intangible()
    network_init_object(obj, true, {})
end


function bhv_big_umbrella_loop(obj)

    local m =  gMarioStates[network_local_index_from_global(obj.globalPlayerIndex)]
    local up = -40
     if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_HANG_ON_CEILING then
         up = -25
     end
    local front = 20
     if m.marioObj.header.gfx.animInfo.animID == MARIO_ANIM_HANG_ON_CEILING  then
         front = 20
    elseif  m.marioObj.header.gfx.animInfo.animID ==  MARIO_ANIM_GRAB_POLE_SHORT or
    m.marioObj.header.gfx.animInfo.animID == CHAR_ANIM_START_TWIRL then
         front = 0
    end

    local limb = 0

    obj.oPosX = get_hand_foot_pos_x(m, limb) + m.vel.x +sins(m.faceAngle.y) * front
    obj.oPosY = get_hand_foot_pos_y(m, limb) + up
    obj.oPosZ = get_hand_foot_pos_z(m, limb) +m.vel.z + coss(m.faceAngle.y) * front


    obj.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE

    if m.playerIndex == 0  and m.action ~= ACT_UMBRELLA_GLIDE  then 
        obj_mark_for_deletion(obj)
  
    end
end

id_bhvBigumbrella = hook_behavior(nil, OBJ_LIST_GENACTOR, false, bhv_big_umbrella_init, bhv_big_umbrella_loop)
