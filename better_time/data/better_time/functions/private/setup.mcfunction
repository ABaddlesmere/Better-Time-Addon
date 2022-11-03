##_bt-track > Tracks the time from /time query daytime
##_bt-day > Tracks day number from /time query day
##_bt-constX > Constant to use in maths
##_bt-regX  > A register for maths

scoreboard objectives add btSB dummy
scoreboard players set _bt-track btSB 0
scoreboard players set _bt-day btSB 0
scoreboard players set _bt-oldDay btSB 0
scoreboard players set _bt-const0 btSB 1000
scoreboard players set _bt-const1 btSB 6
scoreboard players set _bt-const2 btSB 12544
scoreboard players set _bt-reg0 btSB 0
scoreboard players set _bt-reg1 btSB 0

scoreboard objectives add btrtime-disable trigger
scoreboard objectives add btrtime-enable trigger


bossbar add better_time:main "NONE"
bossbar set better_time:main name [{"text":"Better Time Update","color":"#af128"},{"text":" | ","color":"dark_red"},{"text":"Waiting for update...(50s)","color":"#42b7ff"}]
bossbar set better_time:main players @a[tag=btSTB]
bossbar set better_time:main max 12544