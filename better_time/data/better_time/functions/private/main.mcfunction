##Detect new players
execute if entity @a[tag=!btSTB, tag=!btHTB] run tag @a[tag=!btSTB, tag=!btHTB] add btSTB

##Player triggers
execute if entity @a[tag=btSTB,scores={enable-time-gui=1..}] run tellraw @a[tag=btSTB,scores={enable-time-gui=1..}] {"text":"Error: Better Time is already enabled for you!","color":"dark_red"}

execute if entity @a[tag=!btSTB,scores={disable-time-gui=1..}] run tellraw @a[tag=!btSTB,scores={disable-time-gui=1..}] {"text":"Error: Better Time is already disabled for you!","color":"dark_red"}

tag @a[tag=btHTB, tag=!btSTB, scores={enable-time-gui=1..}] add btSTB
tag @a[tag=btHTB, tag=btSTB, scores={enable-time-gui=1..}] remove btHTB

tag @a[tag=btSTB, tag=!btHTB, scores={disable-time-gui=1..}] add btHTB
tag @a[tag=btSTB, tag=btHTB, scores={disable-time-gui=1..}] remove btSTB

bossbar set better_time:main players @a[tag=btSTB]

scoreboard players set @a enable-time-gui 0
scoreboard players set @a disable-time-gui 0

scoreboard players enable @a enable-time-gui
scoreboard players enable @a disable-time-gui

##Collect current time data and reformat days if necessary
execute store result score _bt-track btSB run time query daytime

execute store result score _bt-day btSB run time query day

execute if score _bt-day btSB < _bt-oldDay btSB run function better_time:private/ref_day

execute if score _bt-day btSB > _bt-oldDay btSB store result score _bt-oldDay btSB run scoreboard players get _bt-day btSB

scoreboard players operation _bt-reg0 btSB = _bt-track btSB

##Change max value for bossbar to better reflect sleeping times
execute if score _bt-track btSB < _bt-const2 btSB run bossbar set better_time:main max 12544
execute if score _bt-track btSB >= _bt-const2 btSB run bossbar set better_time:main max 11456

##Changes the value in the bossbar depending on the time of day (12000+ will remove 12000 from the current day time to have bossbar progress from 0 to max)
execute if score _bt-track btSB >= _bt-const2 btSB run scoreboard players operation _bt-reg0 btSB -= _bt-const2 btSB

execute store result bossbar better_time:main value run scoreboard players get _bt-reg0 btSB

##Display Time (24h)
scoreboard players operation _bt-reg0 btSB = _bt-track btSB
scoreboard players operation _bt-reg0 btSB /= _bt-const0 btSB
scoreboard players operation _bt-reg0 btSB += _bt-const1 btSB

##Handles times 0am - 5am (since minecraft counts 6am as time 0 ticks)
execute if score _bt-reg0 btSB matches 24 run scoreboard players set _bt-reg0 btSB 0
execute if score _bt-reg0 btSB matches 25 run scoreboard players set _bt-reg0 btSB 1
execute if score _bt-reg0 btSB matches 26 run scoreboard players set _bt-reg0 btSB 2
execute if score _bt-reg0 btSB matches 27 run scoreboard players set _bt-reg0 btSB 3
execute if score _bt-reg0 btSB matches 28 run scoreboard players set _bt-reg0 btSB 4
execute if score _bt-reg0 btSB matches 29 run scoreboard players set _bt-reg0 btSB 5

##Bossbar display, using different symbols for different weather and time statuses
execute if score _bt-track btSB <= _bt-const2 btSB in minecraft:overworld unless predicate better_time:raincheck unless predicate better_time:thundercheck run bossbar set better_time:main name [{"text":"☀ ","color":"#f2de05"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"btSB"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"btSB"},"color":"#f2db29"},{"text":" ☀","color":"#f2de05"}]
execute if score _bt-track btSB <= _bt-const2 btSB in minecraft:overworld if predicate better_time:raincheck run bossbar set better_time:main name [{"text":"☀ ","color":"#f2de05"},{"text":"☔ ","color":"#39baed"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"btSB"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"btSB"},"color":"#f2db29"},{"text":" ☔","color":"#39baed"},{"text":" ☀","color":"#f2de05"}]
execute if score _bt-track btSB <= _bt-const2 btSB in minecraft:overworld if predicate better_time:thundercheck run bossbar set better_time:main name [{"text":"☀ ","color":"#f2de05"},{"text":"⚡ ","color":"#e0f02e"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"btSB"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"btSB"},"color":"#f2db29"},{"text":" ⚡","color":"#e0f02e"},{"text":" ☀","color":"#f2de05"}]

execute if score _bt-track btSB > _bt-const2 btSB in minecraft:overworld unless predicate better_time:raincheck unless predicate better_time:thundercheck run bossbar set better_time:main name [{"text":"☽ ","color":"#bfbfbf"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"btSB"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"btSB"},"color":"#f2db29"},{"text":" ☽","color":"#bfbfbf"}]
execute if score _bt-track btSB > _bt-const2 btSB in minecraft:overworld if predicate better_time:raincheck run bossbar set better_time:main name [{"text":"☽ ","color":"#bfbfbf"},{"text":"☔ ","color":"#39baed"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"btSB"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"btSB"},"color":"#f2db29"},{"text":" ☔","color":"#39baed"},{"text":" ☽","color":"#bfbfbf"}]
execute if score _bt-track btSB > _bt-const2 btSB in minecraft:overworld if predicate better_time:thundercheck run bossbar set better_time:main name [{"text":"☽ ","color":"#bfbfbf"},{"text":"⚡ ","color":"#e0f02e"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"btSB"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"btSB"},"color":"#f2db29"},{"text":" ⚡","color":"#e0f02e"},{"text":" ☽","color":"#bfbfbf"}]
