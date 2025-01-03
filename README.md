# Character-status
This is an extension of Squishy6094 [character-select-coop](https://github.com/Squishy6094/character-select-coop). 

It has the objective of making easy to customize character movesets, such as increase jumps strenghts, gravity or swimming speed.
## Stats

| Name              | Explanation | Default Value | Example |
| :---------------- | :------: | ----: | -------:|
| swimming_speed       |   how faster the character can swim in percent   | 100 | 130 -> character swims 30% faster|
| gravity       |   how much gravity acts in percent   | 100 | 130 -> gravity is 30% stronger|
| jump_strength       |   how much higher ALL the jumps are in percent  | 100 | 130 -> every jump is 30% higher|
| single_jump_strength       |   how much higher single jump are in percent  | 100 | |
| double_jump_strength       |   how much higher double jump are in percent  | 100 | |
| triple_jump_strength       |   how much higher triple jump are in percent  | 100 | |
| back_flip_strength       |   how much higher back flip are in percent  | 100 | |
| side_flip_strength       |   how much higher side flip are in percent  | 100 | |
| long_jump_strength       |   how much higher long jump are in percent  | 100 | |
| kick_jump_strength       |   how much higher kick are in percent  | 100 | |
| dive_y_vel       |   y velocity added when dive   | 0 |  15 -> when dive, 15 y velocity is added|
| dive_velocity       |   set foward velocity when dive in percent    | 0 | |
| dive_max_velocity       |   how much greater are dive max foward velocity in percent    | 100 |  |
| long_jump_velocity_multiplier       |   long jump has an foward velocity multiplier based on your current velocity, this makes possible to increase this value in percent  | 100 | |
| long_jump_max_velocity       |   how much greater are long jump max foward velocity in percent  | 100 | 150 -> long jump can go 50% faster than normal |




## Instalation
- get the character-select-coop zip file from [releases](https://github.com/Squishy6094/character-select-coop/releases) and unzip into mod folder
- get the character-stats zip file from [releases](https://github.com/GustavoSasaki/character-stats/releases) and unzip into mod folder


## How customize your character

### Integrating your mod
Inside your main.lua, after _G.charSelect.character_add, you can change character stats by executing _G.charStats.character_add.

```
    _G.charSelect.character_add("Custom Model", {"Custom Model Description", "Custom Model Description"}, "Custom Model Creator", {r = 255, g = 200, b = 200}, E_MODEL_CUSTOM_MODEL, CT_MARIO, get_texture_info("custom-icon"))
    if charStatsExists then
        _G.charStats.character_add({name="Custom Model",swimming_speed=500})
    end
```

### Integrating other people mod
If you cant change the mod files, you can do an pull-request for the file [initial-characterstats-table.lua](https://github.com/GustavoSasaki/character-stats/blob/main/initial-characterstats-table.lua).