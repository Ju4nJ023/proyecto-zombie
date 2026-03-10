# ============================================================
# TICK - Logica principal del viaje (cada tick)
# Se ejecuta cada tick desde main_tick.mcfunction
# ============================================================

# --- DIRECCION DE LA BARCA Y MOVIMIENTO ---

# 1. El ArmorStand Guia Mira Hacia El Destino
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_volcan] at @s run tp @s ~ ~ ~ facing 1041 63 403
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_coral] at @s run tp @s ~ ~ ~ facing 800 63 500
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_base] at @s run tp @s ~ ~ ~ facing 973 63 377

# 2. Mover el ArmorStand Guia hacia adelante
execute as @e[type=minecraft:armor_stand,tag=motor_viaje] at @s run tp @s ^ ^ ^0.4

# 3. Teletransportar la barca (con sus pasajeros) hacia el ArmorStand
execute as @e[type=minecraft:boat,tag=barca_viaje] at @s run tp @s @e[type=minecraft:armor_stand,tag=motor_viaje,limit=1]

# 4. Fijar la altura de la barca y el motor por si acaso
execute as @e[type=minecraft:armor_stand,tag=motor_viaje] at @s run tp @s ~ 63.0 ~
execute as @e[type=minecraft:boat,tag=barca_viaje] at @s run tp @s ~ 63.0 ~

# --- EFECTO DE SONIDO (REMO Continuo) ---
scoreboard players add @e[tag=viajando_guia] travel_timer 1
execute as @e[tag=viajando_guia,scores={travel_timer=20}] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1
execute as @e[tag=viajando_guia,scores={travel_timer=40}] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1
execute as @e[tag=viajando_guia,scores={travel_timer=60}] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1
execute as @e[tag=viajando_guia,scores={travel_timer=61..}] run scoreboard players set @s travel_timer 0

# --- PARTICULAS DE AGUA ALREDEDOR DE LA BARCA ---
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:bubble_pop ~ ~0.1 ~ 0.5 0.1 0.5 0.01 5
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:splash ~ ~0.1 ~ 0.5 0.1 0.5 0.01 4
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:falling_water ~ ~0.3 ~ 0.3 0.0 0.3 0.01 2

# --- COMPROBAR LLEGADA (Distancia fisica al muelle = 3 bloques) ---
execute as @e[type=minecraft:boat,tag=barca_viaje] at @s if entity @e[tag=motor_viaje,tag=destino_volcan] positioned 1041 63 403 if entity @s[distance=..3] run function isla_transport:finish
execute as @e[type=minecraft:boat,tag=barca_viaje] at @s if entity @e[tag=motor_viaje,tag=destino_coral] positioned 800 63 500 if entity @s[distance=..3] run function isla_transport:finish
execute as @e[type=minecraft:boat,tag=barca_viaje] at @s if entity @e[tag=motor_viaje,tag=destino_base] positioned 973 63 377 if entity @s[distance=..3] run function isla_transport:finish_return
