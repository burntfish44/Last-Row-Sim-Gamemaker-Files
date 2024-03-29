These are the GameMaker files used to run my p4 warden last row sim here: https://gx.games/games/6f00u8/last-row-sim/

Disclaimer: the code did not go through a clean-up process before uploading this, so will be pretty messy and not particularly optimized. 

I've uploaded these files as an open-source alternative to the downlaodable .exe file in my other repository, so users can download and run the program locally securely.

To run the program locally using Gamemaker Studio 2 (the program used to create the sim) download the wardensp4 folder, download GameMaker here: https://gamemaker.io/en/download and just file>open the project. 
For it to run on windows rather than in your browser when you click "play", check the upper right corner of GameMaker for the crosshair icon and make sure it's set to "Windows | GMS2 VM | Default | Default". 

## Some info on the code if you want to poke around

Most of the core of the program is in obj_ticktimer, obj_playertile, and obj_boss. 
obj_ticktimer is the main engine that process queued movement/eating/attacking/etc every 0.6s. 
obj_boss sets up the repeating sequence of lightnings, zebak attacks, and boulders. 
obj_playertile for the most part handles the player info - hp, movement, etc. 

Only a few things are placed in the "Room1" initially - for the most part stuff is generated as needed like projectiles and menu buttons. 
