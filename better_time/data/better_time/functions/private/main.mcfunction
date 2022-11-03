##Player triggers
execute if entity @a[tag=seeTimeBar,scores={btrtime-enable=1..}] run tellraw @a[tag=seeTimeBar,scores={btrtime-enable=1..}] {"text":"Error: You already have better time enabled!","color":"dark_red"}
tag @a[tag=!seeTimeBar,scores={btrtime-enable=1..}] add seeTimeBar

execute if entity @a[tag=!seeTimeBar,scores={btrtime-disable=1..}] run tellraw @a[tag=!seeTimeBar,scores={btrtime-disable=1..}] {"text":"Error: Better time is already disabled!","color":"dark_red"}
tag @a[tag=seeTimeBar,scores={btrtime-disable=1..}] remove seeTimeBar

bossbar set better_time:main players @a[tag=seeTimeBar]

scoreboard players set @a btrtime-enable 0
scoreboard players set @a btrtime-disable 0

scoreboard players enable @a btrtime-enable
scoreboard players enable @a btrtime-disable

##Collect current time data and reformat days if necessary
execute store result score _bt-track addonsGlobal run time query daytime

execute store result score _bt-day addonsGlobal run time query day

execute if score _bt-day addonsGlobal < _bt-oldDay addonsGlobal run function better_time:private/ref_day

execute if score _bt-day addonsGlobal > _bt-oldDay addonsGlobal store result score _bt-oldDay addonsGlobal run scoreboard players get _bt-day addonsGlobal

scoreboard players operation _bt-reg1 addonsGlobal = _bt-track addonsGlobal

##Change max value for bossbar to better reflect sleeping times
execute if score _bt-track addonsGlobal < _bt-const2 addonsGlobal run bossbar set better_time:main max 12544
execute if score _bt-track addonsGlobal >= _bt-const2 addonsGlobal run bossbar set better_time:main max 11456

##Changes the value in the bossbar depending on the time of day (12000+ will remove 12000 from the current day time to have bossbar progress from 0 to max)
execute if score _bt-track addonsGlobal >= _bt-const2 addonsGlobal run scoreboard players operation _bt-reg1 addonsGlobal -= _bt-const2 addonsGlobal

execute store result bossbar better_time:main value run scoreboard players get _bt-reg1 addonsGlobal

##Display Time (24h)
scoreboard players operation _bt-reg0 addonsGlobal = _bt-track addonsGlobal
scoreboard players operation _bt-reg0 addonsGlobal /= _bt-const0 addonsGlobal
scoreboard players operation _bt-reg0 addonsGlobal += _bt-const1 addonsGlobal

##Handles times 0am - 5am (since minecraft counts 6am as time 0 ticks)
execute if score _bt-reg0 addonsGlobal matches 24 run scoreboard players set _bt-reg0 addonsGlobal 0
execute if score _bt-reg0 addonsGlobal matches 25 run scoreboard players set _bt-reg0 addonsGlobal 1
execute if score _bt-reg0 addonsGlobal matches 26 run scoreboard players set _bt-reg0 addonsGlobal 2
execute if score _bt-reg0 addonsGlobal matches 27 run scoreboard players set _bt-reg0 addonsGlobal 3
execute if score _bt-reg0 addonsGlobal matches 28 run scoreboard players set _bt-reg0 addonsGlobal 4
execute if score _bt-reg0 addonsGlobal matches 29 run scoreboard players set _bt-reg0 addonsGlobal 5

##Bossbar display, use different symbols to represent sleeping/mob spawning times
execute if score _bt-track addonsGlobal <= _bt-const2 addonsGlobal run bossbar set better_time:main name [{"text":"☀ ","color":"#f2de05"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"addonsGlobal"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"addonsGlobal"},"color":"#f2db29"},{"text":" ☀","color":"#f2de05"}]

execute if score _bt-track addonsGlobal > _bt-const2 addonsGlobal run bossbar set better_time:main name [{"text":"☽ ","color":"#bfbfbf"},{"text":"Time: ","color":"#af128"},{"score":{"name":"_bt-reg0","objective":"addonsGlobal"},"color":"#96ff1f"},{"text":":00","color":"#96ff1f"},{"text":" | ","color":"#bd0000"},{"text":"Day: ","color":"#f57a07"},{"score":{"name":"_bt-day","objective":"addonsGlobal"},"color":"#f2db29"},{"text":" ☽","color":"#bfbfbf"}]
