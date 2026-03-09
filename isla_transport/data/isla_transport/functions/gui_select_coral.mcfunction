# ============================================================
# GUI_SELECT_CORAL - Jugador eligio Isla Coral
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

# Iniciar viaje a Isla Coral
function isla_transport:start_coral
