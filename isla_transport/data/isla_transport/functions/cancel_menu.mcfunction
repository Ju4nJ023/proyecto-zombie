# ============================================================
# CANCEL_MENU - Cancelar menu y limpiar todo
# ============================================================

# Limpiar TODOS los items de trade posibles
clear @s minecraft:stick 1
clear @s minecraft:tube_coral_block 1
clear @s minecraft:green_wool 1
clear @s minecraft:red_wool 1
clear @s minecraft:emerald{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}} 1

# Limpiar todos los tags de menu
tag @s remove en_menu
tag @s remove en_advertencia
tag @s remove cerrando_gui
scoreboard players set @s gui_check 0

# Asegurar que el aldeano esta en su posicion
execute as @e[type=minecraft:villager,tag=guia_isla] run tp @s 973 63 377

# OBLIGATORIO: Si el menu se canceló durante una advertencia roja/verde, tenemos que restaurar sus tradeos de islas normales.
data merge entity @e[type=minecraft:villager,tag=guia_isla,limit=1] {Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:101,display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}',Lore:['{"text":"Destino peligroso","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0},{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:tube_coral_block",Count:1b,tag:{CustomModelData:102,display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}',Lore:['{"text":"Destino tranquilo","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# Mensaje
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Viaje cancelado.","color":"gray"}]
