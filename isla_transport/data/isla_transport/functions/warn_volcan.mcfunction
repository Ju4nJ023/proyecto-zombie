# ============================================================
# WARN_VOLCAN - Mostrar trades de advertencia
# Se ejecuta 1 tick despues de gear_fail (aldeano ya cerro GUI)
# ============================================================

# Cambiar trades del aldeano a opciones de advertencia
data merge entity @e[type=minecraft:villager,tag=guia_isla,limit=1] {Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:green_wool",Count:1b,tag:{CustomModelData:103,display:{Name:'{"text":"Sí, adelante","color":"green","bold":true,"italic":false}',Lore:['{"text":"Iniciar viaje a Isla Volcán","color":"gray","italic":false}','{"text":"a pesar del riesgo","color":"dark_gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0},{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:red_wool",Count:1b,tag:{CustomModelData:104,display:{Name:'{"text":"Me quedo porque le temo al éxito","color":"red","bold":true,"italic":false}',Lore:['{"text":"Cancelar viaje","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# Teletransportar aldeano de vuelta a su posición en el muelle
execute as @e[type=minecraft:villager,tag=guia_isla] run tp @s 973 63 377

# Cambiar estado
tag @s remove cerrando_gui
tag @s add en_advertencia

# Mensaje
tellraw @s [{"text":"[Guía] ","color":"aqua","bold":true},{"text":"¿Estás seguro de que quieres ir allí? Es mucho más peligroso.","color":"yellow"}]
title @s actionbar [{"text":">>> Click derecho al Guía para responder >>>","color":"gold","bold":true}]
