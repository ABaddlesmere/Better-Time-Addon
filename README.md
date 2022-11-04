# Better Time Datapack

Tested Versions
---
1.17.x, 1.18.x, 1.19.x

Better Time displays the current minecraft time in a more human-friendly way. It uses a bossbar to display the day number, time of day and weather.

The time is presented in a 24 hour format. The bossbar will change how it looks depending on whether the player can sleep or not.

Better Time displays the current day the server is on. However, when running `/time set ...`, the day counter resets. Better Time comes with a day counter backup and restoration system.
If a player runs a `/time set ...` command, Better Time will detect this and restore the world's day counter using the backup.

The bossbar that displays Better Time can be in one of 6 states due to weather display. These states are:
1. Daytime and Clear
2. Daytime and Raining
3. Daytime and Thundering
4. Nighttime and Clear
5. Nighttime and Raining
6. Nightting and Thundering

These change based on the current weather in the overworld.


By default, Better Time is enabled for all players.

For a player to enable Better Time for themselves, run `/trigger enable-time-gui`

For a player to disable Better Time for themselves, run `/trigger disable-time-gui`

> **Note** A player can run these command without any permissions

### Clear weather, daytime
![Better Time Clear weather, Daytime](https://i.imgur.com/NMSFhoG.png)

### Rainy weather, daytime
![Better Time Rainy weather, Daytime](https://i.imgur.com/hoKkPoa.png)

### Thunder weather, nightting
![Better Time Thunder weather, Nighttime](https://i.imgur.com/5PWZiv2.png)

## Requirements Notice
This datapack requires some permissions to setup, and then to run.

### To run the setup function (`/function better_time:private/setup`), you must need:

Singleplayer: `Cheats`

Multiplayer: `Player OP permission of at least level 2` `Function Permission Level of at least 2 (Defaults to 2)`

### When the datapack is running, you must need:

Singleplayer: `none`

Multiplayer: `Function Permission Level of at least 2 (Defaults to 2)`

## Setting Up and running

First, download the datapack. Then put it in your datapacks folder. You will need to extract the datapack if you downloaded it as a ZIP. Make sure the directory matches what is below:
```
mySave
 |
 | -datapacks
     |
     | -better_time (Folder, NOT ZIP file)
         |
         | -pack.mcmeta
         | -data
             |
             | -better_time
             |   |
             |   | -...
             |
             | -minecraft
                 |
                 | -...
```

To setup the datapack in-game, you need to meet the requirements above. Once they are met, you run `/function better_time:private/setup`. **This only needs to be run once at installation time**.

From there on, the datapack will run itself, easy as that!