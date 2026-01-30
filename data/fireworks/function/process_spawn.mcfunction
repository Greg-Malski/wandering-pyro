# Mark this trader immediately so we don't check them again next tick
tag @s add fireworks_checked

execute if predicate fireworks:random_chance run function fireworks:convert_to_pyro