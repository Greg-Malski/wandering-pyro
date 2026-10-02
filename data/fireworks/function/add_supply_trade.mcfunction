# Sky Barrel Setup
setblock ~ 319 ~ minecraft:barrel
data modify block ~ 319 ~ Items set value []
loot insert ~ 319 ~ loot fireworks:supplies

# IDENTIFY ITEMS (Single-Item Checks)
execute if data block ~ 319 ~ Items[{id:"minecraft:paper"}] run scoreboard players set @s fw_sup_paper 1
execute if data block ~ 319 ~ Items[{id:"minecraft:gunpowder"}] run scoreboard players set @s fw_sup_gunpow 1
execute if data block ~ 319 ~ Items[{id:"minecraft:fire_charge"}] run scoreboard players set @s fw_sup_charge 1
execute if data block ~ 319 ~ Items[{id:"minecraft:feather"}] run scoreboard players set @s fw_sup_feather 1
execute if data block ~ 319 ~ Items[{id:"minecraft:firework_star"}] run scoreboard players add @s fw_sup_star 1

# Count dyes separately because the supply pool permits two dye trades.
item replace entity @s weapon.mainhand from block ~ 319 ~ container.0
execute if predicate fireworks:is_dye run scoreboard players add @s fw_sup_dyes 1
# Clear hand
item replace entity @s weapon.mainhand with air

# RANDOMIZE STAR (only when this roll produced a star)
execute if data block ~ 319 ~ Items[{id:"minecraft:firework_star"}] run function fireworks:generate_star_properties

# CREATE TRADE
execute if data block ~ 319 ~ Items[0] run data modify entity @s Offers.Recipes append value {maxUses:10, xp:5, buy:{id:"minecraft:emerald", count:1}, sell:{id:"minecraft:stone", count:1}}

# Copy item from Barrel to Trade
execute if data block ~ 319 ~ Items[0] run data modify entity @s Offers.Recipes[-1].sell set from block ~ 319 ~ Items[0]

# CLEAN UP
setblock ~ 319 ~ minecraft:air