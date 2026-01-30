# Sky Barrel Setup
setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items set value []

# Generate the "Wanted" Item
loot insert ~ 319 ~ loot fireworks:buy_items

# IDENTIFY & TAG (To prevent duplicates)
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:charcoal"}]} run tag @s add buying_charcoal
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:redstone"}]} run tag @s add buying_redstone
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:string"}]} run tag @s add buying_string
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:gold_nugget"}]} run tag @s add buying_gold
execute if block ~ 319 ~ minecraft:barrel{Items:[{id:"minecraft:glowstone_dust"}]} run tag @s add buying_glowstone

# CREATE THE TRADE
data modify entity @s Offers.Recipes append value {maxUses:8, xp:5, buy:{id:"minecraft:stone", count:1}, sell:{id:"minecraft:emerald", count:1}}

# COPY DATA
data modify entity @s Offers.Recipes[-1].buy set from block ~ 319 ~ Items[0]

# CLEAN UP
setblock ~ 319 ~ minecraft:air