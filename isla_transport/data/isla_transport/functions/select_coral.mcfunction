# ============================================================
# SELECT_CORAL - Seleccionar viaje a Isla Coral (sin gear check)
# ============================================================

# Limpiar items de trade
clear @s minecraft:tube_coral_block{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}'}}
clear @s minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}'}}
clear @s minecraft:emerald{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}

# Limpiar tags de menu
tag @s remove en_menu
scoreboard players set @s gui_check 0

# Iniciar viaje
function isla_transport:start_coral
