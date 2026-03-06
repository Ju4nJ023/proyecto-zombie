# ============================================================
# INTERACTION - Menu en el chat al hacer click derecho al aldeano
# Se ejecuta como @s = el jugador que hizo click
# ============================================================

# Marcar jugador en menu
tag @s add en_menu

# Habilitar trigger y resetear
scoreboard players enable @s isla_destino
scoreboard players set @s isla_destino 0

# Menu en el chat (texto discreto, opciones clickeables)
tellraw @s ["\n",{"text":"═══════════════════════════════\n","color":"dark_gray"},{"text":"  ¿A qué isla quieres ir?\n","color":"gold","bold":true},{"text":"═══════════════════════════════\n","color":"dark_gray"},"\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Volcán]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 1"},"hoverEvent":{"action":"show_text","value":{"text":"Destino peligroso","color":"red"}}},"\n\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Coral]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 2"},"hoverEvent":{"action":"show_text","value":{"text":"Destino tranquilo","color":"aqua"}}},"\n\n",{"text":"═══════════════════════════════","color":"dark_gray"}]

# Actionbar de ayuda
title @s actionbar [{"text":"Haz click en una opción del chat","color":"gold"}]
