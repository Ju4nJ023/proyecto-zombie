# ============================================================
# GEAR_FAIL - Equipo insuficiente, preparar advertencia
# Teletransporta al aldeano lejos para cerrar el GUI de trades
# ============================================================

# Mensaje de advertencia
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Tu equipo es insuficiente para Isla Volcán!","color":"red"}]
title @s actionbar [{"text":"⚠ ADVERTENCIA ⚠ - Equipo insuficiente","color":"red","bold":true}]

# Forzar cierre del GUI: teletransportar aldeano lejos
execute as @e[type=minecraft:villager,tag=guia_isla] run tp @s ~ ~100 ~

# Cambiar estado (1 tick de transicion)
tag @s remove en_menu
tag @s add cerrando_gui

# Dar tokens extra para los trades de advertencia
give @s minecraft:emerald{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}',Lore:['{"text":"Usa en el Guía de Islas","color":"gray","italic":false}']}} 2
