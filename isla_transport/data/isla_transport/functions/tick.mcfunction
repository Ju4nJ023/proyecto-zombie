# ============================================================
# TICK - Logica principal del viaje (cada tick)
# Se ejecuta cada tick desde main_tick.mcfunction
# ============================================================

# --- DIRECCION DEL ALDEANO (depende del destino) ---
execute as @e[tag=viajando_guia,tag=destino_volcan] at @s run tp @s ~ ~ ~ facing 1041 63 403
execute as @e[tag=viajando_guia,tag=destino_coral] at @s run tp @s ~ ~ ~ facing 800 63 500

# --- MOVER ALDEANO 0.2 BLOQUES HACIA ADELANTE ---
execute as @e[tag=viajando_guia] at @s run tp @s ^ ^ ^0.2

# --- FIJAR ALTURA Y - NAVEGAR POR LA SUPERFICIE ---
# Esto evita que el aldeano se hunda o siga la profundidad del terreno
execute as @e[tag=viajando_guia] at @s run tp @s ~ 63.0 ~

# --- MOVER BARCA CON EL ALDEANO (misma direccion) ---
execute as @e[tag=viajando_guia,tag=destino_volcan] at @s run tp @e[type=minecraft:boat,tag=barca_viaje] ~ ~ ~ facing 1041 63 403
execute as @e[tag=viajando_guia,tag=destino_coral] at @s run tp @e[type=minecraft:boat,tag=barca_viaje] ~ ~ ~ facing 800 63 500

# --- TELETRANSPORTAR JUGADOR A LA BARCA ---
execute at @e[type=minecraft:boat,tag=barca_viaje,limit=1] run tp @a[tag=viajando_jugador] ~ ~ ~

# --- PARTICULAS DE AGUA ALREDEDOR DE LA BARCA ---
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:bubble_pop ~ ~0.1 ~ 0.5 0.1 0.5 0.01 5
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:splash ~ ~0.1 ~ 0.5 0.1 0.5 0.01 4
execute at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:falling_water ~ ~0.3 ~ 0.3 0.0 0.3 0.01 2

# --- COMPROBAR LLEGADA (segun destino) ---
execute as @e[tag=viajando_guia,tag=destino_volcan] at @s positioned 1041 63 403 if entity @s[distance=..3] run function isla_transport:finish
execute as @e[tag=viajando_guia,tag=destino_coral] at @s positioned 800 63 500 if entity @s[distance=..3] run function isla_transport:finish
