# ============================================================
# GUI_CANCEL - Cancelar menu (jugador se alejo)
# ============================================================

# Limpiar items del GUI del inventario
clear @s minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}'}}
clear @s minecraft:tube_coral_block{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}'}}
clear @s minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}}

# Eliminar el barrel
setblock 968 63 377 air

# Quitar tag
tag @s remove en_gui
scoreboard players set @s gui_check 0

# Mensaje
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Menú cerrado. Vuelve al guía para elegir destino.","color":"gray"}]
