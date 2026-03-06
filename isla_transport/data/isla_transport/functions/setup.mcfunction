# ============================================================
# SETUP - Instalar sistema de transporte entre islas
# Ejecutar con: /function isla_transport:setup
# ============================================================

# Eliminar entidades previas para evitar duplicados
kill @e[type=minecraft:villager,tag=guia_isla]
kill @e[type=minecraft:interaction,tag=guia_interaccion]
kill @e[type=minecraft:boat,tag=barca_viaje]

# Crear scoreboards
scoreboard objectives add gui_check dummy

# Limpiar posicion del barrel GUI
setblock 968 63 377 air

# Invocar al aldeano guia
summon minecraft:villager 967 63 377 {Tags:["guia_isla"],NoAI:1b,Invulnerable:1b,Silent:1b,Offers:{Recipes:[]},CustomName:'{"text":"Guía de Islas","color":"aqua","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"}}

# Invocar entidad de interaccion (detecta click derecho)
summon minecraft:interaction 967 63 377 {Tags:["guia_interaccion"],width:1.5f,height:2.5f,response:1b}

# Confirmacion
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Sistema de transporte instalado. Haz click derecho al Guía de Islas.","color":"green"}]
