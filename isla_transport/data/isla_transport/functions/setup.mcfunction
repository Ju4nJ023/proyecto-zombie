# ============================================================
# SETUP - Sistema de transporte INFALIBLE
# Ejecutar con: /function isla_transport:setup
# ============================================================

# Limpiar todo
kill @e[type=minecraft:villager,tag=npc_guia]
kill @e[type=minecraft:villager,tag=guia_isla]
kill @e[type=minecraft:interaction,tag=guia_interaccion]
kill @e[type=minecraft:boat,tag=barca_viaje]
tag @a remove en_menu
tag @a remove en_advertencia
tag @a remove menu_pendiente
tag @a remove viajando_jugador

# SCOREBOARDS
scoreboard objectives add hablar_guia minecraft.custom:minecraft.talked_to_villager
scoreboard objectives add isla_destino trigger
scoreboard objectives add gear_score dummy
scoreboard players set @a hablar_guia 0

# INVOCAR ALDEANO - Cartografo con trades reales (garantiza que la GUI se abre)
summon minecraft:villager 967 63 377 {Tags:["npc_guia","guia_isla"],NoAI:1b,Invulnerable:1b,Silent:1b,CustomName:'{"text":"Guía de Islas","color":"aqua","bold":true}',VillagerData:{profession:"minecraft:cartographer",level:5,type:"minecraft:plains"}}

# TEST
tellraw @s [{"text":"[SETUP OK] ","color":"green","bold":true},{"text":"Aldeano invocado. Haz click derecho sobre él.","color":"white"}]
