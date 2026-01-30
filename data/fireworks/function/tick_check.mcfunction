# Search for any Wandering Trader who hasn't been processed yet.
execute as @e[type=wandering_trader, tag=!fireworks_checked] at @s run function fireworks:process_spawn