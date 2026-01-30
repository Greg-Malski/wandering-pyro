# Sky Barrel Setup
setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items set value []
loot insert ~ 319 ~ loot fireworks:supplies

# IDENTIFY ITEMS (Single-Item Checks)
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:paper"}]} run tag @s add sold_paper
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:gunpowder"}]} run tag @s add sold_gunpowder
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:fire_charge"}]} run tag @s add sold_fire_charge
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:feather"}]} run tag @s add sold_feather

# IDENTIFY & COUNT: Firework Stars (Limit 3)
tag @s remove found_this_star
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:firework_star"}]} run tag @s add found_this_star

# Logic: Count Up backwards so we don't skip numbers in one tick
execute if entity @s[tag=found_this_star,tag=sold_star_2] run tag @s add sold_star_3
execute if entity @s[tag=found_this_star,tag=sold_star_1,tag=!sold_star_2] run tag @s add sold_star_2
execute if entity @s[tag=found_this_star,tag=!sold_star_1] run tag @s add sold_star_1

# IDENTIFY & COUNT: Dyes (Limit 2)
# Move item to hand to check the Predicate
item replace entity @s weapon.mainhand from block ~ 319 ~ container.0

# Count Up Logic for Dyes
# If is_dye AND we have #1, add #2
execute if predicate fireworks:is_dye if entity @s[tag=sold_dye_1] run tag @s add sold_dye_2
# If is_dye AND we don't have #1, add #1
execute if predicate fireworks:is_dye unless entity @s[tag=sold_dye_1] run tag @s add sold_dye_1

# Clear hand
item replace entity @s weapon.mainhand with air

# RANDOMIZE STAR (Trigger only if we found a star this specific time)
execute if entity @s[tag=found_this_star] run function fireworks:generate_star_properties

# CREATE TRADE
data modify entity @s Offers.Recipes append value {maxUses:10, xp:5, buy:{id:"minecraft:emerald", count:1}, sell:{id:"minecraft:stone", count:1}}

# Copy item from Barrel to Trade
data modify entity @s Offers.Recipes[-1].sell set from block ~ 319 ~ Items[0]

# CLEAN UP
setblock ~ 319 ~ minecraft:air