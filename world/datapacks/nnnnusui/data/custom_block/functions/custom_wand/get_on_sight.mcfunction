scoreboard players add progress on_sight_scan 1

# val on_scan
execute if score progress on_sight_scan matches 1..50 run tag @s add on_scan
# val detected
execute positioned ^ ^ ^ if entity @e[distance=..1,sort=nearest,limit=1,type=minecraft:item_frame,tag=custom_block,tag=placed] run tag @s add detected

particle minecraft:dripping_water ~ ~ ~

# scan next. (recursive execute)
execute if entity @s[tag=on_scan] if block ^ ^ ^ minecraft:air positioned ^ ^ ^0.1 run function custom_block:custom_wand/get_on_sight

# run custom_block:break at detected item_frame.
execute if score breaked on_sight_scan matches 0 positioned ^ ^ ^ as @e[distance=..1,sort=nearest,limit=1,type=minecraft:item_frame,tag=custom_block,tag=placed] at @s run function custom_block:invisible/break
