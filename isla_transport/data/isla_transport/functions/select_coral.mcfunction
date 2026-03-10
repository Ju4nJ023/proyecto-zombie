# ============================================================
# SELECT_CORAL - Viajar a Isla Coral (Sin validaciones)
# ============================================================

# 1. El item ya se ha limpiado en menu_tick, saltamos ese paso
tellraw @s {"text":"[DEBUG] Iniciando select_coral","color":"gray"}

# Limpiar tags de menu
tag @s remove en_menu
tag @s remove en_advertencia
tag @s remove cerrando_gui
scoreboard players set @s gui_check 0

# Iniciar viaje
function isla_transport:start_coral
