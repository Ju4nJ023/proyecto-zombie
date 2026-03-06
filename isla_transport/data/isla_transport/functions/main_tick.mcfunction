# ============================================================
# MAIN_TICK - Orquestador principal (se ejecuta cada tick)
# Registrado en data/minecraft/tags/functions/tick.json
# ============================================================

# 1. Sincronizar entidad de interaccion con el aldeano (solo fuera de viaje)
execute as @e[type=minecraft:villager,tag=guia_isla,tag=!viajando_guia] at @s run tp @e[type=minecraft:interaction,tag=guia_interaccion] ~ ~ ~

# 2. Detectar click derecho (solo si no hay viaje activo ni dialogo abierto)
execute as @e[type=minecraft:interaction,tag=guia_interaccion] if data entity @s interaction unless entity @e[tag=viajando_guia] unless entity @a[tag=en_dialogo] run function isla_transport:interaction

# 3. Mantener trigger habilitado para jugadores en dialogo
scoreboard players enable @a[tag=en_dialogo] isla_destino

# 4. Procesar seleccion de destino
execute as @a[tag=en_dialogo,scores={isla_destino=1}] run function isla_transport:start_volcan
execute as @a[tag=en_dialogo,scores={isla_destino=2}] run function isla_transport:start_coral

# 5. Cancelar dialogo si el jugador se aleja del aldeano
execute as @a[tag=en_dialogo] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..5] run tag @s remove en_dialogo
execute as @a[tag=en_dialogo] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..5] run scoreboard players set @s isla_destino 0

# 6. Si hay viaje activo, ejecutar logica de movimiento
execute if entity @e[tag=viajando_guia] run function isla_transport:tick
