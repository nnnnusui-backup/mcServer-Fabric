setblock ~ ~ ~ minecraft:air destroy
summon item ~ ~0.5 ~ {Item:{id:"minecraft:item_frame",Count:1b,tag:{display:{Name:'{"text":"Invisible Block"}'},EntityTag:{Silent:1b,Tags:["custom_block"],Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:0}},Invulnerable:1b,Invisible:1b,Fixed:1b}}}}
kill @s
