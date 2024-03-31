/// @description lightning cycle
// You can write your code in this editor

//- 6 tick cycle from the first shadow to the last pop. 
//- 3 zaps at most total per cycle
//- 5-8 out of 9 tiles are in the first set
//- 2nd and 3rd set are mostly random based on remaining available tiles
//- zap ticks are small > mid > large > zap
//- full cycle, each tick in order:
//	- first shadows
//	- second shadows
//	- third shadows
//	- zap 1
//	- zap 2
//	- zap 3

//number of ligntnings in the first set - % chance
//5 - ~40%
//6 - ~36.4%
//7 - ~16.3%
//8 - ~7.3%

if (global.lightning_on) {
	// array that will determine how many ticks each tile has until a lightning hits
	tileTargetsTicksBeforeHit = [];
	openTiles = 9;
	secondRoundNumber = 0;
	thirdRoundNumber = 0;

	// 1st, 2nd, 3rd lightning sets. Add the tick delay n times to the array
	//firstRoundNumber = 8; //DEBUG DELETE
	firstRoundNumber = getFirstLightningSetNumber(random(1));
	
	
	//firstRoundNumber=1;
	//debug
	//firstRoundNumber = 8;
	openTiles -= firstRoundNumber;
	addToHitTimingArray(firstRoundNumber,0);
	var firstRemaining = 9 - firstRoundNumber;
	if (firstRemaining > 0) {
		secondRoundNumber = round(random_range(0, firstRemaining));
		openTiles -= secondRoundNumber;
		addToHitTimingArray(secondRoundNumber,1);
	}
	var secondRemaining = 9 - firstRoundNumber - secondRoundNumber;
	if (secondRemaining > 0) {
		thirdRoundNumber = round(random_range(0, secondRemaining));
		openTiles -= thirdRoundNumber;
		addToHitTimingArray(thirdRoundNumber,2);
	}
	// add any remaining "safe" tiles
	if (openTiles > 0) {
		addToHitTimingArray(openTiles,-1);
	}
	//show_debug_message("FIRST SET: " + string(firstRoundNumber));
	//show_debug_message("---first set: " + string(firstRoundNumber) + ", openTiles: " + string(openTiles));
	//show_debug_message("---second set: " + string(secondRoundNumber) + ", openTiles: " + string(openTiles));
	//show_debug_message("---third set: " + string(thirdRoundNumber) + ", openTiles: " + string(openTiles));

	// update player tile location index
	currentPlayerTile = array_get_index(tileTruePositions_x,obj_playertile.x);
	//show_debug_message("in lightngint, player is at tile: " + string(currentPlayerTile));
	// call to update safer_tile_indexes with 1-2 guaranteed "safe" tile locations
	// Specifically prevent 8 in a row by not allowing the current tile to be 0d if the plaer is on tile 0 or 8
	//&& (currentPlayerTile == 0 || currentPlayerTile == 8)
	if (firstRoundNumber == 8) {
		determineASafeTile(true);
	} else {
		determineASafeTile(false);
	}
	
	//show_debug_message("$$$ safer_tile_indexes: " + string(safer_tile_indexes));
	//show_debug_message("$$$ delay array: " + string(tileTargetsTicksBeforeHit));
	
	// remove one of the non zero items temporarily, this will be our safe tile. 
	// going to select what our safe tile will be randomly from the >0 delay values. 
	// step 1 to grabbing one of these randomly, dupe array:
	tileTargetsTicksBeforeHit2TheElectricBoogaloo = tileTargetsTicksBeforeHit;
	// step 2 remove all 0's from the dupe array, leaving only the >0 delays and free tiles
	array_delete(tileTargetsTicksBeforeHit2TheElectricBoogaloo,0,firstRoundNumber);
	// step 3 scramble the array
	tileTargetsTicksBeforeHit3 = array_shuffle(tileTargetsTicksBeforeHit2TheElectricBoogaloo);
	// step 4 grab the first value now that it's been randomized by removing the first value
	firstNonZeroValue = array_shift(tileTargetsTicksBeforeHit3);
	// 2nd val will only used if the first is zero
	if (array_length(safer_tile_indexes) == 2) {
		secondNonZeroValue = array_shift(tileTargetsTicksBeforeHit3);
	}
	// alright now plug back in the 0s we removed in step 2
	for(i = 0; i < firstRoundNumber; i++) {
		array_insert(tileTargetsTicksBeforeHit3,0,0);	
	}
	// save myself rewriting all the other arrays. delay array should now be missing 1-2 >0 values
	tileTargetsTicksBeforeHit = tileTargetsTicksBeforeHit3;
	//show_debug_message("$$$ delay array post removal and added back 0s: " + string(tileTargetsTicksBeforeHit));
	//show_debug_message("$$$ safe tile locations: " + string(safer_tile_indexes));

	// randomize the order of the array
	tileTargetsTicksBeforeHit = array_shuffle(tileTargetsTicksBeforeHit);
	// re insert the >0 delay value we pulled earlier at the safe tile location
	array_insert(tileTargetsTicksBeforeHit,array_get(safer_tile_indexes,0),firstNonZeroValue);
	//show_debug_message("$$$ delay array post insert 1: "  + string(tileTargetsTicksBeforeHit));
	// re insert 2nd value if needed
	if (array_length(safer_tile_indexes) == 2) {
		array_insert(tileTargetsTicksBeforeHit,array_get(safer_tile_indexes,1),secondNonZeroValue);
		//show_debug_message("$$$ delay array post insert 2: "  + string(tileTargetsTicksBeforeHit));
	}
	tileTargetsTicksBeforeHit = [0,0,1,1,2,2,-1,-1,-1]; //DEBUG
	// send lightning array to tick processor
	obj_ticktimer.queueUpLightningHits(tileTargetsTicksBeforeHit);
	// do visaul for each set of lightning
	alarm_set(2,1);
	alarm_set(3,37);
	alarm_set(4,73);

	//show_debug_message("FIRST SET: " + string(firstRoundNumber));
	//show_debug_message("---first set: " + string(firstRoundNumber) + ", openTiles: " + string(openTiles));
	//show_debug_message("---second set: " + string(secondRoundNumber) + ", openTiles: " + string(openTiles));
	//show_debug_message("---third set: " + string(thirdRoundNumber) + ", openTiles: " + string(openTiles));
	safer_tile_indexes = []; //reset
}
// restart 6 tick lightning cycle
alarm_set(1,36*6);
