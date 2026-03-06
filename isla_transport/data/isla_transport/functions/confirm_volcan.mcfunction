# ============================================================
# CONFIRM_VOLCAN - Confirmar viaje a Isla Volcan
# (gear suficiente o jugador acepto el riesgo)
# ============================================================

# Limpieza de tags y trigger
tag @s remove en_menu
tag @s remove en_advertencia
scoreboard players set @s isla_destino 0

# Limpiar actionbar
title @s actionbar {"text":""}

# Iniciar viaje
function isla_transport:start_volcan
