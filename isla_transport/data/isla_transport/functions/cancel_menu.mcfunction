# ============================================================
# CANCEL_MENU - Cancelar y limpiar todo automaticamente
# ============================================================

# Limpiar todos los tags de interaccion
tag @s remove en_menu
tag @s remove en_advertencia
scoreboard players set @s isla_destino 0

# Limpiar HUD
title @s actionbar {"text":""}

# Mensaje discreto
tellraw @s [{"text":"[Guía] ","color":"dark_gray","italic":true},{"text":"Viaje cancelado. Vuelve cuando quieras.","color":"dark_gray","italic":true}]
