# ============================================================
# FINISH_RETURN - Fin del viaje de regreso al Puerto Base
# ============================================================

# Matar la barca, motor y maniqui falso
kill @e[type=minecraft:boat,tag=barca_viaje]
kill @e[type=minecraft:armor_stand,tag=motor_viaje]
kill @e[type=minecraft:armor_stand,tag=fake_player]

# TP al jugador a la tierra principal (Puerto Base)
effect clear @a[tag=viajando_jugador] minecraft:invisibility
gamemode survival @a[tag=viajando_jugador]
execute as @a[tag=viajando_jugador] run tp @s 968 64 376
execute as @a[tag=viajando_jugador] run tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"¡Has vuelto al ","color":"yellow"},{"text":"Puerto Base","color":"green","bold":true},{"text":"!","color":"yellow"}]
execute as @a[tag=viajando_jugador] run title @s times 20 100 20
execute as @a[tag=viajando_jugador] run title @s subtitle {"text":"Hogar, dulce hogar","color":"gray","italic":true}
execute as @a[tag=viajando_jugador] run title @s title {"text":"PUERTO BASE","color":"green","bold":true}
execute as @a[tag=viajando_jugador] run playsound minecraft:entity.player.levelup master @s

# Hacer visible al guia de regreso otra vez
execute as @e[type=minecraft:villager,tag=viajando_guia] run data merge entity @s {Invisible:0b}

# Mover a los guias de regreso a sus respectivas islas para el proximo uso
execute as @e[type=minecraft:villager,tag=viajando_guia,tag=guia_regreso_volcan] run tp @s 1041.5 63 403.5
execute as @e[type=minecraft:villager,tag=viajando_guia,tag=guia_regreso_coral] run tp @s 800.5 63 500.5

# Limpiar tags de viaje a todos los involucrados
scoreboard players set @a[tag=viajando_jugador] viaje_estado 0
scoreboard players set @a[tag=viajando_jugador] travel_timer 0
tag @a[tag=viajando_jugador] remove destino_base
tag @a[tag=viajando_jugador] remove retorno_desde_volcan
tag @a[tag=viajando_jugador] remove retorno_desde_coral
tag @a[tag=viajando_jugador] remove viajando_jugador

tag @e[tag=viajando_guia] remove destino_base
tag @e[tag=viajando_guia] remove viajando_guia
