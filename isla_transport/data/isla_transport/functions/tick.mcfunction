# ============================================================
# TICK - Logica principal del viaje (cada tick)
# Se ejecuta cada tick desde main_tick.mcfunction
# ============================================================

# --- MOVIMIENTO DEL ALDEANO (invisible, actua como ancla de movimiento) ---
# Paso 1: Hacer que el aldeano mire hacia las coordenadas de destino
execute as @e[type=minecraft:villager,tag=viajando_guia] at @s run tp @s ~ ~ ~ facing 1041 63 403

# Paso 2: Mover al aldeano 0.2 bloques hacia adelante (en la direccion que mira)
execute as @e[type=minecraft:villager,tag=viajando_guia] at @s run tp @s ^ ^ ^0.2

# --- MOVER BARCA CON EL ALDEANO ---
# La barca sigue al aldeano y mira en la misma direccion
execute at @e[type=minecraft:villager,tag=viajando_guia,limit=1] run tp @e[type=minecraft:boat,tag=barca_viaje] ~ ~ ~ facing 1041 63 403

# --- TELETRANSPORTAR JUGADOR A LA BARCA ---
# El jugador se mantiene en la posicion de la barca (sentado visualmente dentro)
execute at @e[type=minecraft:boat,tag=barca_viaje,limit=1] run tp @a[tag=viajando_jugador] ~ ~ ~

# --- PARTICULAS DE AGUA ALREDEDOR DE LA BARCA ---
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:bubble_pop ~ ~0.1 ~ 0.5 0.1 0.5 0.01 5
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:splash ~ ~0.1 ~ 0.5 0.1 0.5 0.01 4
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:falling_water ~ ~0.3 ~ 0.3 0.0 0.3 0.01 2

# --- COMPROBAR LLEGADA ---
execute as @e[type=minecraft:villager,tag=viajando_guia] at @s run function isla_transport:finish
