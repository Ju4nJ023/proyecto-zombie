# ============================================================
# START_TRAVEL - Detectar jugador cercano e iniciar viaje
# Se ejecuta cada tick desde main_tick.mcfunction
# ============================================================

# Solo actuar si el aldeano NO esta ya viajando
# Detectar jugadores a 3 bloques o menos del aldeano guia_isla
# y asignar los tags de viaje

# Paso 1: Al aldeano que tenga un jugador cerca y no este viajando, darle tag viajando_guia
tag @e[type=minecraft:villager,tag=guia_isla,tag=!viajando_guia] add viajando_guia

# Paso 2: Al jugador mas cercano al aldeano, darle tag viajando_jugador
execute as @e[type=minecraft:villager,tag=guia_isla,tag=viajando_guia] at @s run tag @a[distance=..3,tag=!viajando_jugador,limit=1,sort=nearest] add viajando_jugador

# Paso 3: Si ningun jugador fue encontrado, quitar el tag al aldeano
execute as @e[type=minecraft:villager,tag=viajando_guia] at @s unless entity @a[distance=..3,tag=viajando_jugador] run tag @s remove viajando_guia

# Paso 4: Invocar una barca en la posicion del aldeano para transportar al jugador
execute if entity @e[type=minecraft:villager,tag=viajando_guia] as @e[type=minecraft:villager,tag=viajando_guia] at @s run summon minecraft:boat ~ ~ ~ {Tags:["barca_viaje"],NoGravity:1b}

# Paso 5: Hacer que el aldeano sea invisible durante el viaje (la barca es el medio visual)
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:1b}

# Mensaje de inicio de viaje al jugador
execute as @a[tag=viajando_jugador] run tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Viaje iniciado! La barca te llevara a la isla de destino.","color":"yellow"}]

# Reproducir sonido personalizado de barca durante el viaje
execute as @a[tag=viajando_jugador] at @s run playsound isla_transport:isla_transport.barca master @s ~ ~ ~ 1 1
