# ============================================================
# GUI_TICK - Detectar seleccion de item del barrel GUI
# Se ejecuta cada tick mientras un jugador tiene el menu abierto
# ============================================================

# --- DETECTAR SI EL JUGADOR COGIO EL BLOQUE DE MAGMA (Isla Volcan) ---
execute as @a[tag=en_gui] store result score @s gui_check run clear @s minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}'}} 0
execute as @a[tag=en_gui,scores={gui_check=1..}] run function isla_transport:gui_select_volcan

# --- DETECTAR SI EL JUGADOR COGIO EL BLOQUE DE CORAL (Isla Coral) ---
execute as @a[tag=en_gui] store result score @s gui_check run clear @s minecraft:tube_coral_block{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}'}} 0
execute as @a[tag=en_gui,scores={gui_check=1..}] run function isla_transport:gui_select_coral

# --- ANTI-ROBO: limpiar paneles decorativos del inventario ---
execute as @a[tag=en_gui] run clear @s minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}}

# --- CANCELAR SI EL JUGADOR SE ALEJA ---
execute as @a[tag=en_gui] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..6] run function isla_transport:gui_cancel

# --- MOSTRAR RECORDATORIO EN ACTION BAR ---
title @a[tag=en_gui] actionbar [{"text":">>> Abre el barril para elegir destino >>>","color":"gold","bold":true}]
