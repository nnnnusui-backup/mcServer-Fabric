# debug flag
# display: 1 -> show scoreboard
scoreboard objectives add debug dummy
scoreboard players set display debug 0

# use carrot detector
execute at @a run scoreboard objectives remove stick
execute at @a run scoreboard objectives add stick minecraft.used:minecraft.carrot_on_a_stick
execute at @a run scoreboard players set progress stick 0
execute if score display debug matches 1 at @a run scoreboard objectives setdisplay sidebar stick

# load
execute at @a run function custom_block:custom_wand/load

# init recipes
execute at @a run advancement revoke @s only custom_block:recipe_custom_wand
execute at @a run recipe take @s custom_block:custom_wand
execute at @a run advancement revoke @s only custom_block:recipe_invisible
execute at @a run recipe take @s custom_block:invisible
