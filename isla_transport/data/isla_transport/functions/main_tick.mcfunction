# ============================================================
# MAIN_TICK - Orquestador principal (cada tick)
# ============================================================

# 1. Mensaje de bienvenida a jugadores cercanos al aldeano (si no estan en menu/viaje)
execute as @e[type=minecraft:villager,tag=guia_isla,tag=!viajando_guia] at @s as @a[distance=..5,tag=!en_menu,tag=!en_advertencia,tag=!cerrando_gui,tag=!viajando_jugador] run function isla_transport:give_tokens
# 2. Cancelar menu si jugador se aleja
execute as @a[tag=en_menu] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..10] run function isla_transport:cancel_menu
execute as @a[tag=en_advertencia] at @s unless entity @e[type=minecraft:villager,tag=guia_isla,distance=..10] run function isla_transport:cancel_menu

# 3. Detectar trades del menu
execute if entity @a[tag=en_menu] run function isla_transport:menu_tick
execute if entity @a[tag=cerrando_gui] run function isla_transport:menu_tick
execute if entity @a[tag=en_advertencia] run function isla_transport:menu_tick

# 4. Viaje activo
execute if entity @e[tag=viajando_guia] run function isla_transport:tick

# 5. Detectar compras de Billete de Regreso usando if data
execute as @a if data entity @s Inventory[{id:"minecraft:cherry_boat"}] run scoreboard players set @s gui_check 5
execute as @a if score @s gui_check matches 5 run clear @s minecraft:cherry_boat 1
execute as @a if score @s gui_check matches 5 run function isla_transport:return_interact
