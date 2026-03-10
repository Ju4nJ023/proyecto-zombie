# ============================================================
# RETURN_INTERACT - Iniciar regreso tras comprar el billete
# ============================================================

# Limpiar el item comprado
clear @s minecraft:cherry_boat 1
scoreboard players set @s gui_check 0

# Iniciar viaje de regreso en barca
execute at @s if entity @e[type=minecraft:villager,tag=guia_regreso_volcan,distance=..10] run function isla_transport:start_return_volcan
execute at @s if entity @e[type=minecraft:villager,tag=guia_regreso_coral,distance=..10] run function isla_transport:start_return_coral
