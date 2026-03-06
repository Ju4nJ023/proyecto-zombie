# ============================================================
# SETUP - Instalar sistema de transporte
# Ejecutar con: /function isla_transport:setup
# ============================================================

# Eliminar entidades previas
kill @e[type=minecraft:villager,tag=guia_isla]
kill @e[type=minecraft:interaction,tag=guia_interaccion]
kill @e[type=minecraft:boat,tag=barca_viaje]

# Crear scoreboards
# DETECCION DE CLICK: se incrementa al abrir GUI del aldeano
scoreboard objectives add talked_villager minecraft.custom:minecraft.talked_to_villager
# MENU: trigger para opciones clickeables (funciona sin OP)
scoreboard objectives add isla_destino trigger
# GEAR SCORE
scoreboard objectives add gear_score dummy

# Resetear scores de todos los jugadores
scoreboard players set @a talked_villager 0

# Limpiar legacy
setblock 968 63 377 air

# Invocar aldeano guia (Offers vacio = GUI se abre y cierra rapido)
summon minecraft:villager 967 63 377 {Tags:["guia_isla"],NoAI:1b,Invulnerable:1b,Silent:1b,Offers:{Recipes:[]},CustomName:'{"text":"Guía de Islas","color":"aqua","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"}}

# Confirmacion
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Sistema instalado. Haz click derecho al Guía de Islas.","color":"green"}]
