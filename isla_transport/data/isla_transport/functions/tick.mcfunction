# ============================================================
# TICK - Logica principal del viaje (Cinematica)
# Se ejecuta CADA TICK *COMO* el jugador (@s) desde main_tick
# ============================================================

scoreboard players add @s travel_timer 1

# === MOVIMIENTO DEL MOTOR (Aplica a Fase 1, 2 y 3) ===
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_volcan] at @s run tp @s ~ ~ ~ facing 1041 63 403
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_coral] at @s run tp @s ~ ~ ~ facing 800 63 500
execute as @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_base] at @s run tp @s ~ ~ ~ facing 973 63 377

# Opcional: El motor mira en linea recta al salir de puerto base en fase 1
execute if score @s viaje_estado matches 1 if entity @s[tag=!destino_base] as @e[type=minecraft:armor_stand,tag=motor_viaje] at @s run tp @s ~ ~ ~ facing 1000 63 377

# Avanzar y arrastrar barco
execute as @e[type=minecraft:armor_stand,tag=motor_viaje] at @s run tp @s ^ ^ ^0.4
execute as @e[type=minecraft:boat,tag=barca_viaje] at @s run tp @s @e[type=minecraft:armor_stand,tag=motor_viaje,limit=1]

# Fijar altura agua
execute as @e[type=minecraft:armor_stand,tag=motor_viaje] at @s run tp @s ~ 63.0 ~
execute as @e[type=minecraft:boat,tag=barca_viaje] at @s run tp @s ~ 63.0 ~


# =========================================
# FASE 1: ZARPANDO (0-80 ticks) - La camara sigue al barco desde un punto fijo relativo
# =========================================
execute if score @s viaje_estado matches 1 if entity @s[tag=destino_volcan] at @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_volcan,limit=1] run tp @s ~-4 ~3 ~-3 90 20
execute if score @s viaje_estado matches 1 if entity @s[tag=destino_coral] at @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_coral,limit=1] run tp @s ~-4 ~3 ~-3 90 20
execute if score @s viaje_estado matches 1 if entity @s[tag=destino_base,tag=retorno_desde_volcan] at @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_base,limit=1] run tp @s ~4 ~3 ~3 -90 20
execute if score @s viaje_estado matches 1 if entity @s[tag=destino_base,tag=retorno_desde_coral] at @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_base,limit=1] run tp @s ~-4 ~3 ~-3 90 20

# Transicion a Fase 2
execute if score @s viaje_estado matches 1 if score @s travel_timer matches 80.. run scoreboard players set @s viaje_estado 2
execute if score @s viaje_estado matches 2 if score @s travel_timer matches 80.. run scoreboard players set @s travel_timer 0


# =========================================
# FASE 2: ALTA MAR (0-80 ticks) Animacion de Camara en Movimiento
# =========================================
# Tick 1: Teleportar la camara al aire sobre el mar a unas coordenadas FIJAS (evita fallos de trozos descargados)
execute if score @s viaje_estado matches 2 if score @s travel_timer matches 1 run tp @s 950.5 80.0 430.5 45 45
execute if score @s viaje_estado matches 2 if score @s travel_timer matches 1 run title @s subtitle {"text":"En alta mar...","color":"dark_gray"}
execute if score @s viaje_estado matches 2 if score @s travel_timer matches 1 run title @s title {"text":" "}

# Movimiento panoramico constante de la camara durante la fase 2
# La camara se desplaza lentamente por el cielo fijo en diagonal
execute if score @s viaje_estado matches 2 at @s run tp @s ^0.1 ^ ^0.2 45 45

# Tick 40: Reposicionar barca silenciosamente
execute if score @s viaje_estado matches 2 if score @s travel_timer matches 40 run function isla_transport:transition

# Tick 78: Ceguera final
execute if score @s viaje_estado matches 2 if score @s travel_timer matches 78 run effect give @s minecraft:blindness 2 1 true

# Transicion a Fase 3
execute if score @s viaje_estado matches 2 if score @s travel_timer matches 80.. run scoreboard players set @s viaje_estado 3
execute if score @s viaje_estado matches 3 if score @s travel_timer matches 80.. run scoreboard players set @s travel_timer 0


# =========================================
# FASE 3: LLEGADA (0-60 ticks) - La camara de nuevo sigue al barco en la distancia
# =========================================
execute if score @s viaje_estado matches 3 if entity @s[tag=destino_volcan] at @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_volcan,limit=1] run tp @s ~4 ~3 ~3 -90 20
execute if score @s viaje_estado matches 3 if entity @s[tag=destino_coral] at @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_coral,limit=1] run tp @s ~-4 ~3 ~-3 90 20
execute if score @s viaje_estado matches 3 if entity @s[tag=destino_base] at @e[type=minecraft:armor_stand,tag=motor_viaje,tag=destino_base,limit=1] run tp @s ~-4 ~3 ~-3 90 20

# Finalizar viaje
execute if score @s viaje_estado matches 3 if score @s travel_timer matches 60.. run scoreboard players set @s viaje_estado 4
execute if score @s viaje_estado matches 4 if entity @s[tag=!destino_base] run function isla_transport:finish
execute if score @s viaje_estado matches 4 if entity @s[tag=destino_base] run function isla_transport:finish_return


# =========================================
# EFECTOS CONSTANTES (Solo Fases 1 y 3)
# =========================================
execute if score @s viaje_estado matches 1 if score @s travel_timer matches 20 as @e[tag=viajando_guia] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1
execute if score @s viaje_estado matches 1 if score @s travel_timer matches 40 as @e[tag=viajando_guia] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1
execute if score @s viaje_estado matches 1 if score @s travel_timer matches 60 as @e[tag=viajando_guia] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1

execute if score @s viaje_estado matches 3 if score @s travel_timer matches 20 as @e[tag=viajando_guia] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1
execute if score @s viaje_estado matches 3 if score @s travel_timer matches 40 as @e[tag=viajando_guia] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1
execute if score @s viaje_estado matches 3 if score @s travel_timer matches 60 as @e[tag=viajando_guia] at @s run playsound minecraft:entity.boat.paddle_water master @a[distance=..20] ~ ~ ~ 1 1

# Particulas
execute if score @s viaje_estado matches 1 at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:splash ~ ~0.1 ~ 0.5 0.1 0.5 0.01 4
execute if score @s viaje_estado matches 3 at @e[type=minecraft:boat,tag=barca_viaje] run particle minecraft:splash ~ ~0.1 ~ 0.5 0.1 0.5 0.01 4
