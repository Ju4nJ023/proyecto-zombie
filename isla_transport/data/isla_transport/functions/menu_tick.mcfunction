# ============================================================
# MENU_TICK - Maquina de estados para detectar trades
# ============================================================

# === ESTADO: en_menu (eligiendo destino) ===

# Detectar si el jugador obtuvo Magma Block (Isla Volcan)
execute as @a[tag=en_menu] store result score @s gui_check run clear @s minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}'}} 0
execute as @a[tag=en_menu,scores={gui_check=1..}] run function isla_transport:check_volcan

# Detectar si el jugador obtuvo Coral Block (Isla Coral)
execute as @a[tag=en_menu] store result score @s gui_check run clear @s minecraft:tube_coral_block{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}'}} 0
execute as @a[tag=en_menu,scores={gui_check=1..}] run function isla_transport:select_coral

# === ESTADO: cerrando_gui (transicion 1 tick) ===
execute as @a[tag=cerrando_gui] run function isla_transport:warn_volcan

# === ESTADO: en_advertencia (eligiendo si/no) ===

# Detectar "Si, adelante" (lana verde)
execute as @a[tag=en_advertencia] store result score @s gui_check run clear @s minecraft:green_wool{display:{Name:'{"text":"Sí, adelante","color":"green","bold":true,"italic":false}'}} 0
execute as @a[tag=en_advertencia,scores={gui_check=1..}] run function isla_transport:confirm_volcan

# Detectar "Me quedo" (lana roja)
execute as @a[tag=en_advertencia] store result score @s gui_check run clear @s minecraft:red_wool{display:{Name:'{"text":"Me quedo porque le temo al éxito","color":"red","bold":true,"italic":false}'}} 0
execute as @a[tag=en_advertencia,scores={gui_check=1..}] run function isla_transport:cancel_menu
