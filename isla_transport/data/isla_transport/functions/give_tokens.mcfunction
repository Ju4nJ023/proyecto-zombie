# ============================================================
# GIVE_TOKENS - Dar tokens de viaje al jugador cercano
# ============================================================

# Dar 2 tokens (esmeraldas con nombre personalizado)
give @s minecraft:emerald{display:{Name:'{"text":"Token de Viaje","color":"gold","italic":false}',Lore:['{"text":"Usa en el Guía de Islas","color":"gray","italic":false}']}} 2

# Marcar jugador en menu
tag @s add en_menu

# Mensaje
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"Has recibido ","color":"yellow"},{"text":"2 Tokens de Viaje","color":"gold","bold":true},{"text":". Haz click derecho al guía para elegir destino.","color":"yellow"}]
title @s actionbar [{"text":">>> Click derecho al Guía de Islas >>>","color":"gold","bold":true}]
