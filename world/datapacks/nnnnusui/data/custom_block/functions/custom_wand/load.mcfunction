# on_sight_scan
scoreboard objectives remove on_sight_scan
scoreboard objectives add on_sight_scan dummy
scoreboard players set progress on_sight_scan 0
execute if score display debug matches 1 run scoreboard objectives setdisplay sidebar on_sight_scan
