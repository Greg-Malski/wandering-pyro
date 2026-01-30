# Random Color
execute store result storage fireworks:temp color int 1 run random value 0..16777215

# Random Shape
execute store result score #shape_rng fireworks_math run random value 0..4

data modify storage fireworks:temp shape set value "small_ball"
execute if score #shape_rng fireworks_math matches 1 run data modify storage fireworks:temp shape set value "large_ball"
execute if score #shape_rng fireworks_math matches 2 run data modify storage fireworks:temp shape set value "star"
execute if score #shape_rng fireworks_math matches 3 run data modify storage fireworks:temp shape set value "creeper"
execute if score #shape_rng fireworks_math matches 4 run data modify storage fireworks:temp shape set value "burst"

# Trigger the Macro
# Pass the storage data (color and shape) into the macro file.
function fireworks:apply_star_random with storage fireworks:temp