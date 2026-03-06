# ============================================================
# INTERACTION - Menu de dialogo del aldeano guia
# Se ejecuta cuando un jugador hace click derecho al aldeano
# ============================================================

# Marcar al jugador mas cercano como en dialogo
execute at @s run tag @a[distance=..3,limit=1,sort=nearest,tag=!viajando_jugador] add en_dialogo

# Habilitar trigger y resetear valor
scoreboard players enable @a[tag=en_dialogo] isla_destino
scoreboard players set @a[tag=en_dialogo] isla_destino 0

# Mostrar menu de destinos con opciones clickeables
# Usa /trigger (funciona para TODOS los jugadores, no necesita OP)
execute at @s run tellraw @a[distance=..5,tag=en_dialogo] ["\n",{"text":"══════════════════════════════\n","color":"dark_gray"},{"text":"  ","color":"white"},{"text":"¿A dónde quieres viajar?\n","color":"gold","bold":true},{"text":"══════════════════════════════\n","color":"dark_gray"},"\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Volcán]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 1"},"hoverEvent":{"action":"show_text","value":{"text":"Viajar a la Isla Volcán","color":"red"}}},"\n\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Coral]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 2"},"hoverEvent":{"action":"show_text","value":{"text":"Viajar a la Isla Coral","color":"aqua"}}},"\n\n",{"text":"══════════════════════════════\n","color":"dark_gray"}]

# Limpiar datos de interaccion para no repetir
data remove entity @s interaction
