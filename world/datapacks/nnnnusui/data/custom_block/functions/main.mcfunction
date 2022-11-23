# use minecraft:carrot_on_a_stick
execute as @a[scores={stick=1..}] run function custom_block:custom_wand/on_hand_check
scoreboard players set @a stick 0

# add colision when custom_block placed.
execute as @e[type=minecraft:item_frame,tag=custom_block,tag=!placed] at @s run function custom_block:collision/add
# remove colision when custom_block braked.
#execute as @e[type=minecraft:item_frame,tag=custom_block,tag=placed] at @s if block ~ ~ ~ minecraft:air run function custom_block:collision/remove
