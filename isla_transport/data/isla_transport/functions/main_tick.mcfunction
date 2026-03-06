# ============================================================
# MAIN_TICK - Orquestador principal (cada tick)
# ============================================================

# 1. Sincronizar interaccion con aldeano (fuera de viaje)
execute as @e[type=minecraft:villager,tag=guia_isla,tag=!viajando_guia] at @s run tp @e[type=minecraft:interaction,tag=guia_interaccion] ~ ~ ~

# 2. Detectar click derecho (sin viaje activo)
execute as @e[type=minecraft:interaction,tag=guia_interaccion] if data entity @s interaction unless entity @e[tag=viajando_guia] run function isla_transport:interaction

# 3. Habilitar trigger para jugadores en menu
scoreboard players enable @a[tag=en_menu] isla_destino
scoreboard players enable @a[tag=en_advertencia] isla_destino

# 4. Detectar seleccion de destino
execute as @a[tag=en_menu,scores={isla_destino=1}] run function isla_transport:check_volcan
execute as @a[tag=en_menu,scores={isla_destino=2}] run function isla_transport:select_coral

# 5. Detectar respuesta de advertencia
execute as @a[tag=en_advertencia,scores={isla_destino=3}] run function isla_transport:confirm_volcan
execute as @a[tag=en_advertencia,scores={isla_destino=4}] run function isla_transport:cancel_menu

# 6. Cancelar si se aleja
execute as @a[tag=en_menu] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..6] run function isla_transport:cancel_menu
execute as @a[tag=en_advertencia] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..6] run function isla_transport:cancel_menu

# 7. Limpiar tags huerfanos (jugador se desconecto con tag activo)
execute as @a[tag=en_menu] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..100] run tag @s remove en_menu
execute as @a[tag=en_advertencia] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..100] run tag @s remove en_advertencia

# 8. Viaje activo
execute if entity @e[tag=viajando_guia] run function isla_transport:tick
