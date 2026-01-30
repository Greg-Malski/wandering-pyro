# Visual flair: Smoke particles and sound
particle minecraft:firework ~ ~1 ~ 0.5 0.5 0.5 0.1 50 normal
playsound minecraft:entity.firework_rocket.launch master @a ~ ~ ~ 1 1

# Change identity
data merge entity @s {Tags:["pyro_trader"],CustomName:{"color":"gold","text":"Pyrotechnician"}}

# Remove the generic items
data modify entity @s Offers.Recipes set value []

# Generate New Stock
function fireworks:add_rocket_trade
function fireworks:add_buy_trade
function fireworks:add_supply_trade
function fireworks:add_supply_trade
function fireworks:add_rocket_trade
function fireworks:add_buy_trade
function fireworks:add_rocket_trade
function fireworks:add_supply_trade
function fireworks:add_supply_trade
function fireworks:add_supply_trade



# Visual: Make him hold a rocket so players know he is special
item replace entity @s weapon.mainhand with minecraft:firework_rocket