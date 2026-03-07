# ============================================================
# INTERACTION - Dialogo del aldeano guia
# ============================================================

# Limpiar pendiente
tag @s remove menu_pendiente

# Evitar doble activacion
execute if entity @s[tag=en_menu] run return 0

# Marcar en menu
tag @s add en_menu
scoreboard players enable @s isla_destino
scoreboard players set @s isla_destino 0

# ======= TEST: Mensaje simple para confirmar que funciona =======
tellraw @s [{"text":"¡Hola! ","color":"green","bold":true},{"text":"El sistema funciona. Elige destino:","color":"white"}]

# ======= MENU CLICKEABLE =======
tellraw @s ["\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Volcán]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 1"},"hoverEvent":{"action":"show_text","value":{"text":"Destino peligroso","color":"red"}}},"\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Coral]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 2"},"hoverEvent":{"action":"show_text","value":{"text":"Destino tranquilo","color":"aqua"}}}]

# Sonido
execute at @s run playsound minecraft:entity.villager.ambient master @s ~ ~ ~ 1 1
