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


