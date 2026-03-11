# ============================================================
# SETUP - Instalar sistema de transporte entre islas
# Ejecutar con: /function isla_transport:setup
# ============================================================

# Eliminar entidades previas
kill @e[type=minecraft:villager,tag=guia_isla]
kill @e[type=minecraft:villager,tag=vendedor_tokens]
kill @e[type=minecraft:interaction,tag=guia_interaccion]
kill @e[type=minecraft:boat,tag=barca_viaje]
kill @e[type=minecraft:villager,tag=guia_regreso]

# Limpiar tags fantasma de jugadores bugueados
tag @a remove en_menu
tag @a remove en_advertencia
tag @a remove cerrando_gui
tag @a remove viajando_jugador
tag @a remove en_gui

# Crear scoreboards
scoreboard objectives add gear_score dummy
scoreboard objectives add gui_check dummy
scoreboard objectives add return_cooldown dummy
scoreboard objectives add travel_timer dummy
scoreboard objectives add viaje_estado dummy

# Limpiar barrel legacy
setblock 968 63 377 air

# --- CONSTRUIR PUERTO Y TAQUILLA AUTOMATICOS ---

# 1. Limpiar toda el área para evitar asfixias en la colina de tierra
fill 963 63 373 976 68 381 minecraft:air

# 2. Construir la plataforma central del muelle (mucho mas larga)
# Base ancha en la zona de tierra/inicio para la taquilla (X=964 hasta 967)
fill 964 62 374 967 62 379 minecraft:spruce_planks
# Pasarela larga hacia el mar (X=968 hasta 974)
fill 968 62 376 974 62 378 minecraft:spruce_planks

# 3. Barandillas de la pasarela
fill 968 63 376 974 63 376 minecraft:spruce_fence
fill 968 63 378 974 63 378 minecraft:spruce_fence
# Cierre al final de la pasarela
setblock 974 63 377 minecraft:spruce_fence
# Faroles iluminando la pasarela al mar
setblock 974 64 376 minecraft:lantern
setblock 974 64 378 minecraft:lantern
setblock 968 64 376 minecraft:lantern
setblock 968 64 378 minecraft:lantern

# 4. Construir Taquilla (Kiosko Abierto, fácil acceso) en el inicio (Z=375)
# Base del Kiosko
fill 965 62 375 966 62 375 minecraft:dark_oak_planks
# Mostrador abierto
setblock 965 63 375 minecraft:spruce_trapdoor[half=top,facing=south]
setblock 966 63 375 minecraft:spruce_trapdoor[half=top,facing=south]
# Postes estructurales del Kiosko
setblock 965 63 374 minecraft:spruce_fence
setblock 965 64 374 minecraft:spruce_fence
setblock 966 63 374 minecraft:spruce_fence
setblock 966 64 374 minecraft:spruce_fence
# Techo Kiosko
fill 964 65 374 967 65 376 minecraft:spruce_slab[type=bottom]
# Farol Taquilla
setblock 964 64 375 minecraft:lantern[hanging=true]


# Invocar aldeano Guía (Al final del muelle, muy lejos de la taquilla, X=973, mirando hacia la tierra)
summon minecraft:villager 973 63 377 {Tags:["guia_isla"],NoAI:1b,Invulnerable:1b,Silent:1b,Rotation:[90f,0f],CustomName:'{"text":"Guía de Islas","color":"aqua","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"},Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:101,display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}',Lore:['{"text":"Destino peligroso","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0},{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:tube_coral_block",Count:1b,tag:{CustomModelData:102,display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}',Lore:['{"text":"Destino tranquilo","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# Invocar Vendedor de Tokens (Como si estuviera atendiendo el mostrador del Kiosko abierto, mirando hacia el sur/camino)
summon minecraft:villager 965.5 63 374.8 {Tags:["vendedor_tokens"],NoAI:1b,Invulnerable:1b,Silent:1b,Rotation:[0f,0f],CustomName:'{"text":"Taquillero","color":"yellow","bold":true}',VillagerData:{profession:"minecraft:cartographer",level:2,type:"minecraft:plains"},Offers:{Recipes:[{buy:{id:"minecraft:gold_ingot",Count:5b},sell:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}',Lore:['{"text":"Usa en el Guía de Islas","color":"gray","italic":false}']}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# --- CONSTRUIR PUERTO ISLA VOLCÁN ---
# Pasarela larga hacia el mar (hacia el oeste -X)
fill 1035 62 402 1041 62 404 minecraft:spruce_planks
# Barandillas
fill 1035 63 402 1041 63 402 minecraft:spruce_fence
fill 1035 63 404 1041 63 404 minecraft:spruce_fence
setblock 1035 63 403 minecraft:spruce_fence
# Faroles
setblock 1035 64 402 minecraft:lantern
setblock 1035 64 404 minecraft:lantern
setblock 1041 64 402 minecraft:lantern
setblock 1041 64 404 minecraft:lantern
# Guía de Regreso en Isla Volcán (Final del muelle, mirando al mar)
summon minecraft:villager 1041.5 63 403.5 {Tags:["guia_regreso","guia_regreso_volcan"],NoAI:1b,Invulnerable:1b,Silent:1b,Rotation:[-90f,0f],CustomName:'{"text":"Guía de Regreso","color":"green","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"},Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:cherry_boat",Count:1b,tag:{CustomModelData:105,display:{Name:'{"text":"Volver a Puerto Base","color":"yellow","bold":true,"italic":false}'}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# --- CONSTRUIR PUERTO ISLA CORAL ---
# Pasarela larga hacia el mar (hacia el este +X)
fill 800 62 499 806 62 501 minecraft:spruce_planks
# Barandillas
fill 800 63 499 806 63 499 minecraft:spruce_fence
fill 800 63 501 806 63 501 minecraft:spruce_fence
setblock 806 63 500 minecraft:spruce_fence
# Faroles
setblock 800 64 499 minecraft:lantern
setblock 800 64 501 minecraft:lantern
setblock 806 64 499 minecraft:lantern
setblock 806 64 501 minecraft:lantern
# Guía de Regreso en Isla Coral (Final del muelle, mirando al mar)
summon minecraft:villager 800.5 63 500.5 {Tags:["guia_regreso","guia_regreso_coral"],NoAI:1b,Invulnerable:1b,Silent:1b,Rotation:[90f,0f],CustomName:'{"text":"Guía de Regreso","color":"green","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"},Offers:{Recipes:[{buy:{id:"minecraft:emerald",Count:1b,tag:{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}'}}},sell:{id:"minecraft:cherry_boat",Count:1b,tag:{CustomModelData:105,display:{Name:'{"text":"Volver a Puerto Base","color":"yellow","bold":true,"italic":false}'}}},maxUses:9999,rewardExp:0b,xp:0}]}}

# Confirmacion
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Sistema instalado. Acércate al Guía de Islas para viajar.","color":"green"}]
