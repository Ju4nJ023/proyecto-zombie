# ============================================================
# INTERACTION - Menu en el chat al hacer click derecho
# Se ejecuta como @s = la entidad de interaccion
# ============================================================

# Marcar jugador mas cercano en menu
execute at @s run tag @a[distance=..4,limit=1,sort=nearest,tag=!viajando_jugador,tag=!en_menu,tag=!en_advertencia] add en_menu

# Habilitar trigger
scoreboard players enable @a[tag=en_menu] isla_destino
scoreboard players set @a[tag=en_menu] isla_destino 0

# Mostrar menu clickeable en el chat
execute at @s run tellraw @a[distance=..5,tag=en_menu] ["\n",{"text":"═══════════════════════════════\n","color":"dark_gray"},{"text":"  ¿A dónde quieres viajar?\n","color":"gold","bold":true},{"text":"═══════════════════════════════\n","color":"dark_gray"},"\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Volcán]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 1"},"hoverEvent":{"action":"show_text","value":{"text":"Destino peligroso","color":"red"}}},"\n\n",{"text":"  ► ","color":"gray"},{"text":"[Isla Coral]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/trigger isla_destino set 2"},"hoverEvent":{"action":"show_text","value":{"text":"Destino tranquilo","color":"aqua"}}},"\n\n",{"text":"═══════════════════════════════","color":"dark_gray"}]

# Limpiar datos de interaccion
data remove entity @s interaction
