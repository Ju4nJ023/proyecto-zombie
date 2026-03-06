# ============================================================
# INTERACTION - Abrir menu visual (barrel GUI)
# Se ejecuta cuando un jugador hace click derecho al aldeano
# ============================================================

# Marcar al jugador mas cercano como en GUI
execute at @s run tag @a[distance=..3,limit=1,sort=nearest,tag=!viajando_jugador,tag=!en_gui] add en_gui

# Colocar barrel con titulo personalizado (1 bloque al este del aldeano)
setblock 968 63 377 minecraft:barrel[facing=west]{CustomName:'{"text":"Destinos de Viaje","color":"gold","bold":true}'}

# --- RELLENAR BARREL: Paneles de cristal gris (decoracion) ---
item replace block 968 63 377 container.0 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.1 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.2 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.3 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.4 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.5 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.6 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.7 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.8 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.9 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.10 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.12 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.13 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.14 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.16 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.17 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.18 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.19 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.20 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.21 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.22 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.23 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.24 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.25 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1
item replace block 968 63 377 container.26 with minecraft:gray_stained_glass_pane{display:{Name:'{"text":" ","italic":false}'}} 1

# --- ISLA VOLCAN (slot 11 = fila central, posicion 3) ---
item replace block 968 63 377 container.11 with minecraft:magma_block{display:{Name:'{"text":"Isla Volcán","color":"red","bold":true,"italic":false}',Lore:['{"text":"Coge este bloque para viajar","color":"gray","italic":false}']}} 1

# --- ISLA CORAL (slot 15 = fila central, posicion 7) ---
item replace block 968 63 377 container.15 with minecraft:tube_coral_block{display:{Name:'{"text":"Isla Coral","color":"aqua","bold":true,"italic":false}',Lore:['{"text":"Coge este bloque para viajar","color":"gray","italic":false}']}} 1

# Limpiar datos de interaccion
data remove entity @s interaction

# Mensaje en action bar
title @a[tag=en_gui] actionbar [{"text":">>> Abre el barril para elegir destino >>>","color":"gold","bold":true}]
