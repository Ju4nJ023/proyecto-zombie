# ============================================================
# LOAD - Inicializacion automatica del Datapack
# Se ejecuta automaticamente cada vez que se usa /reload
# o al cargar el mundo por primera vez.
# ============================================================

# VERIFICACION DE SCOREBOARDS
# Intenta crearlos siempre. Si ya existen, Minecraft simplemente
# dira "Ese objetivo ya existe" internamente y continuara sin error.
scoreboard objectives add hablar_guia minecraft.custom:minecraft.talked_to_villager
scoreboard objectives add isla_destino trigger
scoreboard objectives add gear_score dummy

# INICIALIZACION GLOBAL
# Asegurarse de que el score base de todos sea 0 para evitar bugs en la primera conexion
execute as @a unless score @s hablar_guia matches 0.. run scoreboard players set @s hablar_guia 0

# MENSAJE DE DEBUG / VERSION
# Cambia el numero "1.0" aqui cuando hagas commits en GitHub
tellraw @a [{"text":"[DEBUG] ","color":"dark_gray","bold":true},{"text":"Datapack cargado con éxito. ","color":"aqua"},{"text":"Versión actual: ","color":"yellow"},{"text":"1.0","color":"gold","bold":true}]
