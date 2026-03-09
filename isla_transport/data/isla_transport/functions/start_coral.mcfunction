# ============================================================
# START_CORAL - Iniciar viaje a Isla Coral
# Destino: 800 63 500  <<<< CAMBIA ESTAS COORDENADAS A LAS REALES
# ============================================================

# Asignar tags de viaje al jugador
tag @s add viajando_jugador
tag @s add destino_coral

# Asignar tags de viaje al aldeano
execute as @e[type=minecraft:villager,tag=guia_isla] run tag @s add viajando_guia
execute as @e[type=minecraft:villager,tag=guia_isla] run tag @s add destino_coral

# AUTO-MONTAR: Teletransportar aldeano al jugador para inicio suave
execute at @s run tp @e[type=minecraft:villager,tag=viajando_guia,limit=1] ~ 63.0 ~

# Invocar barca en la posicion del jugador
execute at @s run summon minecraft:boat ~ 63.0 ~ {Tags:["barca_viaje"],NoGravity:1b}

# Hacer al aldeano invisible
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:1b}

# Montar al jugador en la barca para inicio inmediato
ride @s mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]

# Mensaje de inicio (protegido por tag)
execute as @s[tag=!mensaje_enviado] run tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Viaje a ","color":"yellow"},{"text":"Isla Coral","color":"aqua","bold":true},{"text":" iniciado!","color":"yellow"}]
tag @s add mensaje_enviado

# Sonido de barca
execute at @s run playsound isla_transport:isla_transport.barca master @s ~ ~ ~ 1 1
