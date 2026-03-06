# ============================================================
# GUI_SELECT_VOLCAN - Jugador eligio Isla Volcan
# ============================================================

# Limpiar TODOS los items del GUI del inventario del jugador
clear @s minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}'}}
clear @s minecraft:tube_coral_block{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}'}}
clear @s minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}}

# Eliminar el barrel
setblock 968 63 377 air

# Quitar tag de GUI
tag @s remove en_gui
scoreboard players set @s gui_check 0

# Iniciar viaje a Isla Volcan
function isla_transport:start_volcan
