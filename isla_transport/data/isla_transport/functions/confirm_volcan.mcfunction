# ============================================================
# CONFIRM_VOLCAN - Confirmar viaje a Isla Volcan
# Se ejecuta cuando gear >= 10 o jugador elige "Si, adelante"
# ============================================================

# Limpiar items de trade del inventario
clear @s minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}'}}
clear @s minecraft:green_wool{display:{Name:'{"text":"Sí, adelante","color":"green","bold":true,"italic":false}'}}
clear @s minecraft:red_wool{display:{Name:'{"text":"Me quedo porque le temo al éxito","color":"red","bold":true,"italic":false}'}}
clear @s minecraft:emerald{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}

# Limpiar tags de menu
tag @s remove en_menu
tag @s remove en_advertencia
tag @s remove cerrando_gui
scoreboard players set @s gui_check 0

# Restaurar trades del aldeano a destinos
data merge entity @e[type=minecraft:villager,tag=guia_isla,limit=1] {Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:magma_block",Count:1b,tag:{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}',Lore:['{"text":"Destino peligroso","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0},{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:tube_coral_block",Count:1b,tag:{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}',Lore:['{"text":"Destino tranquilo","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# Iniciar viaje
function isla_transport:start_volcan
