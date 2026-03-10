# ============================================================
# FINISH - Finalizar viaje al llegar al destino
# Se ejecuta UNA SOLA VEZ desde tick.mcfunction
# ============================================================

# PASO 1: QUITAR TAG viajando_guia (corta el bucle de tick inmediatamente)
tag @a[tag=viajando_jugador] add llegado
tag @e[tag=viajando_guia] remove viajando_guia

# PASO 2: PARAR SONIDO DE BARCA
stopsound @a[tag=llegado] master isla_transport:isla_transport.barca

# PASO 3: MENSAJE DE LLEGADA (condicional segun destino)
execute if entity @a[tag=llegado,tag=destino_volcan] run tellraw @a[tag=llegado] [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Has llegado a ","color":"green"},{"text":"Isla Volcán","color":"red","bold":true},{"text":"!","color":"green"}]
execute if entity @a[tag=llegado,tag=destino_coral] run tellraw @a[tag=llegado] [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Has llegado a ","color":"green"},{"text":"Isla Coral","color":"aqua","bold":true},{"text":"!","color":"green"}]

# PASO 4: ELIMINAR BARCA Y MOTOR
kill @e[type=minecraft:boat,tag=barca_viaje]
kill @e[type=minecraft:armor_stand,tag=motor_viaje]

# PASO 5: TELETRANSPORTAR JUGADOR AL DESTINO (segun destino)
tp @a[tag=llegado,tag=destino_volcan] 1041 64 403
tp @a[tag=llegado,tag=destino_coral] 800 64 500

# PASO 6: PARTICULAS DE CELEBRACION
execute at @a[tag=llegado] run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 15
execute at @a[tag=llegado] run particle minecraft:firework ~ ~1 ~ 0.5 0.5 0.5 0.1 10

# PASO 7: SONIDO DE LLEGADA
execute at @a[tag=llegado] run playsound minecraft:entity.player.levelup master @a[distance=..10] ~ ~ ~ 1 1

# PASO 8: LIMPIEZA DE TAGS DEL JUGADOR
tag @a[tag=llegado] remove viajando_jugador
tag @a[tag=llegado] remove destino_volcan
tag @a[tag=llegado] remove destino_coral
tag @a[tag=llegado] remove llegado

# PASO 9: RESETEAR ALDEANO (no matar, reutilizar para el proximo viaje)
tag @e[tag=guia_isla] remove destino_volcan
tag @e[tag=guia_isla] remove destino_coral
data merge entity @e[tag=guia_isla,limit=1] {Invisible:0b}
tp @e[tag=guia_isla] 973 63 377
