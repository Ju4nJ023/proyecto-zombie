# ============================================================
# FINISH - Detectar llegada al destino y finalizar viaje
# Se ejecuta desde tick.mcfunction (como el aldeano viajando)
# ============================================================

# Comprobar si el aldeano esta a 2 bloques o menos del destino

# Parar el sonido de la barca
execute positioned 1041 63 403 if entity @s[distance=..2] run stopsound @a[tag=viajando_jugador] master isla_transport:isla_transport.barca

# Mensaje de llegada
execute positioned 1041 63 403 if entity @s[distance=..2] run tellraw @a[tag=viajando_jugador] [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Has llegado a tu destino! Buen viaje.","color":"green"}]

# Teletransportar al jugador al destino (bajarlo en tierra firme, 1 bloque arriba del suelo)
execute positioned 1041 63 403 if entity @s[distance=..2] run tp @a[tag=viajando_jugador] 1041 64 403

# Eliminar la barca de viaje
execute positioned 1041 63 403 if entity @s[distance=..2] run kill @e[type=minecraft:boat,tag=barca_viaje]

# Hacer visible al aldeano de nuevo
execute positioned 1041 63 403 if entity @s[distance=..2] run data merge entity @s {Invisible:0b}

# Quitar tags de viaje
execute positioned 1041 63 403 if entity @s[distance=..2] run tag @a[tag=viajando_jugador] remove viajando_jugador
execute positioned 1041 63 403 if entity @s[distance=..2] run tag @s remove viajando_guia

# Particulas de llegada (celebracion)
execute positioned 1041 63 403 if entity @s[distance=..2] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 15
execute positioned 1041 63 403 if entity @s[distance=..2] at @s run particle minecraft:firework ~ ~1 ~ 0.5 0.5 0.5 0.1 10

# Sonido de llegada
execute positioned 1041 63 403 if entity @s[distance=..2] at @s run playsound minecraft:entity.player.levelup master @a[distance=..10] ~ ~ ~ 1 1
