setblock ~ ~ ~ minecraft:air destroy
summon item ~ ~0.5 ~ {Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:1,display:{Name:'{"text":"Invisible Block"}'},EntityTag:{Silent:1b,Tags:["custom_block"],Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:1}},Invulnerable:1b,Invisible:1b,Fixed:1b}}}}
kill @s
scoreboard players set breaked on_sight_scan 1
particle minecraft:dripping_water ~ ~ ~
