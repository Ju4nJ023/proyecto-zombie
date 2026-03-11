# ============================================================
# TRANSITION - Reposiciona la barca a mitad de viaje
# ============================================================

# Desmontar pasajeros temporalmente para mover
ride @e[type=minecraft:villager,tag=viajando_guia] dismount
ride @e[type=minecraft:armor_stand,tag=fake_player] dismount

# Reposicionar motor y barca segun destino
# Hacia Volcan
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_volcan] run tp @s 1025.5 63.0 403.5 facing 1041 63 403
execute as @e[type=minecraft:boat,tag=barca_viaje] if entity @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_volcan] run tp @s 1025.5 63.0 403.5

# Hacia Coral
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_coral] run tp @s 816.5 63.0 500.5 facing 800 63 500
execute as @e[type=minecraft:boat,tag=barca_viaje] if entity @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_coral] run tp @s 816.5 63.0 500.5

# Hacia Puerto Base
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_base] run tp @s 985.5 63.0 377.5 facing 974 63 377
execute as @e[type=minecraft:boat,tag=barca_viaje] if entity @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_base] run tp @s 985.5 63.0 377.5

# Teletransportar pasajeros y remontarlos
execute at @e[type=minecraft:boat,tag=barca_viaje,limit=1] run tp @e[type=minecraft:villager,tag=viajando_guia] ~ ~ ~
execute at @e[type=minecraft:boat,tag=barca_viaje,limit=1] run tp @e[type=minecraft:armor_stand,tag=fake_player] ~ ~ ~

ride @e[type=minecraft:villager,tag=viajando_guia,limit=1] mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]
ride @e[type=minecraft:armor_stand,tag=fake_player,limit=1] mount @e[type=minecraft:boat,tag=barca_viaje,limit=1]
