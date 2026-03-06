# ============================================================
# MAIN_TICK - Orquestador principal (se ejecuta cada tick)
# Registrado en data/minecraft/tags/functions/tick.json
# ============================================================

# Si hay un aldeano guia sin viaje activo y un jugador cerca, iniciar viaje
execute if entity @e[type=minecraft:villager,tag=guia_isla,tag=!viajando_guia] run function isla_transport:start_travel

# Si hay un viaje activo, ejecutar la logica de movimiento
execute if entity @e[type=minecraft:villager,tag=viajando_guia] run function isla_transport:tick
