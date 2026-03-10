# ============================================================
# START_VOLCAN - Iniciar viaje a Isla Volcán
# Destino: 1041 63 403
# ============================================================

# Asignar tags de viaje al jugador
tag @s add viajando_jugador
tag @s add destino_volcan

# Asignar tags de viaje al aldeano
execute as @e[type=minecraft:villager,tag=guia_isla] run tag @s add viajando_guia
execute as @e[type=minecraft:villager,tag=guia_isla] run tag @s add destino_volcan

# AUTO-MONTAR: Teletransportar aldeano justo al lado del muelle (en el agua)
execute at @s run tp @e[type=minecraft:villager,tag=viajando_guia,limit=1] 975.5 63.0 377.5

# Invocar barca en el agua (lejos del muelle)
summon minecraft:boat 975.5 63.0 377.5 {Tags:["barca_viaje"],NoGravity:0b}

# Invocar motor invisible
summon minecraft:armor_stand 975.5 63.0 377.5 {Tags:["motor_viaje"],Invisible:1b,NoGravity:1b,Marker:1b}
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,limit=1] run tag @s add destino_volcan

# Hacer al aldeano VISIBLE para que conduzca
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:0b}

# Subir al aldeano a la barca primero (para que sea el conductor y el jugador no pueda moverla)
ride @e[type=minecraft:villager,tag=viajando_guia,limit=1] mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]

# Subir al jugador a la barca después (pasajero)
ride @s mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]

# Mensaje de inicio
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Viaje a ","color":"yellow"},{"text":"Isla Volcán","color":"red","bold":true},{"text":" iniciado!","color":"yellow"}]
title @s title {"text":"Isla Volcán","color":"red","italic":true}

# Sonido de barca al iniciar
execute at @s run playsound isla_transport:isla_transport.barca master @s ~ ~ ~ 1 1
