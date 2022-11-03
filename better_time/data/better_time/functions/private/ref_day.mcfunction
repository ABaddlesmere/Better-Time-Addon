##Essentially a for loop

time add 1d

execute store result score _bt-day btSB run time query day

execute if score _bt-day btSB < _bt-oldDay btSB run function better_time:private/ref_day
