# ============================================================
# SHOW_WARNING - Advertencia discreta por equipo insuficiente
# Aparece en el mismo flujo, sin cerrar/reabrir nada
# ============================================================

# Cambiar estado (menu → advertencia)
tag @s remove en_menu
tag @s add en_advertencia
scoreboard players set @s isla_destino 0
scoreboard players enable @s isla_destino

# Actionbar discreto
title @s actionbar [{"text":"⚠ Tu equipo es insuficiente (","color":"dark_gray"},{"score":{"name":"@s","objective":"gear_score"},"color":"gray"},{"text":"/10) ⚠","color":"dark_gray"}]

# Mensaje discreto con opciones clickeables (dark_gray = poco invasivo)
tellraw @s ["\n",{"text":"[Guía] ","color":"dark_gray","italic":true},{"text":"¿Estás seguro de que quieres ir allí? Es mucho más peligroso.\n","color":"dark_gray","italic":true},"\n",{"text":"  "},{"text":"[SÍ, ADELANTE]","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 3"},"hoverEvent":{"action":"show_text","value":{"text":"Viajar a pesar del riesgo","color":"yellow"}}},{"text":"   "},{"text":"[ME QUEDO, TEMO AL ÉXITO]","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 4"},"hoverEvent":{"action":"show_text","value":{"text":"Cancelar viaje","color":"gray"}}},"\n"]
