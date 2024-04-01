/// @description Insert description here
// You can write your code in this editor

// MOST GAME INITIALIZATION STUFF IS HERE
// Most stuff that's not set up here is set up in obj_playertile and obj_boss
// Sets variables, queued actions, some globals if they aren't yet, etc

ticktimer=1;
visualtick=1;
attackstate=false;
movementstate=false;
walking=false;
lastplayeraction="move";
player_direction = "left";
incomingAttack = false;
incomingAttackType = "";
incomingAttackDamage = 0;
prayerJustChanged = false;
// queued food
drank_ambro = false;
drank_brew = false;
drank_restore = false;
lastattacktick=-100;
attackstarttick=0;
lightningTimings = [];
lightningTimings2 = [];

// default some settings
if (!variable_global_exists("attackspeed")) {
	global.attackspeed = 4;
}
if (!variable_global_exists("visual_metronome")) {
	global.visual_metronome = true;
}
if (!variable_global_exists("status_bars")) {
	global.status_bars = true;
}
if (!variable_global_exists("endless_mode")) {
	global.endless_mode = false;
}
if (!variable_global_exists("ping")) { // increments of 16.6ms to account for frame rate
	global.ping = 2; // default 33ms
}

player_x = obj_playertile.x;
player_y = obj_playertile.y;
// default destination to current
pdestination_x = obj_playertile.x;
pdestination_y = obj_playertile.y;
tileTruePositions_x = [352,416,480,544,608,672,736,800,864];

obj_bowfa_move_left.visible = true;
obj_bowfa_move_right.visible = false;

// recv the array of lightnings, 0 = no delay on strike, 1 = 1 tick delay etc, -1 = fully safe tile
function queueUpLightningHits(delayValuesOfEachTile) {
	//show_debug_message("NEW LIGHTNING ARRAY INC, current is len/val: " + string(array_length(lightningTimings)) + string(lightningTimings));
	//show_debug_message("OG delay array: " + string(delayValuesOfEachTile));
	//lightningTimings = []; //reset
	
	// default to array 1
	var arrayDestination = "";
	// else to array 2
	if (array_length(lightningTimings) == 0) {
		arrayDestination = "array1";
	} else if (array_length(lightningTimings2) == 0) {
		arrayDestination = "array2";
	}
	
	for (i = 0; i < array_length(delayValuesOfEachTile); i++) {
		var currentItem = array_get(delayValuesOfEachTile,i);
		if (currentItem == -1) {
			//if (array_contains(delayValuesOfEachTile,2) == true) {
			//	show_debug_message("has a 2 in it!!!!");
			//	array_push(lightningTimings2,-1);
			//} 
			if (arrayDestination == "array2") {
				array_push(lightningTimings2,-1);
			} else if (arrayDestination == "array1") {
				array_push(lightningTimings, -1);
			} else {
				show_debug_message(" should not hit here");
			}
		} else {
			//if (array_contains(delayValuesOfEachTile,2) == true) {
			//	show_debug_message("has a 2 in it!!!!");
			//	array_push(lightningTimings2,currentItem + 4);
			//} else {
			//	array_push(lightningTimings,currentItem + 4);
			//}
			if (arrayDestination == "array2") {
				array_push(lightningTimings2,currentItem + 4);
			} else if (arrayDestination == "array1") {
				array_push(lightningTimings,currentItem + 4);
			} else {
				show_debug_message(" should not hit here");
			}
		}
	}
	//show_debug_message("new delay array 1/2: " + string(lightningTimings) + "/" + string(lightningTimings2));
}

// shoot a projectile if attacking and if attack is off cooldown
function processAttack() {
	if (ticktimer - lastattacktick >= global.attackspeed) {
		instance_create_layer(obj_playertile.x,obj_playertile.y,"projectile",obj_rangeball);
		lastattacktick = ticktimer;
	}
}

// set incoming attack values, to be processed on the next tick
function updateIncomingAttack(confirm,inctype,incval) {
	incomingAttack = confirm;
	incomingAttackType = inctype;
	incomingAttackDamage = incval;
}

// set up UI elements
// starting with mage on by default
// set up inventory prayers
instance_create_layer(1038,480,"UI_ambrosia",obj_ambrosia_full);
instance_create_layer(1070,615,"UI_prayer",obj_mage_prayer_on);
instance_create_layer(1115,615,"UI_prayer",obj_range_prayer_off);
// hide overhead prayers to start
obj_mage_prayer_on_player.visible = true;
obj_range_prayer_on_player.visible = false;

// Create settings button
if(!instance_exists(obj_game_settings_button)) {
	var settingsIconInst = instance_create_layer(1216,0,"UI_settings_button",obj_game_settings_button);
}

// set up and apply default volume
if (variable_global_exists("volume") == false) {
	global.volume = 1;
}
audio_group_set_gain(audiogroup_default,global.volume,0);

randomize();
alarm_set(0,36);