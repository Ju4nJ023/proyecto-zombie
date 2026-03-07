# ============================================================
# INTERACTION - Dialogo del aldeano guia (Chat Menu)
# ============================================================

# Limpiar pendiente para que no se ejecute en bucle
tag @s remove menu_pendiente

# Marcar en menu
tag @s add en_menu

# Habilitar trigger para que funcionen los clicks
scoreboard players enable @s isla_destino
scoreboard players set @s isla_destino 0

# Título y sonido
title @s actionbar [{"text":"Mira el chat de texto para viajar","color":"gold"}]
execute at @s run playsound minecraft:entity.villager.trade master @s ~ ~ ~ 1 1

# ======= MENU CLICKEABLE =======
tellraw @s ["\n",{"text":"[Guía] ","color":"green","bold":true},{"text":"¿A qué isla quieres ir?\n","color":"white"},"\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Volcán]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 1"},"hoverEvent":{"action":"show_text","value":{"text":"Destino peligroso","color":"red"}}},"\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Coral]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 2"},"hoverEvent":{"action":"show_text","value":{"text":"Destino tranquilo","color":"aqua"}}},"\n"]
