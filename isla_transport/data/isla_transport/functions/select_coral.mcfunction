# ============================================================
# SELECT_CORAL - Seleccionar viaje a Isla Coral (sin gear check)
# ============================================================

# Limpieza
tag @s remove en_menu
scoreboard players set @s isla_destino 0

# Limpiar actionbar
title @s actionbar {"text":""}

# Iniciar viaje
function isla_transport:start_coral
