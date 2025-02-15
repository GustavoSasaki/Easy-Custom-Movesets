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
| disable_damage       | 	Disable damage. | false | This stast doest not work for water damage, burning damage or bad gas damage |
| ground_pound_dive_on       | 	Allows the character to perform a dive while ground pound. | false |  |
| waft_fart_on       | 	Allows the character to perform an super fart jump while ground pound with Z button. This jump has an limited number of uses per level. | false |  |
| ground_pound_jump_on       | 	Allows the character to perform an special jump after ground pound.  | false | Just like Super Mario Odyssey  |
| saultube_jump_animation       | 	Apply custom single/double/triple jump animation from Saultube  | false | You need to install [Credits Jumping Animation](https://mods.sm64coopdx.com/threads/credits-jumping-animation.1959/#post-7532) to work this stat |
| long_jump_triple_jump_on       | 	Allows the character to perform an triple jump after long jump.  | false | After long jump, press A without pressing Z |
| super_side_flip_on       | 	Allows the character to perform an special side flip after long jump.  | false | |

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
| ground_pound_forward_vel       |  Horizontal velocity of ground pound jump (units).  |  5 |  |
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
- [Cream the Rabbit](https://mods.sm64coopdx.com/mods/cs-cream-the-rabbit.282/)
- [Croc](https://mods.sm64coopdx.com/mods/cs-croc.522/)
- [Dry Bones](https://mods.sm64coopdx.com/mods/cs-dry-bones.37/)
- [Frogsuit Wildcard](https://mods.sm64coopdx.com/mods/cs-frogsuit-wildcard-models.308/)
- [Hatsune Miku](https://mods.sm64coopdx.com/mods/cs-hatsune-miku.418/)
- [Junio Sonic](https://mods.sm64coopdx.com/mods/junio-sonic-cs.450/)
- [King Penguin](https://mods.sm64coopdx.com/mods/cs-king-penguin.346/)
- [Kitsufae](https://mods.sm64coopdx.com/mods/cs-kitsufae-pack.276/)
- [Lego Mario](https://mods.sm64coopdx.com/mods/cs-lego-mario.553/)
- [Luma](https://mods.sm64coopdx.com/mods/cs-pet-luma.371/)
- [Marty the Thwomp](https://mods.sm64coopdx.com/mods/marty-the-thwomp-64.481/)
- [Marvin the martian](https://mods.sm64coopdx.com/mods/marvin-the-martian.497/)
- [Megumin](https://mods.sm64coopdx.com/mods/cs-megumin.202/)
- [Mips](https://mods.sm64coopdx.com/mods/cs-mips.326/)
- [Mr. L](https://mods.sm64coopdx.com/mods/cs-mr-l.475/)
- [MyMelodyHd](https://mods.sm64coopdx.com/mods/cs-mymelodyhd.535/)
- [Nabbit](https://mods.sm64coopdx.com/mods/cs-nabbit.38/)
- [Neco-Arc](https://mods.sm64coopdx.com/mods/cs-neco-arc.327/)
- [Patrick Starfish](https://mods.sm64coopdx.com/mods/cs-patrick-starfish.269/)
- [Pepsiman](https://mods.sm64coopdx.com/mods/cs-pepsiman.88/)
- [QP](https://mods.sm64coopdx.com/threads/cs-qp.670/)
- [SackBoy](https://mods.sm64coopdx.com/mods/cs-sackboy.459/)
- [Silver](https://mods.sm64coopdx.com/mods/silver-the-hedgehog-cs.398/)
- [Slippy Toad](https://mods.sm64coopdx.com/mods/slippy-toad-64.549/)
- [SMRPG](https://mods.sm64coopdx.com/mods/cs-smrpg-characters.35/)
- [Sonic Classic and Modern Pack](https://mods.sm64coopdx.com/mods/cs-sonic-classic-and-modern-pack.444/)
- [Talking Red](https://mods.sm64coopdx.com/mods/cs-talking-red.164/)
- [Saul & Friends](https://mods.sm64coopdx.com/mods/saul-friends.470/)
- [Squidward](https://mods.sm64coopdx.com/mods/squidward-cs.438/)
- [Thomas The Tank Engine](https://mods.sm64coopdx.com/mods/cs-thomas-the-tank-engine.41/)
- [Toon Link](https://mods.sm64coopdx.com/mods/cs-toon-link.460/)
- [Trumble](https://mods.sm64coopdx.com/mods/cs-tumble.380/)
- [Turkey Wario](https://mods.sm64coopdx.com/mods/cs-turkey-wario.411/)
- [VL-Tone and CJes Luigi](https://mods.sm64coopdx.com/mods/cs-vl-tone-and-cjes-luigi.12/)
- [Yui Hirasawa](https://mods.sm64coopdx.com/mods/cs-yui-hirasawa-k-on.258/)