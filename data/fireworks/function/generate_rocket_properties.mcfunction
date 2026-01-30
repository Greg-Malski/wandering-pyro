# Random Flight Duration (1 to 3)
execute store result score #flight_rng fireworks_math run random value 1..3

# Use a small macro to set the Byte value for flight duration
execute store result storage fireworks:temp flight byte 1 run scoreboard players get #flight_rng fireworks_math
function fireworks:apply_flight_macro with storage fireworks:temp

# How many explosions? (1 to 3)
execute store result score #count_rng fireworks_math run random value 1..3

# Add the Explosions
# We always add at least one.
function fireworks:add_random_explosion

# If we rolled 2 or 3, add another.
execute if score #count_rng fireworks_math matches 2.. run function fireworks:add_random_explosion

# If we rolled 3, add a third.
execute if score #count_rng fireworks_math matches 3 run function fireworks:add_random_explosion