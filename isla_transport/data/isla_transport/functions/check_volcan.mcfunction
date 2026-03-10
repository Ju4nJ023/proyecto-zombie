# ============================================================
# CHECK_VOLCAN - Viajar a Isla Volcán (Sin validaciones)
# ============================================================

# 1. El item ya se ha limpiado en menu_tick, saltamos ese paso
tellraw @s {"text":"[DEBUG] Iniciando check_volcan","color":"gray"}

# -- CHECK DE EQUIPO --
function isla_transport:check_gear
tellraw @s [{"text":"[Equipo] ","color":"dark_purple","bold":true},{"text":"Tu puntuación de equipo: ","color":"light_purple"},{"score":{"name":"@s","objective":"gear_score"},"color":"white","bold":true},{"text":"/20","color":"gray"}]

execute unless score @s gear_score matches 20.. run give @s minecraft:emerald{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}} 1
execute unless score @s gear_score matches 20.. run function isla_transport:gear_fail
execute unless score @s gear_score matches 20.. run return 0

# Limpiar tags de menu
tag @s remove en_menu
tag @s remove en_advertencia
tag @s remove cerrando_gui
scoreboard players set @s gui_check 0

# Iniciar viaje directamente
function isla_transport:start_volcan
