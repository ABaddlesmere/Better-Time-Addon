##_bt-track > Tracks the time from /time query daytime
##_bt-day > Tracks day number from /time query day
##_bt-constX > Constant to use in maths
##_bt-regX  > A register for maths


scoreboard players set _bt-track addonsGlobal 0
scoreboard players set _bt-day addonsGlobal 0
scoreboard players set _bt-oldDay addonsGlobal 0
scoreboard players set _bt-const0 addonsGlobal 1000
scoreboard players set _bt-const1 addonsGlobal 6
scoreboard players set _bt-const2 addonsGlobal 12544
scoreboard players set _bt-reg0 addonsGlobal 0
scoreboard players set _bt-reg1 addonsGlobal 0

scoreboard objectives add btrtime-disable trigger
scoreboard objectives add btrtime-enable trigger


bossbar add better_time:main "NONE"
bossbar set better_time:main name [{"text":"Better Time Update","color":"#af128"},{"text":" | ","color":"dark_red"},{"text":"Waiting for update...(50s)","color":"#42b7ff"}]
bossbar set better_time:main players @a[tag=seeTimeBar]
bossbar set better_time:main max 12544