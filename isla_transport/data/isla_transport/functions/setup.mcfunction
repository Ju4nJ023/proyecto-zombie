# ============================================================
# SETUP - Instalar sistema de transporte
# Ejecutar con: /function isla_transport:setup
# ============================================================

# Eliminar entidades previas
kill @e[type=minecraft:villager,tag=guia_isla]
kill @e[type=minecraft:interaction,tag=guia_interaccion]
kill @e[type=minecraft:boat,tag=barca_viaje]

# Crear scoreboards
scoreboard objectives add isla_destino trigger
scoreboard objectives add gear_score dummy

# Limpiar legacy
setblock 968 63 377 air

# Invocar aldeano guia
summon minecraft:villager 967 63 377 {Tags:["guia_isla"],NoAI:1b,Invulnerable:1b,Silent:1b,Offers:{Recipes:[]},CustomName:'{"text":"Guía de Islas","color":"aqua","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"}}

# Entidad de interaccion GRANDE (captura click antes que el aldeano)
# width:3 y height:3 = cubre completamente al aldeano
summon minecraft:interaction 967 63 377 {Tags:["guia_interaccion"],width:3.0f,height:3.0f,response:1b}

# Confirmacion
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Sistema instalado. Haz click derecho al Guía de Islas.","color":"green"}]
