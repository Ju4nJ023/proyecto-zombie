# ============================================================
# MAIN_TICK - Añadido para Guías de Regreso
# ============================================================

# Detectar interacciones con los Guías de Regreso
execute as @a at @s if entity @e[type=minecraft:villager,tag=guia_regreso,distance=..3] run function isla_transport:return_interact
