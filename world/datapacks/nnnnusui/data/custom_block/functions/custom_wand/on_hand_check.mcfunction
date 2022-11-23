# check onhand
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:0}}}] at @s run function custom_block:custom_wand/on_hand
# check offhand
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:0}}]}] at @s run function custom_block:custom_wand/on_hand
