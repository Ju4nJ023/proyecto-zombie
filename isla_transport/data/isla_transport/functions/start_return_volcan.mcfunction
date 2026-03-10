# ============================================================
# START_RETURN_VOLCAN
# Destino: 973 63 377
# ============================================================

tag @s add viajando_jugador
tag @s add destino_base

execute as @e[type=minecraft:villager,tag=guia_regreso_volcan,distance=..5,limit=1] run tag @s add viajando_guia
execute as @e[type=minecraft:villager,tag=guia_regreso_volcan,distance=..5,limit=1] run tag @s add destino_base

# The dock is at 1035 to 1041. Water starts at 1034.
execute at @s run tp @e[type=minecraft:villager,tag=viajando_guia,limit=1] 1034.5 63.0 403.5

summon minecraft:boat 1034.5 63.0 403.5 {Tags:["barca_viaje"],NoGravity:0b}

# Invocar motor invisible
summon minecraft:armor_stand 1034.5 63.0 403.5 {Tags:["motor_viaje"],Invisible:1b,NoGravity:1b,Marker:1b}
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,limit=1] run tag @s add destino_base

# Hacer al aldeano VISIBLE para que conduzca
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:0b}

# Subir al aldeano a la barca primero (para que sea el conductor y el jugador no pueda moverla)
ride @e[type=minecraft:villager,tag=viajando_guia,limit=1] mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]

# Subir al jugador a la barca después (pasajero)
ride @s mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]

tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Viaje de regreso a ","color":"yellow"},{"text":"Puerto Base","color":"green","bold":true},{"text":" iniciado!","color":"yellow"}]
title @s title {"text":"Regresando...","color":"yellow","italic":true}

execute at @s run playsound isla_transport:isla_transport.barca master @s ~ ~ ~ 1 1
