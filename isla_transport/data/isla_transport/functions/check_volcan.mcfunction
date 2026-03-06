# ============================================================
# CHECK_VOLCAN - Verificar gear score para Isla Volcan
# UMBRAL: 10 puntos (cambia el numero para ajustar dificultad)
# ============================================================

# Limpiar el item del trade del inventario
clear @s minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}'}}

# Calcular gear score
function isla_transport:check_gear

# Mostrar puntuacion al jugador
tellraw @s [{"text":"[Equipo] ","color":"dark_purple","bold":true},{"text":"Tu puntuación de equipo: ","color":"light_purple"},{"score":{"name":"@s","objective":"gear_score"},"color":"white","bold":true},{"text":"/10","color":"gray"}]

# Si gear >= 10 → viaje directo
execute if score @s gear_score matches 10.. run function isla_transport:confirm_volcan

# Si gear < 10 → mostrar advertencia
execute unless score @s gear_score matches 10.. run function isla_transport:gear_fail
