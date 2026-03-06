# ============================================================
# START_VOLCAN - Iniciar viaje a Isla Volcán
# Destino: 1041 63 403
# ============================================================

# Limpiar estado de dialogo
scoreboard players set @s isla_destino 0
tag @s remove en_dialogo

# Asignar tags de viaje al jugador
tag @s add viajando_jugador
tag @s add destino_volcan

# Asignar tags de viaje al aldeano
execute as @e[type=minecraft:villager,tag=guia_isla] run tag @s add viajando_guia
execute as @e[type=minecraft:villager,tag=guia_isla] run tag @s add destino_volcan

# AUTO-MONTAR: Teletransportar aldeano al jugador para inicio suave
execute at @s run tp @e[type=minecraft:villager,tag=viajando_guia,limit=1] ~ 63.0 ~

# Invocar barca en la posicion del jugador
execute at @s run summon minecraft:boat ~ 63.0 ~ {Tags:["barca_viaje"],NoGravity:1b}

# Hacer al aldeano invisible (la barca es el vehiculo visual)
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:1b}

# Teletransportar jugador a la barca para inicio inmediato
execute at @e[type=minecraft:boat,tag=barca_viaje,limit=1] run tp @s ~ ~ ~

# Mensaje de inicio
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Viaje a ","color":"yellow"},{"text":"Isla Volcán","color":"red","bold":true},{"text":" iniciado!","color":"yellow"}]

# Sonido de barca
execute at @s run playsound isla_transport:isla_transport.barca master @s ~ ~ ~ 1 1
