# Sky Barrel Setup
setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items set value []

# Generate the "Wanted" Item
loot insert ~ 319 ~ loot fireworks:buy_items

# IDENTIFY & TAG (To prevent duplicates)
execute if data block ~ 319 ~ Items[{id:"minecraft:charcoal"}] run scoreboard players set @s fw_buy_char 1
execute if data block ~ 319 ~ Items[{id:"minecraft:redstone"}] run scoreboard players set @s fw_buy_red 1
execute if data block ~ 319 ~ Items[{id:"minecraft:string"}] run scoreboard players set @s fw_buy_str 1
execute if data block ~ 319 ~ Items[{id:"minecraft:gold_nugget"}] run scoreboard players set @s fw_buy_gold 1
execute if data block ~ 319 ~ Items[{id:"minecraft:glowstone_dust"}] run scoreboard players set @s fw_buy_glow 1

# CREATE THE TRADE
execute if data block ~ 319 ~ Items[0] run data modify entity @s Offers.Recipes append value {maxUses:8, xp:5, buy:{id:"minecraft:stone", count:1}, sell:{id:"minecraft:emerald", count:1}}

# COPY DATA
execute if data block ~ 319 ~ Items[0] run data modify entity @s Offers.Recipes[-1].buy set from block ~ 319 ~ Items[0]

# CLEAN UP
setblock ~ 319 ~ minecraft:air