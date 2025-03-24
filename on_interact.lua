--- @param m MarioState
--- @param heal integer
local function healOrHurtMario(m, heal)
    if heal > 0 then
        m.healCounter = m.healCounter + heal
    else
        m.hurtCounter = m.hurtCounter - heal
    end
end

--- @param m MarioState
--- @param enemy Object
--- @param multiplier number
local function hurtByEnemy(m, enemy, multiplier)
    if multiplier >= 9 then
        set_mario_action(m, ACT_DISAPPEARED, 0)
        spawn_sync_object(id_bhvSwoop, E_MODEL_EXPLOSION, m.pos.x, m.pos.y, m.pos.z, nil)
        obj_spawn_yellow_coins(m.marioObj, 1)

        stop_background_music(get_current_background_music())
        gPlayerSyncTable[m.playerIndex].shouldExplode = 65
        m.hurtCounter = 8 * 4
    else
        healOrHurtMario(m, -4 * multiplier * enemy.oDamageOrCoinValue)
    end
end

--- @param m MarioState
--- @param stats CharacterStats
--- @param coin Object
--- @param interactType InteractionType
local function apply_interact_coin(m, stats, coin, interactType)
    if interactType ~= INTERACT_COIN then
        return
    end

    local healAdded = coin.oDamageOrCoinValue * stats.coin_heal_multiplier * 3
    healOrHurtMario(m, healAdded)
end

--- @param obj Object
local function kill_enemy(obj)
    if (obj.oDeathSound == 0) then
        spawn_mist_particles_with_sound(SOUND_OBJ_DEFAULT_DEATH);
    elseif (obj.oDeathSound > 0) then
        spawn_mist_particles_with_sound(obj.oDeathSound);
    else
        spawn_mist_particles();
    end

    if (obj.oNumLootCoins < 0) then
        spawn_object(obj, MODEL_BLUE_COIN, bhvMrIBlueCoin);
    else
        obj_spawn_loot_yellow_coins(obj, obj.oNumLootCoins, 20);
    end
    obj_mark_for_deletion(obj)
end

--- @param object Object
--- @param bhvIds BehaviorId[]
--- @return boolean
function obj_has_behaviors(object, bhvIds)
    for _, bhvId in ipairs(bhvIds) do
        if obj_has_behavior_id(object, bhvId) == 1 then
            return true
        end
    end
    return false
end

--- @param m MarioState
--- @param stat number
--- @param interactee Object
--- @param bhvIds BehaviorId[]
local function apply_enemy_damage_multipler(m, stat, interactee, bhvIds)
    if obj_has_behaviors(interactee, bhvIds) and (interactee.oInteractStatus & INT_STATUS_ATTACKED_MARIO) ~= 0 then

        hurtByEnemy(m, interactee, stat)
        if stat <= -1 then
            kill_enemy(interactee)
        end
    end
end

--- @param m MarioState
--- @param interactType InteractionType
local function interact_pole(m, interactType)
    if interactType == INTERACT_POLE and
        (m.action == ACT_YOSHI_FLUTTER or m.action == ACT_GROUND_POUND_JUMP or m.action == ACT_GLIDE_DIVE or m.action ==
            ACT_IN_AIR_JUMP or m.action == ACT_MR_L_FALL or m.action == ACT_SUPER_SIDE_FLIP) then
        set_mario_action(m, ACT_JUMP, 0)
    end
end


--- @param m MarioState
--- @param stats CharacterStats
--- @param interactee Object
local function kill_pink_bomb_on(m,stats,interactee) 
    if stats.kill_pink_bomb_on and obj_has_behaviors(interactee, {id_bhvBobombBuddyOpensCannon,id_bhvBobombBuddy}) then
        if  m.action == ACT_SLIDE_KICK or m.action == ACT_DIVE_SLIDE  or m.action == ACT_DIVE  then
            interactee.oToadDying = 1
            interactee.oForwardVel = 20;
            interactee.oVelY = 40;
            interactee.oGravity = 3
            interactee.oBounciness = -20

            local player = nearest_player_to_object(interactee);
            if (player ~= nil) then
                interactee.oMoveAngleYaw = obj_angle_to_object(player, interactee);
            end
            interactee.oInteractStatus = 0
        else
            obj_mark_for_deletion(interactee)
            spawn_sync_object(id_bhvExplosion, E_MODEL_EXPLOSION, interactee.oPosX, interactee.oPosY, interactee.oPosZ, nil)
        end
    end
end

--- @param m MarioState
--- @param stats CharacterStats
--- @param interactee Object
local function kill_toad(m,stats,interactee) 
    if stats.kill_toad == false or (obj_has_behavior_id(interactee, id_bhvToadMessage)) == 0 then
       return
    end

    interactee.oToadDying = 1
    interactee.oToadAssassin = m.playerIndex
    interactee.oGravity = 4

    local player = nearest_player_to_object(interactee);
    if (player ~= nil) then
        interactee.oMoveAngleYaw = obj_angle_to_object(player, interactee);
    end
    interactee.oInteractStatus = 0

    if (m.action == ACT_GROUND_POUND or m.action == ACT_TWIRLING) or m.action == ACT_SLIDE_KICK or (m.action & ACT_FLAG_RIDING_SHELL) ~= 0 or m.action == ACT_DIVE_SLIDE  or m.action == ACT_DIVE then
        interactee.oForwardVel = 20;
        interactee.oVelY = 50;
    elseif (m.action == ACT_PUNCHING or m.action == ACT_MOVE_PUNCHING or m.action == ACT_JUMP_KICK) then
        interactee.oForwardVel = 50;
        interactee.oVelY = 30;
    end
end


--- @param m MarioState
--- @param stats CharacterStats
--- @param interactee Object
local function attacking_npc(m,stats,interactee) 
    if (m.action & ACT_FLAG_ATTACKING) == 0 then
        return
    end

    kill_pink_bomb_on(m,stats,interactee)
    kill_toad(m,stats,interactee)
end


--- @param m MarioState
--- @param interactee Object
--- @param interactType InteractionType
local function on_interaction(m, interactee, interactType, interactValue)

    if interactType == INTERACT_GRABBABLE and m.action == ACT_GLIDE_DIVE then
        set_mario_action(m, ACT_DIVE, 0)
    end

    local stats = _G.customMoves.stats_from_mario_state(m)
    if stats == nil then
        return
    end

    attacking_npc(m,stats,interactee)

    apply_enemy_damage_multipler(m, stats.flying_enemy_damage_multiplier, interactee, {id_bhvBulletBill,id_bhvBookendSpawn,id_bhvHauntedChair,id_bhvSpindrift,id_bhvFlyGuy,id_bhvSnufit,id_bhvSnufitBalls})
    apply_enemy_damage_multipler(m, stats.goomba_damage_multiplier, interactee, {id_bhvGoomba})
    apply_enemy_damage_multipler(m, stats.bat_damage_multiplier, interactee, {id_bhvSwoop})
    apply_enemy_damage_multipler(m, stats.water_enemy_damage_multiplier, interactee,
        {id_bhvBub, id_bhvClamShell, id_bhvSushiShark, id_bhvUnagi})
    apply_enemy_damage_multipler(m, stats.piranha_plant_damage_multiplier, interactee,
        {id_bhvPiranhaPlant, id_bhvFirePiranhaPlant})
    apply_interact_coin(m, stats, interactee, interactType)

    interact_pole(m, interactType)
end
hook_event(HOOK_ON_INTERACT, on_interaction)

