# ============================================================
# MENU_TICK - Maquina de estados para detectar trades
# ============================================================

# === ESTADO: en_menu (eligiendo destino) ===

# Detectar si el jugador obtuvo Palo (Isla Volcan) usando if data (mas seguro en 1.20)
execute as @a[tag=en_menu] if data entity @s Inventory[{id:"minecraft:stick"}] run scoreboard players set @s gui_check 1
execute as @a[tag=en_menu] if score @s gui_check matches 1 run clear @s minecraft:stick 1
execute as @a[tag=en_menu] if score @s gui_check matches 1 run function isla_transport:check_volcan

# Detectar si el jugador obtuvo Coral Block (Isla Coral) usando if data
execute as @a[tag=en_menu] if data entity @s Inventory[{id:"minecraft:tube_coral_block"}] run scoreboard players set @s gui_check 2
execute as @a[tag=en_menu] if score @s gui_check matches 2 run clear @s minecraft:tube_coral_block 1
execute as @a[tag=en_menu] if score @s gui_check matches 2 run function isla_transport:select_coral

# === ESTADO: cerrando_gui (transicion 1 tick) ===
execute as @a[tag=cerrando_gui] run function isla_transport:warn_volcan

# === ESTADO: en_advertencia (eligiendo si/no) ===

# Detectar "Si, adelante" (lana verde) usando if data
execute as @a[tag=en_advertencia] if data entity @s Inventory[{id:"minecraft:green_wool"}] run scoreboard players set @s gui_check 3
execute as @a[tag=en_advertencia] if score @s gui_check matches 3 run clear @s minecraft:green_wool 1
execute as @a[tag=en_advertencia] if score @s gui_check matches 3 run function isla_transport:confirm_volcan

# Detectar "Me quedo" (lana roja) usando if data
execute as @a[tag=en_advertencia] if data entity @s Inventory[{id:"minecraft:red_wool"}] run scoreboard players set @s gui_check 4
execute as @a[tag=en_advertencia] if score @s gui_check matches 4 run clear @s minecraft:red_wool 1
execute as @a[tag=en_advertencia] if score @s gui_check matches 4 run function isla_transport:cancel_menu
