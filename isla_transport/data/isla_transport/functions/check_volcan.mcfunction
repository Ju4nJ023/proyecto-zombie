# ============================================================
# CHECK_VOLCAN - Verificar gear score para Isla Volcan
# UMBRAL: 10 puntos (cambia el numero para ajustar dificultad)
# ============================================================

# Resetear trigger
scoreboard players set @s isla_destino 0

# Calcular gear score
function isla_transport:check_gear

# Si gear >= 10 → viaje directo
execute if score @s gear_score matches 10.. run function isla_transport:confirm_volcan

# Si gear < 10 → advertencia discreta en el acto
execute unless score @s gear_score matches 10.. run function isla_transport:show_warning
