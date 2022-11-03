# Better Time Datapack

Better Time displays the current minecraft time in a more human-friendly way. It uses a bossbar to display the day number, time of day and weather.

The time is presented in a 24 hour format. The bossbar will change how it looks depending on whether the player can sleep or not.

Better Time displays the current day the server is on. However, when running `/time set ...`, the day counter resets. Better Time comes with a day counter backup and restoration system.
If a player runs a `/time set ...` command, Better Time will detect this and restore the world's day counter using the backup.

The bossbar that displayers Better Time can be in one of 6 states due to weather display. These states are:
1. Daytime and Clear
2. Daytime and Raining
3. Daytime and Thundering
4. Nighttime and Clear
5. Nighttime and Raining
6. Nightting and Thundering

These change based on the current weather in the overworld.


By default, Better Time is enabled for all players.

To enable it, run `/trigger btrtime-enable`

To disable it, run `/trigger btrtime-disable`
