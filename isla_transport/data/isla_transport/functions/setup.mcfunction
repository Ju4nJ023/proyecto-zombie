# ============================================================
# SETUP - Instalar sistema de transporte entre islas
# Ejecutar con: /function isla_transport:setup
# ============================================================

# Eliminar entidades previas
kill @e[type=minecraft:villager,tag=guia_isla]
kill @e[type=minecraft:interaction,tag=guia_interaccion]
kill @e[type=minecraft:boat,tag=barca_viaje]

# Crear scoreboards
scoreboard objectives add gear_score dummy
scoreboard objectives add gui_check dummy

# Limpiar barrel legacy
setblock 968 63 377 air

# Invocar aldeano con trades de destino preconfigurados
summon minecraft:villager 967 63 377 {Tags:["guia_isla"],NoAI:1b,Invulnerable:1b,Silent:1b,CustomName:'{"text":"Guía de Islas","color":"aqua","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"},Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:magma_block",Count:1b,tag:{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}',Lore:['{"text":"Destino peligroso","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0},{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:tube_coral_block",Count:1b,tag:{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}',Lore:['{"text":"Destino tranquilo","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# Confirmacion
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Sistema instalado. Acércate al Guía de Islas para viajar.","color":"green"}]
