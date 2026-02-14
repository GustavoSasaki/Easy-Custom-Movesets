# Easy Custom Movesets
This is an extension of Squishy6094 [character-select-coop](https://github.com/Squishy6094/character-select-coop). 

Its objective is to make customizing character movesets easier, such as increasing jump strengths, gravity, or swimming speed.

You can find examples in the [initial-characterstats-table.lua](https://github.com/GustavoSasaki/character-stats/blob/main/initial-characterstats-table.lua).


## Example Stats

| Name              | Explanation | Default Value | Observation |
| :---------------- | :------: | :-------: | :-------:|
| gravity       |   How much gravity affects the character (percentage).  | 100 | |
| jump_strength       |   How much higher all jumps are (percentage).  | 100 | |
| walking_speed       |   How much faster the character can walk  (percentage).  | 100 | |
| in_air_speed       |   How much faster the character can move horizontally in the air  (percentage).  | 100 | |
| disable_damage       | 	Disable damage. | false | |
| ground_pound_jump_on       | 	Allows the character to perform an special jump after ground pound.  | false | Just like Super Mario Odyssey  |
| super_side_flip_on       | 	Allows the character to perform an special side flip after long jump.  | false | |
| wall_slide_on       | 	Allows the character to perform wall slide.  | false | Code created by djoslin0. |
| in_air_jump       | 	How many jumps in the air the character can do | 0 |  |
| glide_dive_on       | The character glide when diving. | false |  |
| kill_toad       | The character can kill toad | false |  |
| yoshi_flutter_on       | The character can yoshi flutter after jumping | false |  |
| peel_out_on       | The character can peel out by pressing UP while not moving. | false | This move was made by atrael2 with help of doggednamed1   |

You can look all the stats at [Here](https://github.com/GustavoSasaki/Easy-Custom-Movesets/wiki) .


## How to Install
- Download the character-select-coop ZIP file from [releases](https://github.com/Squishy6094/character-select-coop/releases) and unzip into mod folder
- Download the easy-custom-movesets ZIP file from [releases](https://github.com/GustavoSasaki/character-stats/releases) and unzip into mod folder
- Optional (enable the use of saultube animation stats): Download the ZIP file from [Credits Jumping Animation](https://mods.sm64coopdx.com/threads/credits-jumping-animation.1959/#post-7532) and unzip into mod folder
- Enable character-select-coop and easy-custom-movesets in sm64coopDX mod screen.

## Adding/Editing movesets
Go to [initial-characterstats-table.lua](https://github.com/GustavoSasaki/character-stats/blob/main/initial-characterstats-table.lua) file and add an new item with the name of your character and the stats you want.

For example, to add the move drop dash to Burger Man, add this to the file. 
```
{
    name = 'Burger Man',
    drop_dash_on = true,
}
```

 [Here](https://github.com/GustavoSasaki/Easy-Custom-Movesets/commit/5092ebb5fc7240add49b0823b41b9da56a45a8f8#diff-0b5af3a80278f43c00a5c257a6f479581e4e82e3c5ab5a31a4bc34415554a1b5R453) is an commit witch I added turkey wario.

## Integrating your mod

Inside your main.lua, after _G.charSelect.character_add , to change the character stats you have to execute _G.customMoves.character_add.

```
-- Default Character Select Code
_G.charSelect.character_add(
    "Custom Model",
    {"Custom Model Description", "Custom Model Description"},
    "Custom Model Creator",
    {r = 255, g = 200, b = 200},
    E_MODEL_CUSTOM_MODEL,
    CT_MARIO,
    get_texture_info("custom-icon")
)

-- Modify character stats if customMoves exists
if _G.customMovesExists then
    _G.customMoves.character_add({
        name = "Custom Model",
        swimming_speed = 500
    })
end
```

For example, to add support to the Iono character mod, I added line 61-63 to the Iono main.lua [Here](https://drive.google.com/file/d/1iDUI6F45hVG3WOxtA0v9cLMkHl9laUra/view) .


## Mods Integrated
- [Asterix](https://mods.sm64coopdx.com/mods/asterix.534/)
- [Azumanga Daioh](https://mods.sm64coopdx.com/mods/azumanga-daioh-64-pack.205/)
- [Baby Mario](https://mods.sm64coopdx.com/mods/cs-baby-mario.48/)
- [Baby Yoshi](https://mods.sm64coopdx.com/mods/cs-baby-yoshi.692/)
- [Charizard](https://mods.sm64coopdx.com/mods/cs-charizardmod.611/)
- [Chicken Jockey](https://mods.sm64coopdx.com/mods/cs-chicken-jockey.789/)
- [Connie](https://mods.sm64coopdx.com/mods/cs-connie-mario-luigi-brothership.207/)
- [Cream the Rabbit](https://mods.sm64coopdx.com/mods/cs-cream-the-rabbit.282/)
- [Croc](https://mods.sm64coopdx.com/mods/cs-croc.522/)
- [Donald Duck](https://mods.sm64coopdx.com/mods/donald-duck.555/)
- [Draco Centauros](https://mods.sm64coopdx.com/mods/cs-draco-centauros.268/)
- [Dry Bones](https://mods.sm64coopdx.com/mods/cs-dry-bones.37/)
- [Ducky](https://mods.sm64coopdx.com/mods/cs-ducky.716/)
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
- [Gold Ship](https://mods.sm64coopdx.com/mods/cs-gold-ship.870/)
- [Hatsune Miku](https://mods.sm64coopdx.com/mods/cs-hatsune-miku.418/)
- [Il Piantissimo](https://mods.sm64coopdx.com/mods/cs-il-piantissimo.583/)
- [Joker Mario](https://mods.sm64coopdx.com/mods/cs-joker-mario.556/)
- [Junio Sonic](https://mods.sm64coopdx.com/mods/junio-sonic-cs.450/)
- [King Penguin](https://mods.sm64coopdx.com/mods/cs-king-penguin.346/)
- [Kid](https://mods.sm64coopdx.com/mods/cs-the-kid.435/)
- [Kirby](https://mods.sm64coopdx.com/mods/cs-kirby.501/)
- [Kitsufae](https://mods.sm64coopdx.com/mods/cs-kitsufae-pack.276/)
- [Lego Mario](https://mods.sm64coopdx.com/mods/cs-lego-mario.553/)
- [Luma](https://mods.sm64coopdx.com/mods/cs-pet-luma.371/)
- [Marty the Thwomp](https://mods.sm64coopdx.com/mods/marty-the-thwomp-64.481/)
- [Mario Party Mario](https://mods.sm64coopdx.com/mods/cs-mario-party-2-mario.903/)
- [Marlow](https://mods.sm64coopdx.com/mods/cs-marlow.808/)
- [Matikanefukukitaru](https://mods.sm64coopdx.com/mods/cs-matikanefukukitaru-uma-plushie.1017/)
- [Marvin the martian](https://mods.sm64coopdx.com/mods/marvin-the-martian.497/)
- [Megumin](https://mods.sm64coopdx.com/mods/cs-megumin.202/)
- [Mips](https://mods.sm64coopdx.com/mods/cs-mips.326/)
- [Mlops Yoshi](https://mods.sm64coopdx.com/mods/cs-mlops-yoshi.214/)
- [Modern Penguin](https://mods.sm64coopdx.com/mods/cs-modern-penguin.1061/)
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
- [Scatman](https://mods.sm64coopdx.com/mods/cs-scatman-john.1027/)
- [Silver](https://mods.sm64coopdx.com/mods/silver-the-hedgehog-cs.398/)
- [Slippy Toad](https://mods.sm64coopdx.com/mods/slippy-toad-64.549/)
- [SMRPG](https://mods.sm64coopdx.com/mods/cs-smrpg-characters.35/)
- [Sonic Classic and Modern Pack](https://mods.sm64coopdx.com/mods/cs-sonic-classic-and-modern-pack.444/)
- [Sonic Randos](https://mods.sm64coopdx.com/mods/sonic-randos-cs.567/)
- [Spamton](https://mods.sm64coopdx.com/mods/cs-spamton.6/)
- [Talking Red](https://mods.sm64coopdx.com/mods/cs-talking-red.164/)
- [Toothless Mini Pack](https://mods.sm64coopdx.com/mods/cs-toothless-mini-pack.540/)
- [Samus Aran](https://mods.sm64coopdx.com/mods/cs-samus-aran.349/)
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
- [Willow](https://mods.sm64coopdx.com/mods/cs-willow.880/)
- [WolfBoltOne](https://mods.sm64coopdx.com/mods/cs-wolfboltone.571/)
- [Yae](https://mods.sm64coopdx.com/mods/yae.597/)
- [Yellow Bird](https://mods.sm64coopdx.com/mods/cs-yellow-bird-chuck.723/)
- [Yosi Cube](https://mods.sm64coopdx.com/mods/cs-yosi-cube.152/)
- [Yui Hirasawa](https://mods.sm64coopdx.com/mods/cs-yui-hirasawa-k-on.258/)
- [Yumpi](https://mods.sm64coopdx.com/mods/cs-yumpi.199/)
- [2017x](https://mods.sm64coopdx.com/mods/cs-2017x.653/)
