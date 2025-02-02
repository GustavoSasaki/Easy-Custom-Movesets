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

## Instalation
- Download the character-select-coop ZIP file from [releases](https://github.com/Squishy6094/character-select-coop/releases) and unzip into mod folder
- Download the character-stats ZIP file from [releases](https://github.com/GustavoSasaki/character-stats/releases) and unzip into mod folder


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
- [Azumanga Daioh](https://mods.sm64coopdx.com/mods/azumanga-daioh-64-pack.205/)
- [Baby Mario](https://mods.sm64coopdx.com/mods/cs-baby-mario.48/)
- [Cream the Rabbit](https://mods.sm64coopdx.com/mods/cs-cream-the-rabbit.282/)
- [Hatsune Miku](https://mods.sm64coopdx.com/mods/cs-hatsune-miku.418/)
- [Junio Sonic](https://mods.sm64coopdx.com/mods/junio-sonic-cs.450/)
- [Luma](https://mods.sm64coopdx.com/mods/cs-pet-luma.371/)
- [Megumin](https://mods.sm64coopdx.com/mods/cs-megumin.202/)
- [Mr. L](https://mods.sm64coopdx.com/mods/cs-mr-l.475/)
- [MyMelodyHd](https://mods.sm64coopdx.com/mods/cs-mymelodyhd.535/)
- [Neco-Arc](https://mods.sm64coopdx.com/mods/cs-neco-arc.327/)
- [Pepsiman](https://mods.sm64coopdx.com/mods/cs-pepsiman.88/)
- [SackBoy](https://mods.sm64coopdx.com/mods/cs-sackboy.459/)
- [Silver](https://mods.sm64coopdx.com/mods/silver-the-hedgehog-cs.398/)
- [Sonic Classic and Modern Pack](https://mods.sm64coopdx.com/mods/cs-sonic-classic-and-modern-pack.444/)
- [Toon Link](https://mods.sm64coopdx.com/mods/cs-toon-link.460/)
- [Trumble](https://mods.sm64coopdx.com/mods/cs-tumble.380/)
- [Yui Hirasawa](https://mods.sm64coopdx.com/mods/cs-yui-hirasawa-k-on.258/)