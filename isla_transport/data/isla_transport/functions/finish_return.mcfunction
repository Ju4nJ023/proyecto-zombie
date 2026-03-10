# ============================================================
# FINISH_RETURN - Fin del viaje de regreso al Puerto Base
# ============================================================

# Matar la barca y motor
kill @e[type=minecraft:boat,tag=barca_viaje]
kill @e[type=minecraft:armor_stand,tag=motor_viaje]

# TP al jugador a la tierra principal (Puerto Base)
execute as @a[tag=viajando_jugador] run tp @s 968 64 376
execute as @a[tag=viajando_jugador] run tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Has vuelto al ","color":"yellow"},{"text":"Puerto Base","color":"green","bold":true},{"text":"!","color":"yellow"}]
execute as @a[tag=viajando_jugador] run playsound minecraft:entity.player.levelup master @s

# Hacer visible al guia de regreso otra vez
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:0b}

# Mover a los guias de regreso a sus respectivas islas para el proximo uso
execute as @e[type=minecraft:villager,tag=viajando_guia,tag=guia_regreso_volcan] run tp @s 1041.5 63 403.5
execute as @e[type=minecraft:villager,tag=viajando_guia,tag=guia_regreso_coral] run tp @s 800.5 63 500.5

# Limpiar tags de viaje a todos los involucrados
tag @a[tag=viajando_jugador] remove viajando_jugador
tag @a[tag=destino_base] remove destino_base

tag @e[tag=viajando_guia] remove destino_base
tag @e[tag=viajando_guia] remove viajando_guia
