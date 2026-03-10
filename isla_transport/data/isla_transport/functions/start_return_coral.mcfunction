# ============================================================
# START_RETURN_CORAL
# Destino: 973 63 377
# ============================================================

tag @s add viajando_jugador
tag @s add destino_base

execute as @e[type=minecraft:villager,tag=guia_regreso_coral,distance=..5,limit=1] run tag @s add viajando_guia
execute as @e[type=minecraft:villager,tag=guia_regreso_coral,distance=..5,limit=1] run tag @s add destino_base

# The dock is at 800 to 806. Water starts at 807.
execute at @s run tp @e[type=minecraft:villager,tag=viajando_guia,limit=1] 807.5 63.0 500.5

summon minecraft:boat 807.5 63.0 500.5 {Tags:["barca_viaje"],NoGravity:0b}

# Invocar motor invisible
summon minecraft:armor_stand 807.5 63.0 500.5 {Tags:["motor_viaje"],Invisible:1b,NoGravity:1b,Marker:1b}
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
