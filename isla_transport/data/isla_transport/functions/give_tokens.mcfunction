# ============================================================
# GIVE_TOKENS - Iniciar interaccion con el guia
# ============================================================

# Marcar jugador en menu (esto activa la detección de click derecho en interaction.mcfunction)
tag @s add en_menu

# Mensaje de bienvenida
tellraw @s [{"text":"[Transporte] ","color":"gold","bold":true},{"text":"El Guía te saluda. ","color":"yellow"},{"text":"Consigue Tokens de Viaje en la Taquilla para viajar.","color":"gray","italic":true}]
title @s actionbar [{"text":">>> Click derecho al Guía de Islas >>>","color":"gold","bold":true}]
