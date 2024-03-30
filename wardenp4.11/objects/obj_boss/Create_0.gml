/// @description boss init
// You can write your code in this editor

// if settings haven't been changed, default on all
if (!variable_global_exists("lightning_on")) {
	global.lightning_on = true;
}
if (!variable_global_exists("boulders_on")) {
	global.boulders_on = true;
}
if (!variable_global_exists("zebak_on")) {
	global.zebak_on = true;
}
if (!variable_global_exists("baba_sound")) {
	global.baba_sound = true;
}
if (!variable_global_exists("zebak_sound")) {
	global.zebak_sound = true;
}

attackroll=0;
attack=0;
attackcount=0;
tileTargetsTicksBeforeHit = [];
boulderTargetTile = [0,0,0,0,0,0,0,0,0];
zebakPathLevel = 0;
zebakLastAttack = "";

tileTruePositions_x = [352,416,480,544,608,672,736,800,864];
tileTruePositions_y = 480;

currentPlayerTile = 0; // this is only used in lightnings and gives a tile location 0-8
safeTileRNG = 0;
secondSafeTileGuarantee = false; 
safer_tile_indexes = [];


boss_health_max=2300;
boss_health=350;
// show boss heal amount
var hinst = instance_create_layer(obj_bosstile.x-6,obj_bosstile.y-95,"hitsplat",obj_heal_number_boss);
hinst.applyNumber(350);

//starting number of ligntnings - % chance
//5 - 40%
//6 - 36.4%
//7 - 16.3%
//8 - 7.3%
function getFirstLightningSetNumber(num) {
	if (num >= 0.927) {
		return 8;
	} else if (num >= 0.764) {
		return 7;
	} else if (num >= 0.4) {
		return 6;
	} else {
		return 5;
	}
}

function determineASafeTile(cantBeZero) {
	//safeTileRNG = 0;// DEBUG to always 0 diff, delete
	// in some cases 0 diff safe is not allowed, prevent it here:
	if (cantBeZero) {
		safeTileRNG = random_range(0.17,1);
	} else {
		safeTileRNG = random(1);
	}
	// if the first safe tile is the player tile, v2 of this f() will be called which can't be 0
	if (safeTileRNG <= 0.16) { // safe tile is current tile
		addSafeIndexToSafeArray(0, "");
		// also ensure that a 2nd safe tile is within 3
		determineASafeTile2(cantBeZero);
	} 
	else if (safeTileRNG > 0.16 && safeTileRNG <= 0.64) { // safe tile is 1 away
		// if on tile 0, has to be right, if on 8 has to be left, else random it
		if (currentPlayerTile == 0) {
			addSafeIndexToSafeArray(1, "right");
		} else if (currentPlayerTile == 8) {
			addSafeIndexToSafeArray(1, "left");
		} else {
			addSafeIndexToSafeArray(1, "random");
		}
	} 
	else if (safeTileRNG > 0.64 && safeTileRNG <= 0.88) { // safe tile is 2 away
		// if on tile 0-1, has to be right, if on 7-8 has to be left, else random it
		if (currentPlayerTile <= 1) {
			addSafeIndexToSafeArray(2, "right");
		} else if (currentPlayerTile >= 7) {
			addSafeIndexToSafeArray(2, "left");
		} else {
			addSafeIndexToSafeArray(2, "random");
		}
		//show_debug_message();
	} 
	else if (safeTileRNG > 0.88) { // safe tile is 3 away
		// if on tile 2, has to be right, if on 6 has to be left, else random it
		if (currentPlayerTile <= 2) {
			addSafeIndexToSafeArray(3, "right");
		} else if (currentPlayerTile >= 6) {
			addSafeIndexToSafeArray(3, "left");
		} else {
			addSafeIndexToSafeArray(3, "random");
		}
	}
	array_sort(safer_tile_indexes,true);
}

function determineASafeTile2(cantBeZero) {
	if (cantBeZero) { // prevent a 2nd safe tile happening when it shouldn't
		return;
	}
	safeTileRNG = random(1);
	if (safeTileRNG <= 0.4) { // safe tile is 1 away
		// if on tile 0, has to be right, if on 8 has to be left, else random it
		if (currentPlayerTile == 0) {
			addSafeIndexToSafeArray(1, "right");
		} else if (currentPlayerTile == 8) {
			addSafeIndexToSafeArray(1, "left");
		} else {
			addSafeIndexToSafeArray(1, "random");
		}
	} 
	else if (safeTileRNG > 0.4 && safeTileRNG <= 0.8) { // safe tile is 2 away
		// if on tile 0-1, has to be right, if on 7-8 has to be left, else random it
		if (currentPlayerTile <= 1) {
			addSafeIndexToSafeArray(2, "right");
		} else if (currentPlayerTile >= 7) {
			addSafeIndexToSafeArray(2, "left");
		} else {
			addSafeIndexToSafeArray(2, "random");
		}
		//show_debug_message();
	} 
	else { // safe tile is 3 away
		// if on tile 2, has to be right, if on 6 has to be left, else random it
		if (currentPlayerTile <= 2) {
			addSafeIndexToSafeArray(3, "right");
		} else if (currentPlayerTile >= 6) {
			addSafeIndexToSafeArray(3, "left");
		} else {
			addSafeIndexToSafeArray(3, "random");
		}
	}	
}




function addSafeIndexToSafeArray(diffToPlayer, leftOrRight) {
	//show_debug_message("$$$ ADDING SAFE TILE, diff/LR: " + string(diffToPlayer) + "/" + string(leftOrRight));
	if (diffToPlayer == 0) {
		// current standing tile is safe
		//show_debug_message(" $$$$$$ CURRENT STANDING TILE IS SAFE");
		array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x));
	} else if (diffToPlayer == 1) {
		// 1 tile out is safe
		if (leftOrRight == "left") {
			array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) - 1);
		} else if (leftOrRight == "right") {
			array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) + 1);
		} else { //random
			leftOrRightRandomCheck = random(1);
			if (leftOrRightRandomCheck <= 0.5) {
				array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) - 1);
			} else {
				array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) + 1);
			}
		}
	} else if (diffToPlayer == 2) {
		// 2 tiles out is safe
		if (leftOrRight == "left") {
			array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) - 2);
		} else if (leftOrRight == "right") {
			array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) + 2);
		} else { //random
			leftOrRightRandomCheck = random(1);
			if (leftOrRightRandomCheck <= 0.5) {
				array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) - 2);
			} else {
				array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) + 2);
			}
		} 
	} else if (diffToPlayer == 3) {
		// 3 tiles out is safe
		if (leftOrRight == "left") {
			array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) - 3);
		} else if (leftOrRight == "right") {
			array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) + 3);
		} else { //random
			leftOrRightRandomCheck = random(1);
			if (leftOrRightRandomCheck <= 0.5) {
				array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) - 3);
			} else {
				array_push(safer_tile_indexes, array_get_index(tileTruePositions_x,obj_playertile.x) + 3);
			}
		}
	}
}

function addToHitTimingArray(num, delay) {
	for(i = 0; i < num; i++) {
		array_push(tileTargetsTicksBeforeHit,delay);
	}
}


 //[352,416,480,544,608,672,736,800,864];
function updateBoulderTarget() {
	if (obj_playertile.x == 352) { 
		boulderTargetTile = [1,0,0,0,0,0,0,0,0];
	} else if (obj_playertile.x == 416) {
		boulderTargetTile = [0,1,0,0,0,0,0,0,0];
	} else if (obj_playertile.x == 480) {
		boulderTargetTile = [0,0,1,0,0,0,0,0,0];
	} else if (obj_playertile.x == 544) {
		boulderTargetTile = [0,0,0,1,0,0,0,0,0];
	} else if (obj_playertile.x == 608) {
		boulderTargetTile = [0,0,0,0,1,0,0,0,0];
	} else if (obj_playertile.x == 672) {
		boulderTargetTile = [0,0,0,0,0,1,0,0,0];
	} else if (obj_playertile.x == 736) {
		boulderTargetTile = [0,0,0,0,0,0,1,0,0];
	} else if (obj_playertile.x == 800) {
		boulderTargetTile = [0,0,0,0,0,0,0,1,0];
	} else if (obj_playertile.x == 864) {
		boulderTargetTile = [0,0,0,0,0,0,0,0,1];
	}
}

function processBossDeath() {
	if (!instance_exists(obj_gamepause)) {
		instance_create_layer(0,0,"UI_settings_button",obj_gamepause);
		obj_gamepause.bossDiedPause();
	}
}

// debug/options to toggle
//lightning_on = false;
//boulders_on = false;
//zebak_on = false;

// start lightning cycle after a couple ticks
alarm_set(1,72);
// start baba cycle after a couple ticks
alarm_set(5,72);
// start zebak cycle after a couple ticks
alarm_set(7,72);


