clear @s knowledge_book

function custom_block:custom_wand/give

advancement revoke @s only custom_block:recipe_custom_wand
recipe take @s custom_block:custom_wand
