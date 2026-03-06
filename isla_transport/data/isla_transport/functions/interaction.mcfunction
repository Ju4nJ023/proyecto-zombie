# ============================================================
# INTERACTION - Menu instantaneo (se activa por proximidad)
# Se ejecuta como @s = el jugador que se acerco al aldeano
# ============================================================

# Marcar jugador en menu
tag @s add en_menu

# Habilitar trigger
scoreboard players enable @s isla_destino
scoreboard players set @s isla_destino 0

# Menu clickeable (trigger = funciona sin OP)
tellraw @s ["\n",{"text":"═══════════════════════════════\n","color":"dark_gray"},{"text":"  ¿A dónde quieres viajar?\n","color":"gold","bold":true},{"text":"═══════════════════════════════\n","color":"dark_gray"},"\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Volcán]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 1"},"hoverEvent":{"action":"show_text","value":{"text":"Destino peligroso","color":"red"}}},"\n\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Coral]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 2"},"hoverEvent":{"action":"show_text","value":{"text":"Destino tranquilo","color":"aqua"}}},"\n\n",{"text":"═══════════════════════════════","color":"dark_gray"}]

# Actionbar de ayuda
title @s actionbar [{"text":"Haz click en una opción del chat para viajar","color":"gold"}]
