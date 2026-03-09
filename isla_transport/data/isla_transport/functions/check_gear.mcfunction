# ============================================================
# CHECK_GEAR - Calcular puntuacion de equipo del jugador
# Cuero=1, Oro/Cota=2, Hierro=3, Diamante=5, Netherite=6
# ============================================================

# Resetear puntuacion
scoreboard players set @s gear_score 0

# --- CASCO (Slot 103b) ---
execute if data entity @s Inventory[{Slot:103b,id:"minecraft:leather_helmet"}] run scoreboard players add @s gear_score 1
execute if data entity @s Inventory[{Slot:103b,id:"minecraft:golden_helmet"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:103b,id:"minecraft:chainmail_helmet"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:103b,id:"minecraft:iron_helmet"}] run scoreboard players add @s gear_score 3
execute if data entity @s Inventory[{Slot:103b,id:"minecraft:diamond_helmet"}] run scoreboard players add @s gear_score 5
execute if data entity @s Inventory[{Slot:103b,id:"minecraft:netherite_helmet"}] run scoreboard players add @s gear_score 6

# --- PECHERA (Slot 102b) ---
execute if data entity @s Inventory[{Slot:102b,id:"minecraft:leather_chestplate"}] run scoreboard players add @s gear_score 1
execute if data entity @s Inventory[{Slot:102b,id:"minecraft:golden_chestplate"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:102b,id:"minecraft:chainmail_chestplate"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:102b,id:"minecraft:iron_chestplate"}] run scoreboard players add @s gear_score 3
execute if data entity @s Inventory[{Slot:102b,id:"minecraft:diamond_chestplate"}] run scoreboard players add @s gear_score 5
execute if data entity @s Inventory[{Slot:102b,id:"minecraft:netherite_chestplate"}] run scoreboard players add @s gear_score 6

# --- PANTALONES (Slot 101b) ---
execute if data entity @s Inventory[{Slot:101b,id:"minecraft:leather_leggings"}] run scoreboard players add @s gear_score 1
execute if data entity @s Inventory[{Slot:101b,id:"minecraft:golden_leggings"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:101b,id:"minecraft:chainmail_leggings"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:101b,id:"minecraft:iron_leggings"}] run scoreboard players add @s gear_score 3
execute if data entity @s Inventory[{Slot:101b,id:"minecraft:diamond_leggings"}] run scoreboard players add @s gear_score 5
execute if data entity @s Inventory[{Slot:101b,id:"minecraft:netherite_leggings"}] run scoreboard players add @s gear_score 6

# --- BOTAS (Slot 100b) ---
execute if data entity @s Inventory[{Slot:100b,id:"minecraft:leather_boots"}] run scoreboard players add @s gear_score 1
execute if data entity @s Inventory[{Slot:100b,id:"minecraft:golden_boots"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:100b,id:"minecraft:chainmail_boots"}] run scoreboard players add @s gear_score 2
execute if data entity @s Inventory[{Slot:100b,id:"minecraft:iron_boots"}] run scoreboard players add @s gear_score 3
execute if data entity @s Inventory[{Slot:100b,id:"minecraft:diamond_boots"}] run scoreboard players add @s gear_score 5
execute if data entity @s Inventory[{Slot:100b,id:"minecraft:netherite_boots"}] run scoreboard players add @s gear_score 6
