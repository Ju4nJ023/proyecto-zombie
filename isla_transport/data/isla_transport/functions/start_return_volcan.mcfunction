# ============================================================
# START_RETURN_VOLCAN
# Destino: 973 63 377
# ============================================================

# Asignar tags de viaje
tag @s add viajando_jugador
tag @s add destino_base
tag @s add retorno_desde_volcan
scoreboard players set @s viaje_estado 1
scoreboard players set @s travel_timer 0

# Ocultar al jugador real
effect give @s minecraft:invisibility 9999 1 true
gamemode spectator @s

tag @s add viajando_jugador
tag @s add destino_base
tag @s add retorno_desde_volcan
scoreboard players set @s viaje_estado 1

execute as @e[type=minecraft:villager,tag=guia_regreso_volcan,distance=..5,limit=1] run tag @s add viajando_guia
execute as @e[type=minecraft:villager,tag=guia_regreso_volcan,distance=..5,limit=1] run tag @s add destino_base

# Restaurar visibilidad del guia
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:0b}
execute at @s run tp @e[type=minecraft:villager,tag=viajando_guia,limit=1] 1038.5 63.0 403.5

summon minecraft:boat 1038.5 63.0 403.5 {Tags:["barca_viaje"],NoGravity:0b}

# Invocar motor invisible
summon minecraft:armor_stand 1038.5 63.0 403.5 {Tags:["motor_viaje"],Invisible:1b,NoGravity:1b,Marker:1b,Rotation:[-90f,0f]}
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,limit=1] run tag @s add destino_base

# Invocar Fake Player (representacion del usuario en el barco)
summon armor_stand 1038.5 63.0 403.5 {Tags:["fake_player"],ShowArms:1b,NoGravity:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b},{id:"minecraft:leather_leggings",Count:1b},{id:"minecraft:leather_chestplate",Count:1b},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"mpilata"}}]}

# Montar pasajeros
ride @e[type=minecraft:villager,tag=viajando_guia,limit=1] mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]
ride @e[type=minecraft:armor_stand,tag=fake_player,limit=1] mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]

tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Viaje de regreso a ","color":"yellow"},{"text":"Puerto Base","color":"green","bold":true},{"text":" iniciado!","color":"yellow"}]
title @s times 20 80 20
title @s subtitle {"text":"Hacia el Puerto Base...","color":"gray","italic":true}
title @s title {"text":"Regresando","color":"green","bold":true}

execute at @s run playsound isla_transport:isla_transport.barca master @s ~ ~ ~ 1 1
