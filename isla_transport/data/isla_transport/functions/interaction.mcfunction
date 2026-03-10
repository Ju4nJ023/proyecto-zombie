# ============================================================
# INTERACTION - Abrir menu visual (barrel GUI)
# Se ejecuta cuando un jugador hace click derecho al aldeano
# ============================================================

# --- MENSAJE DE BIENVENIDA ---
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"El Guía te saluda. ","color":"yellow"},{"text":"Consigue Tokens de Viaje en la Taquilla para viajar.","color":"gray","italic":true}]

# --- VERIFICACION DE CLIMA (TORMENTA/LLUVIA) ---
# Si llueve, bloqueamos el viaje
execute as @s if predicate isla_transport:is_raining run tellraw @s [{"text":"[Guía] ","color":"aqua","bold":true},{"text":"Es muy peligroso navegar con este clima. Vuelve cuando escampe.","color":"red"}]
execute as @s if predicate isla_transport:is_raining run playsound minecraft:entity.villager.no master @s
execute as @s if predicate isla_transport:is_raining run data remove entity @s interaction
execute as @s if predicate isla_transport:is_raining run return 0

# --- VERIFICACION DE NOCHE ---
# Eliminar tag antigua por si acaso
execute as @s run tag @s remove viaje_nocturno
# De 13000 a 23000 es la noche en Minecraft
execute as @s if time 13000..23000 run tag @s add viaje_nocturno
execute as @s[tag=viaje_nocturno] run tellraw @s [{"text":"[Guía] ","color":"aqua","bold":true},{"text":"Es de noche. La vuelta cuesta ","color":"gray"},{"text":"2 Tokens","color":"gold","bold":true},{"text":". Espero que los tengas.","color":"gray"}]

# Marcar jugador en menu para loops de deteccion
tag @s add en_menu

# Marcar al jugador mas cercano como en GUI
execute at @s run tag @a[distance=..3,limit=1,sort=nearest,tag=!viajando_jugador,tag=!en_gui] add en_gui

# Mensaje en action bar
title @a[tag=en_gui] actionbar [{"text":">>> Habla con el Guía para elegir destino >>>","color":"gold","bold":true}]
