# ============================================================
# SETUP - Invocar al aldeano guia de transporte entre islas
# Ejecutar con: /function isla_transport:setup
# ============================================================

# Eliminar aldeanos guia previos para evitar duplicados
kill @e[type=minecraft:villager,tag=guia_isla]

# Invocar al aldeano guia en la posicion del jugador
# - guia_isla: tag identificador
# - NoAI:1b: sin inteligencia artificial (no se mueve solo)
# - Invulnerable:1b: no recibe daño
# - Silent:1b: no emite sonidos
# - Offers:{}: sin intercambios comerciales
# - CustomName: nombre visible sobre la cabeza
# - VillagerData: aspecto visual (nitwit para diferenciar)
summon minecraft:villager 967 63 377 {Tags:["guia_isla"],NoAI:1b,Invulnerable:1b,Silent:1b,Offers:{},CustomName:'{"text":"Guia de Islas","color":"aqua","bold":true}',VillagerData:{profession:"minecraft:nitwit",level:99,type:"minecraft:plains"}}

# Confirmacion
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Aldeano guia invocado correctamente. Acercate para iniciar el viaje.","color":"green"}]
