# Sky Barrel Setup
setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items set value []

# Insert Blank Rocket
loot insert ~ 319 ~ loot fireworks:random_rocket

# Randomize
function fireworks:generate_rocket_properties

# Add Trade & Copy
data modify entity @s Offers.Recipes append value {maxUses:16, xp:5, buy:{id:"minecraft:emerald", count:3}, sell:{id:"minecraft:stone", count:4}}
data modify entity @s Offers.Recipes[-1].sell set from block ~ 319 ~ Items[0]
data modify entity @s Offers.Recipes[-1].sell.count set value 4

# Clean up
setblock ~ 319 ~ minecraft:air