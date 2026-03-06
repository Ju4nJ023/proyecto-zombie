# ============================================================
# MAIN_TICK - Orquestador principal (cada tick)
# ============================================================

# 1. DETECCION DE CLICK DERECHO AL ALDEANO
# talked_villager se incrementa automaticamente al abrir GUI del aldeano
# Solo activar si el jugador esta cerca de NUESTRO aldeano (no cualquier otro)
execute as @a[scores={talked_villager=1..},tag=!en_menu,tag=!en_advertencia,tag=!viajando_jugador] at @s if entity @e[type=minecraft:villager,tag=guia_isla,distance=..5] run function isla_transport:interaction

# Resetear score siempre (para que no se acumule con otros aldeanos)
scoreboard players set @a[scores={talked_villager=1..}] talked_villager 0

# 2. Habilitar trigger para jugadores en menu
scoreboard players enable @a[tag=en_menu] isla_destino
scoreboard players enable @a[tag=en_advertencia] isla_destino

# 3. Detectar seleccion de destino
execute as @a[tag=en_menu,scores={isla_destino=1}] run function isla_transport:check_volcan
execute as @a[tag=en_menu,scores={isla_destino=2}] run function isla_transport:select_coral

# 4. Detectar respuesta de advertencia
execute as @a[tag=en_advertencia,scores={isla_destino=3}] run function isla_transport:confirm_volcan
execute as @a[tag=en_advertencia,scores={isla_destino=4}] run function isla_transport:cancel_menu

# 5. Cancelar si se aleja
execute as @a[tag=en_menu] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..5] run function isla_transport:cancel_menu
execute as @a[tag=en_advertencia] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..5] run function isla_transport:cancel_menu

# 6. Viaje activo
execute if entity @e[tag=viajando_guia] run function isla_transport:tick
