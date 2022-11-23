clear @s knowledge_book

give @p item_frame{display:{Name:'{"text":"Invisible Block"}'},EntityTag:{Silent:1b,Tags:["custom_block"],Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:0}},Invulnerable:1b,Invisible:1b,Fixed:1b}} 1

advancement revoke @s only custom_block:recipe_invisible
recipe take @s custom_block:invisible
