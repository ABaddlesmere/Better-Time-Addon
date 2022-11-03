##Essentially a for loop

time add 1d

execute store result score _bt-day addonsGlobal run time query day

execute if score _bt-day addonsGlobal < _bt-oldDay addonsGlobal run function better_time:private/ref_day
