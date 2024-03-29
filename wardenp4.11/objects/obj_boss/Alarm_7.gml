/// @description zebak
// You can write your code in this editor

if (global.zebak_on) {
	// play zebak animation
	if(instance_exists(obj_zebak_animation) == false) {
		instance_create_layer(0,192,"boss_sprite",obj_zebak_animation);
	}

	zebak_attack_type_roll = random(1);
	zebak_attack_type = "";
	//show_debug_message("zebak attack info");

	if (zebakLastAttack == "") {
		// 50/50 to pick the first attack
		zebak_attack_type_roll = round(zebak_attack_type_roll);
		if (zebak_attack_type_roll == 0) {
			zebak_attack_type = "range";
			zebakLastAttack = "range";
		} else if (zebak_attack_type_roll == 1) {
			zebak_attack_type = "mage";
			zebakLastAttack = "mage";
		}
	} else if (zebakLastAttack == "range") {
		// 2/3 chance to pick the same
		if (zebak_attack_type_roll >= 0.66) {
			zebak_attack_type = "range";
			zebakLastAttack = "range";
		} else {
			zebak_attack_type = "mage";
			zebakLastAttack = "range";
		}
	} else if (zebakLastAttack == "mage") {
		// 2/3 chance to pick the same
			if (zebak_attack_type_roll >= 0.66) {
			zebak_attack_type = "mage";
			zebakLastAttack = "mage";
		} else {
			zebak_attack_type = "range";
			zebakLastAttack = "range";
		}
	}

	//show_debug_message("zebak atak with " + string(zebak_attack_type));
	if (zebak_attack_type == "range") {
		// draw range
		instance_create_layer(128,256,"zebak_attacks",obj_zebak_rock);
		//audio_group_set_gain(audiogroup_default,1,0); // controls volume
		if (global.zebak_sound == true) {
			audio_play_sound(snd_zebak_rock,1,0);
		}
	} else if (zebak_attack_type == "mage") {
		// draw mage
		instance_create_layer(128,256,"zebak_attacks",obj_zebak_pot);
		if (global.zebak_sound == true) {
			audio_play_sound(snd_zebak_pot,1,0);
		}
	}

} else { //zebak disabled
	// hide animation if off
	if(instance_exists(obj_zebak_animation)) {
		instance_destroy(obj_zebak_animation);
	}
}
// restart zebak attack cycle every 4 ticks
alarm_set(7,36*4);
//alarm_set(7,36*1);