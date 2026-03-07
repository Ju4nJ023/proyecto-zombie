# ============================================================
# MAIN_TICK - Deteccion infalible (cada tick)
# ============================================================

# ===== METODO 1: SCOREBOARD (click derecho al aldeano) =====
# Si hablar_guia >= 1 Y el jugador esta cerca del aldeano guia → interactuar
execute as @a[scores={hablar_guia=1..},tag=!en_menu,tag=!en_advertencia,tag=!viajando_jugador] at @s if entity @e[type=minecraft:villager,tag=npc_guia,distance=..5] run tag @s add menu_pendiente

# ===== METODO 2: PROXIMIDAD (Plan B, a menos de 1.5 bloques) =====
execute as @e[type=minecraft:villager,tag=npc_guia,tag=!viajando_guia] at @s as @a[distance=..1.5,tag=!en_menu,tag=!en_advertencia,tag=!viajando_jugador,tag=!menu_pendiente] run tag @s add menu_pendiente

# ===== RESETEAR SCORE SIEMPRE =====
scoreboard players set @a[scores={hablar_guia=1..}] hablar_guia 0

# ===== EJECUTAR DIALOGO si hay pendiente =====
execute as @a[tag=menu_pendiente] run function isla_transport:interaction

# ===== TRIGGER PARA OPCIONES DEL CHAT =====
scoreboard players enable @a[tag=en_menu] isla_destino
scoreboard players enable @a[tag=en_advertencia] isla_destino

# ===== DETECTAR SELECCION =====
execute as @a[tag=en_menu,scores={isla_destino=1}] run function isla_transport:check_volcan
execute as @a[tag=en_menu,scores={isla_destino=2}] run function isla_transport:select_coral

# ===== DETECTAR ADVERTENCIA =====
execute as @a[tag=en_advertencia,scores={isla_destino=3}] run function isla_transport:confirm_volcan
execute as @a[tag=en_advertencia,scores={isla_destino=4}] run function isla_transport:cancel_menu

# ===== CANCELAR SI SE ALEJA =====
execute as @a[tag=en_menu] at @s unless entity @e[type=minecraft:villager,tag=npc_guia,distance=..5] run function isla_transport:cancel_menu
execute as @a[tag=en_advertencia] at @s unless entity @e[type=minecraft:villager,tag=npc_guia,distance=..5] run function isla_transport:cancel_menu

# ===== VIAJE ACTIVO =====
execute if entity @e[tag=viajando_guia] run function isla_transport:tick
