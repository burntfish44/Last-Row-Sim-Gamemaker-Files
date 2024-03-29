/// @description lightning cycle
// You can write your code in this editor

//- 6 tick cycle from the first shadow to the last pop. 
//- 3 zaps at most total per cycle
//- 5-8 out of 9 are in the first set
//- zap ticks are small > mid > large > zap
//- full cycle:
//	- first shadows
//	- second shadows
//	- third shadows
//	- zap 1
//	- zap 2
//	- zap 3

//starting number of ligntnings - % chance
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
	firstRoundNumber = getFirstLightningSetNumber(random(1));
	//firstRoundNumber=1;
	//debug
	//firstRoundNumber = 8;
	openTiles -= firstRoundNumber;
	addToHitTimingArray(firstRoundNumber,0);
	var firstRemaining = 9 - firstRoundNumber;


	// DEBUG COMMENTED FOR NOW

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

	// randomize the order of the array
	tileTargetsTicksBeforeHit = array_shuffle(tileTargetsTicksBeforeHit);

	//tileTargetsTicksBeforeHit = [0,0,1,1,1,2,2,-1,-1];
	//tileTargetsTicksBeforeHit = [0,0,0,0,0,0,0,0,0];
	//tileTargetsTicksBeforeHit = [0,1,-1,-1,-1,-1,-1,-1,-1];
	// have to delay 1 frame for alarm to be called
	show_debug_message(tileTargetsTicksBeforeHit);
	alarm_set(2,1);
	alarm_set(3,37);
	alarm_set(4,73);
	// 1s at alarm 2
	// 2s at alarm 3 ?

	//show_debug_message("FIRST SET: " + string(firstRoundNumber));
	//show_debug_message("---first set: " + string(firstRoundNumber) + ", openTiles: " + string(openTiles));
	//show_debug_message("---second set: " + string(secondRoundNumber) + ", openTiles: " + string(openTiles));
	//show_debug_message("---third set: " + string(thirdRoundNumber) + ", openTiles: " + string(openTiles));

}
// restart 6 tick lightning cycle
alarm_set(1,36*6);
