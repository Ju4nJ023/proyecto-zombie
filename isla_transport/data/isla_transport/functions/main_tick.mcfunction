# ============================================================
# MAIN_TICK - Orquestador principal (se ejecuta cada tick)
# ============================================================

# 1. Sincronizar entidad de interaccion con el aldeano (solo fuera de viaje)
execute as @e[type=minecraft:villager,tag=guia_isla,tag=!viajando_guia] at @s run tp @e[type=minecraft:interaction,tag=guia_interaccion] ~ ~ ~

# 2. Detectar click derecho (solo si no hay viaje activo ni GUI abierta)
execute as @e[type=minecraft:interaction,tag=guia_interaccion] if data entity @s interaction unless entity @e[tag=viajando_guia] unless entity @a[tag=en_gui] run function isla_transport:interaction

# 3. GUI tick (si alguien tiene el menu abierto)
execute if entity @a[tag=en_gui] run function isla_transport:gui_tick

# 4. Si hay viaje activo, ejecutar logica de movimiento
execute if entity @e[tag=viajando_guia] run function isla_transport:tick
