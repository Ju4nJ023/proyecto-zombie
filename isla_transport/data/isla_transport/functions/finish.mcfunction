# ============================================================
# FINISH - Finalizar viaje al llegar al destino
# ============================================================

# 1. Parar sonido permanentemente
stopsound @a[tag=viajando_jugador] master isla_transport:isla_transport.barca

# 2. Mensajes de llegada
execute if entity @a[tag=viajando_jugador,tag=destino_volcan] run tellraw @a[tag=viajando_jugador] [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Has llegado a ","color":"green"},{"text":"Isla Volcán","color":"red","bold":true},{"text":"!","color":"green"}]
execute if entity @a[tag=viajando_jugador,tag=destino_coral] run tellraw @a[tag=viajando_jugador] [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Has llegado a ","color":"green"},{"text":"Isla Coral","color":"aqua","bold":true},{"text":"!","color":"green"}]

# 3. Eliminar la barca (el jugador y aldeano caen pero los TPearemos al instante)
kill @e[type=minecraft:boat,tag=barca_viaje]

# 4. Efectos visuales y sonido de llegada para el jugador
execute at @a[tag=viajando_jugador] run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 15
execute at @a[tag=viajando_jugador] run particle minecraft:firework ~ ~1 ~ 0.5 0.5 0.5 0.1 10
execute at @a[tag=viajando_jugador] run playsound minecraft:entity.player.levelup master @a[distance=..10] ~ ~ ~ 1 1

# 5. TP del Aldeano Guide a su posición de inicio ANTES del TP del jugador
# Esto evita que el jugador, al llegar a la costa despido, toque al aldeano y se dispare start_travel.mcfunction
tp @s 967 63 377
data merge entity @s {Invisible:0b}

# 6. TP final del Jugador en la costa exacta de la nueva isla
execute if entity @a[tag=viajando_jugador,tag=destino_volcan] run tp @a[tag=viajando_jugador,tag=destino_volcan] 1041 64 403
execute if entity @a[tag=viajando_jugador,tag=destino_coral] run tp @a[tag=viajando_jugador,tag=destino_coral] 800 64 500

# 7. Limpieza absoluta de tags
# Hacemos que dejen de estar marcados como "viajando". El aldeano también pierde el tag de destino.
tag @s remove viajando_guia
tag @s remove destino_volcan
tag @s remove destino_coral

tag @a remove destino_volcan
tag @a remove destino_coral
tag @a remove viajando_jugador
tag @a remove menu_pendiente
tag @a remove en_menu
tag @a remove en_advertencia
tag @a remove mensaje_enviado
