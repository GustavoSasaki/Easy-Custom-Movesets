# Easy Custom Movesets
This is an extension of Squishy6094 [character-select-coop](https://github.com/Squishy6094/character-select-coop). 

Its objective is to make customizing character movesets easier, such as increasing jump strengths, gravity, or swimming speed.

You can find examples in the [initial-characterstats-table.lua](https://github.com/GustavoSasaki/character-stats/blob/main/initial-characterstats-table.lua).


## Important Stats

| Name              | Explanation | Default Value | Observation |
| :---------------- | :------: | :-------: | :-------:|
| gravity       |   How much gravity affects the character (percentage).  | 100 | |
| jump_strength       |   How much higher all jumps are (percentage).  | 100 | Impacts only the jump constant. Single/double jump velocity depends on a constant and forward velocity.|
| walking_speed       |   How much faster the character can walk  (percentage).  | 100 | |
| in_air_speed       |   How much faster the character can move horizontally in the air  (percentage).  | 100 | |
| swimming_speed       |  How much faster the character can swim (percentage).  | 100 | |
| dive_velocity       |   Changes the constant forward velocity added when diving.   | 100 | |
| dive_max_velocity       |   Increases the max forward velocity cap for dives (percentage).  | 100 |  |
| long_jump_velocity_multiplier       |   When diving, an multiplier is applied to current forward velocity. Increases this multiplier (percentage). | 100 | The multiplier value is 1.5|
| long_jump_max_velocity       |  Increases the max forward velocity cap for long jumps (percentage).  | 100 |  |
| mr_l_jump_on       |  	Enables the character to perform a super jump after holding a crouch.  | false | same as Luigi in super paper mario |
| back_flip_twirling_on       |  Allows the character to enter a twirling state after performing a backflip.| false | same as Luigi from Super Mario 64 DS |
| twirling_ground_pound_on       | 	Allows the character to perform a ground pound while twirling. | false |  |
| twirling_dive_on       | 	Allows the character to perform a dive while twirling. | false |  |
| triple_jump_twirling_on       | 	The character start twirling after triple jump. | false |  |
| fast_twirling_on       | 	 Allows the character to descend faster when twirling by pressing the Z button. | false |  To adjust the descending speed, modify the value of `fast_twirling_gravity`. Stat slightly bugged, The Shifting Sand Tornados will continue chasing you even after twirling, this results in the character ascending more than normal. |
| water_damage_multiplier       | 	How much damage the character takes when holding breath under water (percentage). | 100 |  |
| disable_damage       | 	Disable damage. | false | |
| ground_pound_dive_on       | 	Allows the character to perform a dive while ground pound. | false |  |
| waft_fart_on       | 	Allows the character to perform an super fart jump while ground pound with Z button. This jump has an limited number of uses per level. | false |  |
| ground_pound_jump_on       | 	Allows the character to perform an special jump after ground pound.  | false | Just like Super Mario Odyssey  |
| saultube_jump_animation       | 	Apply custom single/double/triple jump animation from Saultube  | false | You need to install [Credits Jumping Animation](https://mods.sm64coopdx.com/threads/credits-jumping-animation.1959/#post-7532) to work this stat |
| long_jump_triple_jump_on       | 	Allows the character to perform an triple jump after long jump.  | false | After long jump, press A without pressing Z |
| super_side_flip_on       | 	Allows the character to perform an special side flip after long jump.  | false | |
| wall_slide_on       | 	Allows the character to perform wall slide.  | false | Code created by djoslin0. |
| in_air_jump       | 	How many jumps in the air the character can do | 0 |  |
| kick_dive_on       | 	When pressing B, instead of performing a dive or kick depending on speed, the character will always execute a kick first. If B is pressed again, a dive will follow. | false |  |
| glide_dive_on       | The character glide when diving. | false |  |
| kill_toad       | The character can kill toad | false |  |
| yoshi_flutter_on       | The character can yoshi flutter after jumping | false |  |
| peel_out_on       | The character can peel out by pressing UP while not moving. | false | This move was made by atrael2 with help of doggednamed1   |
| dive_kick_on       | The character can kick from dive. | false |   |
| always_dive_first       | The character always dives independently of current speed. | false |   |
| sonic_jump_on       | The character do sonic jump instead of single jump. | false | An jump with fixed Y velocity, smaller hitbox, no air/angle control.  |

## Less Important Stats

| Name              | Explanation | Default Value | Observation |
| :---------------- | :------: | :----: | :-------:|
| fall_gravity       |  Gravity effect when falling (y velocity < 0) (percentage).  | gravity (100) | |
| hold_walking_speed       |  How much faster the character can walk while holding something  (percentage). | walking_speed (100) | |
| crawling_speed       |  How much faster the character can crawl (percentage). | walking_speed (100) | |
| grounded_slowing_speed       |  How much faster the character moves while decelerating in the ground | 100 | The higher the value, the more slippery the character feels. Unfortunately, the forward velocity is always reset to zero when landing from a jump, making this stat harder to notice. |
| explode_on_death       |  Creates a small explosion on death.| false | A "troll" stat. |
| airborne_deceleration_speed       |  Changes deceleration speed in the air (percentage). | 100 |	The velocity change is minimal.|
| single_jump_strength       |   	Increases the height of single jumps (percentage). | 100 ||
| double_jump_strength       |   Increases the height of double jumps (percentage). | 100 | |
| triple_jump_strength       |  Increases the height of triple jumps (percentage). | 100 | |
| back_flip_strength       |   Increases the height of backflips (percentage).  | 100 | |
| side_flip_strength       |   Increases the height of side flips (percentage).  | 100 | |
| long_jump_strength       |   Increases the height of long jumps (percentage). | 100 | |
| kick_jump_strength       |   Increases the height of kick jumps (percentage). | 100 | |
| dive_y_vel       |  Adds vertical velocity when diving (units). | 0 |  Normally, diving gives no vertical velocity.|
| mr_l_jump_strength       |   Vertical velocity when doing mr l jump (units). | 93 |  high strength and high gravity gives the explosive feeling of original jump of super paper mario|
| mr_l_gravity       |   How much gravity affects the character when doing mr l jump (percentage). | 140 |  |
| mr_l_air_speed       |   How much faster the character can move horizontally when doing mr l jump  (percentage). | 60 |  |
| play_mr_l_anticipation_audio       |   Play sound when charging up to do an mr. l jump  | true |  |
| twirling_gravity       |   Gravity effect when twirling (percentage)  | gravity (100)  | High values such as 90 already make the character very floaty. |
| fast_twirling_gravity       |   Gravity effect when fast twirling (percentage)  | twirling_gravity ( 100 )  | High values such as 90 already make the character very floaty. |
| triple_jump_twirling_when | Defines when the character starts twirling after a triple jump. | fall | Options: `fall` – Start twirling when the character begins falling during the triple jump or `start` – Start twirling immediately at the beginning of the triple jump. 
| side_flip_twirling_on       |   The character start twirling after side flip.  | false  |  |
| twirling_speed       |   How much faster the character can move horizontally while twirling  (percentage).  | in_air_speed ( 100 )  | |
| bad_gas_damage_multiplier       |   How much damage the character takes from bad gas  (percentage).  |  100   | |
| snow_water_damage_multiplier       | 	How much damage the character takes when holding breath under snow water (percentage). | water_damage_multiplier ( 100 ) |  |
| disable_breath_heal       | 	Disable the healing when breathing in water surface. | false |  |
| burning_damage_multiplier       | 	How much damage the character takes when burning (percentage). | 100 |  |
| disable_burning       | 	Disable bruning from flames | false |  |
| lava_damage_multiplier       | 	How much damage the character takes from lava (percentage). | 100 |  |
| ground_pound_dive_y_vel       | 	Adds vertical velocity when diving after ground pound (units).  | 0 | Recomended add some value in this stat, this will make ground pound dive feel  much better |
| ground_pound_dive_forward_vel       | 	Forward velocity added when diving after ground pound (units).  | dive_max_velocity (48) |  |
| ground_pound_antecipation_speed_up       | 	Increases the speed of the spinning animation before performing a ground pound.  | "no" | `small`  Increases speed by 20% , `medium`  Increases speed by 25%, `fast` Increases speed by 80% and `immediately` skips animation|
| ground_pound_gravity       |  Gravity effect when ground pounding (percentage).  | gravity (100) | |
| ground_pound_max_y_vel       |  Increases the max Y velocity when ground pounding (percentage).  |  100 | |
| waft_fart_velocity       |  Horizontal velocity of waft fart jump (units).  |  100 | |
| waft_fart_strength       |  Height of waft fart jump (units).  |  93 | |
| waft_fart_per_level       |  Number of time the character can use waft fart jum per level (units).  |  1 | |
| ground_pound_shake       |  Increase camera shake when ground pounding (percentage).   |  100 | It just visual, no gampleay effect |
| ground_pound_jump_strength       | Height of ground pound jump (units).   |  70 |  |
| ground_pound_jump_forward_vel       |  Horizontal velocity of ground pound jump (units).  |  5 |  |
| ground_pound_jump_dive_on       |  Allows the character to dive while performing an ground pound jump.   |  false |  |
| saultube_single_jump_animation       | 	Apply custom single jump animation from Saultube  | false | You need to install [Credits Jumping Animation](https://mods.sm64coopdx.com/threads/credits-jumping-animation.1959/#post-7532) to work this stat |
| saultube_double_jump_animation       | 	Apply custom double jump animation from Saultube  | false | You need to install [Credits Jumping Animation](https://mods.sm64coopdx.com/threads/credits-jumping-animation.1959/#post-7532) to work this stat |
| saultube_triple_jump_animation       | 	Apply custom triple jump animation from Saultube  | false | You need to install [Credits Jumping Animation](https://mods.sm64coopdx.com/threads/credits-jumping-animation.1959/#post-7532) to work this stat |
| long_jump_triple_jump_strength       |  Increases the height of the triple jump after long jump (percentage).  |  triple_jump_strength (100) |  |
| long_jump_triple_jump_forward_vel       |  Set horizontal velocity of long jump triple jump (units).   |  nil | if nil, doest not change current velocity |
| long_jump_triple_jump_add_forward_vel       |  Added horizontal velocity of long jump triple jump (units).   |  0 | |
| super_side_flip_strength       |  Height of super side flip (units).   |  75 | |
| super_side_flip_convert_foward_vel       | Conversion from foward velocity of the long jump into the side flip (percentage).  |  100 | |
| super_side_flip_add_foward_vel       |  Horizontal velocity added when super side flip (units) |  20 | |
| super_side_flip_kick_strength       |  Height of the kick when doing super side flip (percentage of an normal kick).   |  150 | |
| super_side_flip_kick_forward_vel       |  Forward velocity of the kick when doing super side flip (units).   |  nil | if nil, ignore this stat. |
| super_side_flip_gravity       | Gravity effect when doing super side flip (percentage). |  75 |  |
| super_side_flip_max_gravity       | Max downard velocity when aplying gravity of super side flip (percentage). |  93 |  |
| super_side_flip_min_velocity       |  Minimal forward velocity of the long jump to execute super side flip (units). |  36 |  |
| wall_slide_gravity       |   Gravity effect when wall sliding (percentage).  | 50 |  |
| wall_slide_max_gravity       |   Max downard velocity when aplying gravity of wall slide (percentage). | 26 |  |
| wall_slide_jump_forward_vel       |   Forward velocity added when jumping from wall slide (units). | 20 |  |
| wall_slide_jump_strength       |  Increases the height of jump after wall slide (units). | 75 |  |
| wall_slide_jump_type       |  Type of the jump after wall slide. | ACT_TRIPLE_JUMP | [Documentation](https://github.com/coop-deluxe/sm64coopdx/blob/abf818b90eef960a139f29e08efcec7f678fcda3/docs/lua/constants.md#sm64h) with all the types. |
| in_air_jump_strength       |  Jump strength of in air jumps (units). | 42 | You can also pass an array defining the valur for each individual in air jump (Ex: {30,20,10} would make the first jump have 30 strength, the second 20 and third 10) |
| in_air_jump_forward_vel       |  Set forward speed when doing in air jump (units). | 0 |  |
| in_air_jump_animations       |  Animation of in air jumps (CharacterAnimID). | CHAR_ANIM_DOUBLE_JUMP_RISE |[Documentation](https://github.com/coop-deluxe/sm64coopdx/blob/abf818b90eef960a139f29e08efcec7f678fcda3/docs/lua/constants.md#enum-characteranimid) with all the animation. You can also pass as an array |
| in_air_jump_sound       |  Sound of in air jumps (CharacterSound). | CHAR_SOUND_HOOHOO | [Documentation](https://github.com/coop-deluxe/sm64coopdx/blob/abf818b90eef960a139f29e08efcec7f678fcda3/docs/lua/constants.md#CharacterSound) with all the sounds. You can also pass as an array |
| in_air_jump_forward_vel_multiplier       | How much forward velocity is converted to in air jumps (percentage). | 25 | You can also pass as an array |
| in_air_jump_forward_vel_slowdown       | How much forward velocity is losted everytime the character do an air jumps (percentage). | 20 | You can also pass as an array |
| disable_double_jump       | Disable double jump. | false | Some moves (such as in air jumps) makes get the right time for double jump be really awkard. Removing double jump is an way to resolve this. |
| disable_twirling_land       | Disable landing state of twirling | false | When landing from twirling the character executes landing animatio. In this state, it doenst accepts inputs. |
| disable_coin_heal       | Disable heal from coins. | false |  |
| coin_heal_multiplier       | Increase heal from coins (percentage). | 100 |  The value can be negative, making getting coin deal damage. |
| one_hit       | The character die after being hit once. | false |   |
| bat_damage_multiplier       | Increase damage from bats (percentage). | 100 |   |
| piranha_plant_damage_multiplier       | Increase damage from piranha plants (percentage). | 100 |   |
| water_enemy_damage_multiplier       | Increase damage from fishs,sharks,clams and eels (percentage). | 100 |   |
| knockback_resistance       | Decrease knockback (percentage). | 100 |   |
| glide_dive_forward_vel       | Initial forward velocity when glide diving (units). | 50 |  |
| glide_dive_slowdown       | How much the character loses forward velocity when glide diving (units). | 0.25 |  |
| glide_dive_angle_speed       | How much control of the angle the character has when dive gliding (percentage). | 75 |  |
| glide_dive_min_forward_speed       | If the character has less than this stat speed, he will stop gliding (units). | 0 |  |
| glide_dive_max_time       | How much time the character can be glide diving (units). | 999 |  |
| glide_dive_y_vel       | Fixed Y velocity apply to the character when glide diving (units). | -5 |  |
| glide_dive_render_with_wing_cap       | Show the character with wing cap when glide diving. | false |  | 
| glide_dive_disable_spin       | Removes spin animation when star glide diving. | false |  |
| kill_pink_bomb_on       | The character can kill pink bomb on | false |  |
| moveset_description       | Description of moveset in the character selection screen | nil |  |
| yoshi_flutter_animation       | Animation of yoshi flutter | CHAR_ANIM_RUNNING |  |
| yoshi_flutter_angle_speed       | Yoshi flutter speed of changing angles (percentage). | 90 |  |
| yoshi_flutter_cooldown       | Time between yoshi flutter are allowed (units). | 21 |  |
| yoshi_flutter_stength_descending       | How much Y speed the character get while yoshi fluttering and having negative speed(units). | 17 |  |
| yoshi_flutter_stength_ascending       |  How much Y speed the character get while yoshi fluttering and having positive speed (units). | 6 |  |
| yoshi_flutter_max_y_vel       |  Maximun Y speed the character can get while yoshi fluttering (units). | 28 |  |
| yoshi_flutter_reactivations       |  How many time the character can yoshi flutter before landing(units). | 2 |  |
| yoshi_flutter_speed       |  Horizontal speed while yoshi fluttering. (percentage). | 100 |  |
| yoshi_flutter_max_time       |  The maximum duration of Yoshi flutter. | 30 |  |
| goomba_damage_multiplier       | 	How much damage the character takes from goombas (percentage). | 100 |  |
| flying_enemy_damage_multiplier       | 	How much damage the character takes from flying enemies (percentage). | 100 | Such as bullet bills, bokkends, haunted chairs, spindrifts, flyguys and snufits |
| peel_out_max_vel       | Max velocity set when character release peel out with maximun charge (units). | 128 | This move was made by atrael2 with help of doggednamed1   |
| peel_out_slowdown       | How much speed is lost every frame after releasing peel out (units). | 0.5 | This move was made by atrael2 with help of doggednamed1   |
| peel_out_jump_reset_vel       | After an peel out, the character jumps are not affected by the extra speed. | true | Single/double jumps heigth are partially defined by current speed, after an peel out you have lots of speed, aka you jumps are really high.   |
| dive_ground_pound_on       | The character can ground pound from dive. | false |   |
| sonic_jump_strength       | Sonic jump strength (units). | 60 |   |
| sonic_jump_add_forward_vel       | Added forawrd speed when sonic jump (units). | 15 |   |

## Instalation
- Download the character-select-coop ZIP file from [releases](https://github.com/Squishy6094/character-select-coop/releases) and unzip into mod folder
- Download the easy-custom-movesets ZIP file from [releases](https://github.com/GustavoSasaki/character-stats/releases) and unzip into mod folder
- Optional (enable the use of saultube animation stats): Download the ZIP file from [Credits Jumping Animation](https://mods.sm64coopdx.com/threads/credits-jumping-animation.1959/#post-7532) and unzip into mod folder


## How customize your character

### Integrating your mod
Inside your main.lua, after **_G.charSelect.character_add** , you can change character stats by executing **_G.customMoves.character_add**.

```
    _G.charSelect.character_add("Custom Model", {"Custom Model Description", "Custom Model Description"}, "Custom Model Creator", {r = 255, g = 200, b = 200}, E_MODEL_CUSTOM_MODEL, CT_MARIO, get_texture_info("custom-icon"))
    if _G.customMovesExists then
        _G.customMoves.character_add({name="Custom Model",swimming_speed=500})
    end
```

### Integrating other people mod
If you can't modify the mod files directly, you can submit a pull request to update the file [initial-characterstats-table.lua](https://github.com/GustavoSasaki/character-stats/blob/main/initial-characterstats-table.lua).


## Mods Integrated
- [Asterix](https://mods.sm64coopdx.com/mods/asterix.534/)
- [Azumanga Daioh](https://mods.sm64coopdx.com/mods/azumanga-daioh-64-pack.205/)
- [Baby Mario](https://mods.sm64coopdx.com/mods/cs-baby-mario.48/)
- [Boshi](https://mods.sm64coopdx.com/mods/cs-dynos-boshi.364/)
- [Charizard](https://mods.sm64coopdx.com/mods/cs-charizardmod.611/)
- [Connie](https://mods.sm64coopdx.com/mods/cs-connie-mario-luigi-brothership.207/)
- [Cream the Rabbit](https://mods.sm64coopdx.com/mods/cs-cream-the-rabbit.282/)
- [Croc](https://mods.sm64coopdx.com/mods/cs-croc.522/)
- [Donald Duck](https://mods.sm64coopdx.com/mods/donald-duck.555/)
- [Draco Centauros](https://mods.sm64coopdx.com/mods/cs-draco-centauros.268/)
- [Dry Bones](https://mods.sm64coopdx.com/mods/cs-dry-bones.37/)
- [Dudaw Kirby](https://mods.sm64coopdx.com/mods/cs-dudaw-kirby.629/)
- [Ebimasu](https://mods.sm64coopdx.com/mods/ebisumaru.594/)
- [Frogsuit Wildcard](https://mods.sm64coopdx.com/mods/cs-frogsuit-wildcard-models.308/)
- [Fungus](https://mods.sm64coopdx.com/mods/cs-fungusmod.610/)
- [Gargl](https://mods.sm64coopdx.com/mods/cs-gargl.163/)
- [GamesCage](https://mods.sm64coopdx.com/mods/cs-the-gamescage.297/)
- [Ganbare Goemon](https://mods.sm64coopdx.com/mods/ganbare-goemon-mystical-ninja.595/)
- [Godzilla & Mothra](https://mods.sm64coopdx.com/mods/cs-godzilla-mothra.437/)
- [Gnarpy](https://mods.sm64coopdx.com/mods/cs-gnarpy.530/)
- [Goemon](https://mods.sm64coopdx.com/mods/cs-goemon.573/)
- [Hatsune Miku](https://mods.sm64coopdx.com/mods/cs-hatsune-miku.418/)
- [Joker Mario](https://mods.sm64coopdx.com/mods/cs-joker-mario.556/)
- [Junio Sonic](https://mods.sm64coopdx.com/mods/junio-sonic-cs.450/)
- [King Penguin](https://mods.sm64coopdx.com/mods/cs-king-penguin.346/)
- [Kid](https://mods.sm64coopdx.com/mods/cs-the-kid.435/)
- [Kirby](https://mods.sm64coopdx.com/mods/cs-kirby.501/)
- [Kitsufae](https://mods.sm64coopdx.com/mods/cs-kitsufae-pack.276/)
- [Lego Mario](https://mods.sm64coopdx.com/mods/cs-lego-mario.553/)
- [Luma](https://mods.sm64coopdx.com/mods/cs-pet-luma.371/)
- [Marty the Thwomp](https://mods.sm64coopdx.com/mods/marty-the-thwomp-64.481/)
- [Marvin the martian](https://mods.sm64coopdx.com/mods/marvin-the-martian.497/)
- [Megumin](https://mods.sm64coopdx.com/mods/cs-megumin.202/)
- [Mips](https://mods.sm64coopdx.com/mods/cs-mips.326/)
- [Mlops Yoshi](https://mods.sm64coopdx.com/mods/cs-mlops-yoshi.214/)
- [Morgana](https://mods.sm64coopdx.com/mods/cs-morgana-persona-5.124/)
- [Mouser](https://mods.sm64coopdx.com/mods/cs-mouser.523/)
- [Mr. L](https://mods.sm64coopdx.com/mods/cs-mr-l.475/)
- [MyMelodyHd](https://mods.sm64coopdx.com/mods/cs-mymelodyhd.535/)
- [Nabbit](https://mods.sm64coopdx.com/mods/cs-nabbit.38/)
- [Neco-Arc](https://mods.sm64coopdx.com/mods/cs-neco-arc.327/)
- [Ninji](https://mods.sm64coopdx.com/mods/cs-ninji.574/)
- [Ori](https://mods.sm64coopdx.com/mods/cs-ori-64.177/)
- [Paisano Mario Redone](https://mods.sm64coopdx.com/mods/cs-paisano-mario-redone.113/)
- [PaRappa the Rappe](https://mods.sm64coopdx.com/mods/cs-parappa-the-rapper.212/)
- [Patrick Starfish](https://mods.sm64coopdx.com/mods/cs-patrick-starfish.269/)
- [Pepsiman](https://mods.sm64coopdx.com/mods/cs-pepsiman.88/)
- [Penelope Pussycat ](https://mods.sm64coopdx.com/mods/penelope-pussycat.539/)
- [Peter Griffin](https://mods.sm64coopdx.com/mods/cs-peter-griffin.11/)
- [QP](https://mods.sm64coopdx.com/threads/cs-qp.670/)
- [Rex](https://mods.sm64coopdx.com/mods/cs-rex-super-mario-world.575/)
- [SackBoy](https://mods.sm64coopdx.com/mods/cs-sackboy.459/)
- [Silver](https://mods.sm64coopdx.com/mods/silver-the-hedgehog-cs.398/)
- [Slippy Toad](https://mods.sm64coopdx.com/mods/slippy-toad-64.549/)
- [SMRPG](https://mods.sm64coopdx.com/mods/cs-smrpg-characters.35/)
- [Sonic Classic and Modern Pack](https://mods.sm64coopdx.com/mods/cs-sonic-classic-and-modern-pack.444/)
- [Spamton](https://mods.sm64coopdx.com/mods/cs-spamton.6/)
- [Talking Red](https://mods.sm64coopdx.com/mods/cs-talking-red.164/)
- [Toothless Mini Pack](https://mods.sm64coopdx.com/mods/cs-toothless-mini-pack.540/)
- [Saul & Friends](https://mods.sm64coopdx.com/mods/saul-friends.470/)
- [Saul PFP](https://mods.sm64coopdx.com/mods/saul-pfp.603/)
- [Squidward](https://mods.sm64coopdx.com/mods/squidward-cs.438/)
- [Thomas The Tank Engine](https://mods.sm64coopdx.com/mods/cs-thomas-the-tank-engine.41/)
- [Toon Link](https://mods.sm64coopdx.com/mods/cs-toon-link.460/)
- [Trumble](https://mods.sm64coopdx.com/mods/cs-tumble.380/)
- [Turkey Wario](https://mods.sm64coopdx.com/mods/cs-turkey-wario.411/)
- [VL-Tone and CJes Luigi](https://mods.sm64coopdx.com/mods/cs-vl-tone-and-cjes-luigi.12/)
- [Wapeach](https://mods.sm64coopdx.com/mods/cs-wapeach.17/)
- [Watto](https://mods.sm64coopdx.com/mods/cs-watto.405/)
- [Weirdo](https://mods.sm64coopdx.com/mods/cs-weirdo.515/)
- [WolfBoltOne](https://mods.sm64coopdx.com/mods/cs-wolfboltone.571/)
- [Yae](https://mods.sm64coopdx.com/mods/yae.597/)
- [Yosi Cube](https://mods.sm64coopdx.com/mods/cs-yosi-cube.152/)
- [Yui Hirasawa](https://mods.sm64coopdx.com/mods/cs-yui-hirasawa-k-on.258/)
- [Yumpi](https://mods.sm64coopdx.com/mods/cs-yumpi.199/)
- [2017x](https://mods.sm64coopdx.com/mods/cs-2017x.653/)