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
        gPlayerSyncTable[m.playerIndex].shouldExplode = 70
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

--- @param m MarioState
--- @--- @param stats CharacterStats
--- @param interactee Object
local function apply_bat_damage(m, stats, interactee)
    if obj_has_behavior_id(interactee, id_bhvGoomba) == 1 and (interactee.oInteractStatus & INT_STATUS_ATTACKED_MARIO) ~=
        0 then

        hurtByEnemy(m, interactee, stats.bat_damage_multiplier)
        if stats.bat_damage_multiplier <= 0 then
            kill_enemy(interactee)
        end
    end
end

--- @param m MarioState
--- @param interactee Object
--- @param interactType InteractionType
local function on_interaction(m, interactee, interactType, interactValue)
    if gPlayerSyncTable[m.playerIndex].char_select_name == nil then
        return
    end
    local stats = _G.customMoves.stats_from_name(gPlayerSyncTable[m.playerIndex].char_select_name)
    if stats == nil then
        return
    end

    apply_bat_damage(m, stats, interactee)
    apply_interact_coin(m, stats, interactee, interactType)
end
hook_event(HOOK_ON_INTERACT, on_interaction)

