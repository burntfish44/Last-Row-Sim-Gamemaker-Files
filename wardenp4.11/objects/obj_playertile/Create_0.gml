/// @description Insert description here
// You can write your code in this editor
//nextx=x;
//nexty=y;
//alarm_set(0,36);

player_health_max = 99;
player_health = 99;
player_prayer_points_max = 99;
player_prayer_points = 99;
// if boosted health is on, start with 9999 hp, else 116
if (!variable_global_exists("player_hp_boost_on")) {
	global.player_hp_boost_on = false;
} else {
	if (global.player_hp_boost_on == true) {
		player_health = 9999;
	} else {
		player_health = 99;
	}
}
// if boosted prayer is on, start with 9999 prayer, else 99
if (!variable_global_exists("player_prayer_boost_on")) {
	global.player_prayer_boost_on = true;
} else {
	if (global.player_prayer_boost_on == true) {
		player_prayer_points = 9999;
	} else {
		player_prayer_points = 99;
	}
}

timeAlive = 0;
damage_done = 0;
active_prayer = "mage";
_playerdir = 0;
_playerdist = 0;
new_pos_x = 0;
new_pos_y = 0;
current_sprite_pos_x = 0;
current_sprite_pos_y = 0;
playerSpriteIsMoving = false;
playerSpriteSpeed = 0;
previous_true_tile_x = x;
previous_true_tile_y = y;

player_lightnings_ate = 0;
player_boulders_ate = 0;
player_zebaks_ate = 0;

player_damage_number_1 = false;
player_damage_number_2 = false;
player_damage_number_3 = false;
player_damage_number_4 = false;


var dinst = instance_create_layer(0,0,"UI_statusbars",obj_player_statusbars);

function setPlayerHp(hpVal) {
	player_health = hpVal;
}

function playermove(to_x, to_y) {
	var processVisual = false;
	if (to_x != x) {
		processVisual = true;	
	}
	x = to_x;
	y = to_y;
	obj_ticktimer.player_x = x;
	obj_ticktimer.player_y = y;
	if (processVisual == true) {
		processVisualMovement();
	}
}

function addToDamageDone(dVal) {
	damage_done += dVal;
}


function ateLightningDamage() {
	//show_debug_message("ate lightning damage!");
	var lightningDamageAmount = round(random_range(17,27));
	player_health = player_health - lightningDamageAmount;
	var dinst = instance_create_layer(obj_bowfa_move_left.x+24,obj_bowfa_move_left.y-30,"hitsplat",obj_damage_number);
	dinst.applyNumber(lightningDamageAmount);
	player_lightnings_ate += 1;
}

function ateBoulderDamage() {
	//show_debug_message("ate boulder damage!");
	var boulderDamageAmount = round(random_range(35,47));
	player_health = player_health - boulderDamageAmount;
	var dinst = instance_create_layer(obj_bowfa_move_left.x+24,obj_bowfa_move_left.y-30,"hitsplat",obj_damage_number);
	dinst.applyNumber(boulderDamageAmount);
	player_boulders_ate += 1;
}

function zebakProjectileHit(type) {
	if (active_prayer != type) {
		obj_ticktimer.updateIncomingAttack(true,type,1);
	} else {
		//show_debug_message("safeeeeee");
		obj_ticktimer.updateIncomingAttack(true,type,0);
	}
}

function ateZebakHit() {
	//show_debug_message("HIT BY ZEBAK ATTACK! take damage!");
	// damage ranges from 16-40, 40% 16-29, 30% 30-35, 25% a 36, 5% 37-40
	var zebakHighOrLowRoll = random(1);
	var zebakHighOrLowRoll2 = random(1);
	var zebakDamageAmount = 0;
	if (zebakHighOrLowRoll <= 0.4) { 
		zebakDamageAmount = round(random_range(16,29));
	} else if (zebakHighOrLowRoll > 0.4 && zebakHighOrLowRoll <= 0.7) {
		zebakDamageAmount = round(random_range(30,35));
	} else if (zebakHighOrLowRoll > 0.7 && zebakHighOrLowRoll <= .95) {
		zebakDamageAmount = 36;
	} else {
		zebakDamageAmount = round(random_range(37,40));	
	}
	//show_debug_message("zebak damage: ------ :" + string(zebakDamageAmount));
	player_health = player_health - zebakDamageAmount;
	var dinst = instance_create_layer(obj_bowfa_move_left.x+24,obj_bowfa_move_left.y-30,"hitsplat",obj_damage_number);
	dinst.applyNumber(zebakDamageAmount);
	player_zebaks_ate += 1;
}

function hitButNoDamage() {
	//show_debug_message("PRAYING SO NO damage!");
	var dinst = instance_create_layer(obj_bowfa_move_left.x+24,obj_bowfa_move_left.y-30,"hitsplat",obj_damage_number);
	dinst.applyNumber(0);
}

function processVisualMovement() {
	current_sprite_pos_x = obj_bowfa_move_left.x;
	current_sprite_pos_y = obj_bowfa_move_left.y;
	new_pos_x = x;
	new_pos_y = y;

	_playerdist = point_distance(current_sprite_pos_x,current_sprite_pos_y,new_pos_x, new_pos_y);
	
	//show_debug_message("should be moving, info: " + string(_playerdir));
	playerSpriteIsMoving = true;
	
	// -1 to catch floating point error
	if (_playerdist - 1 > 64) {
		// >1 tile so run speed
		playerSpriteSpeed = 128/36;
		//show_debug_message(">=64 (" + string(_playerdist)+"), speed = " + string(playerSpriteSpeed));
	} else {
		// =1 tile so walk speed
		playerSpriteSpeed = 64/36;
		//show_debug_message(">=32(" + string(_playerdist)+"), speed = " + string(playerSpriteSpeed));
	}
	
	// Move for one tick and stop
	obj_bowfa_move_left.movetowardspoint( new_pos_x, new_pos_y, playerSpriteSpeed);
	alarm_set(0,36);
}

function processDeath() {
	if (!instance_exists(obj_gamepause)) {
		instance_create_layer(0,0,"UI_settings_button",obj_gamepause);
		obj_gamepause.diedPause();
	}
}