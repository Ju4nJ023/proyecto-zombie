# ============================================================
# TICK - Logica principal del viaje (cada tick)
# Se ejecuta cada tick desde main_tick.mcfunction
# ============================================================

# --- MOVIMIENTO DEL ALDEANO ---
# Paso 1: Hacer que el aldeano mire hacia las coordenadas de destino
# >>> CAMBIAR "100 65 100" POR LAS COORDENADAS DE TU ISLA DE DESTINO <<<
execute as @e[type=minecraft:villager,tag=viajando_guia] at @s run tp @s ~ ~ ~ facing 1041 63 403

# Paso 2: Mover al aldeano 0.2 bloques hacia adelante (en la direccion que mira)
execute as @e[type=minecraft:villager,tag=viajando_guia] at @s run tp @s ^ ^ ^0.2

# --- TELETRANSPORTAR JUGADOR AL ALDEANO ---
# El jugador viajero se teletransporta constantemente a la posicion del aldeano
execute at @e[type=minecraft:villager,tag=viajando_guia,limit=1] run tp @a[tag=viajando_jugador] ~ ~ ~

# --- PARTICULAS ---
# Particulas de burbujas en los pies del aldeano mientras se mueve
execute at @e[type=minecraft:villager,tag=viajando_guia] run particle minecraft:bubble_pop ~ ~0.1 ~ 0.3 0.1 0.3 0.01 3
execute at @e[type=minecraft:villager,tag=viajando_guia] run particle minecraft:splash ~ ~0.1 ~ 0.3 0.1 0.3 0.01 2

# --- COMPROBAR LLEGADA ---
# Ejecutar finish para verificar si el aldeano llego al destino
execute as @e[type=minecraft:villager,tag=viajando_guia] at @s run function isla_transport:finish
