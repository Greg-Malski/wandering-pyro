# Random Color (0 - 16777215)
execute store result storage fireworks:temp color int 1 run random value 0..16777215

# Random Shape (0-4)
execute store result score #shape_rng fireworks_math run random value 0..4
data modify storage fireworks:temp shape set value "small_ball"
execute if score #shape_rng fireworks_math matches 1 run data modify storage fireworks:temp shape set value "large_ball"
execute if score #shape_rng fireworks_math matches 2 run data modify storage fireworks:temp shape set value "star"
execute if score #shape_rng fireworks_math matches 3 run data modify storage fireworks:temp shape set value "creeper"
execute if score #shape_rng fireworks_math matches 4 run data modify storage fireworks:temp shape set value "burst"

# Random Trail (Coin flip 0-1)
execute store result score #trail_rng fireworks_math run random value 0..1
data modify storage fireworks:temp trail set value "false"
execute if score #trail_rng fireworks_math matches 1 run data modify storage fireworks:temp trail set value "true"

# Random Twinkle (Coin flip 0-1)
execute store result score #twinkle_rng fireworks_math run random value 0..1
data modify storage fireworks:temp twinkle set value "false"
execute if score #twinkle_rng fireworks_math matches 1 run data modify storage fireworks:temp twinkle set value "true"

# INJECT into the Rocket
function fireworks:apply_explosion_macro with storage fireworks:temp