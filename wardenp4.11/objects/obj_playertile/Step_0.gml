/// @description Insert description here
// You can write your code in this editor
if(player_health <= 0) {
	//player dies
	show_debug_message("***you are dead!!");
	player_health = 0; // remove overkill
	//pause if it's not already
	processDeath();
	return;
}

obj_bowfa_attack_left.visible = false;
obj_bowfa_attack_right.visible = false;
obj_bowfa_move_left.visible = false;
obj_bowfa_move_right.visible = false;
obj_shadow_attack_left.visible = false;
obj_shadow_attack_right.visible = false;
obj_shadow_move_left.visible = false;
obj_shadow_move_right.visible = false;

draw_healthbar(x+11,y-70,x+52,y-65,(obj_playertile.player_health/obj_playertile.player_health_max)*100,c_black,c_green,c_green,0,true,true);

// draw player moving model
if (obj_ticktimer.player_direction == "left") {
	if (global.attackspeed == 4) {
		obj_bowfa_attack_left.visible = false;
		obj_bowfa_attack_right.visible = false;
		obj_bowfa_move_left.visible = true;
		obj_bowfa_move_right.visible = false;
	} else {
		obj_shadow_attack_left.visible = false;
		obj_shadow_attack_right.visible = false;
		obj_shadow_move_left.visible = true;
		obj_shadow_move_right.visible = false;
	}
} else if (obj_ticktimer.player_direction == "right") {
	if (global.attackspeed == 4) {
		obj_bowfa_attack_left.visible = false;
		obj_bowfa_attack_right.visible = false;
		obj_bowfa_move_left.visible = false;
		obj_bowfa_move_right.visible = true;
	} else {
		obj_shadow_attack_left.visible = false;
		obj_shadow_attack_right.visible = false;
		obj_shadow_move_left.visible = false;
		obj_shadow_move_right.visible = true;
	}
}
// draw player attack model
if (obj_ticktimer.attackstate == true) {
	obj_bowfa_move_left.visible = false;
	obj_bowfa_move_right.visible = false;
	obj_shadow_move_left.visible = false;
	obj_shadow_move_right.visible = false;
	
	if(x >= 608) {
		// player is right, so face left
		if (global.attackspeed == 4) {
			obj_bowfa_attack_left.visible = true;
			obj_bowfa_attack_right.visible = false;
		} else {
			obj_shadow_attack_left.visible = true;
			obj_shadow_attack_right.visible = false;
		}
	} else {
		// player is left, so face right
		if (global.attackspeed == 4) {
			obj_bowfa_attack_left.visible = false;
			obj_bowfa_attack_right.visible = true;
		} else {
			obj_shadow_attack_left.visible = false;
			obj_shadow_attack_right.visible = true;
		}
	}
}
