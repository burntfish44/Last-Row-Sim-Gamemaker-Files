/// @description boulder
// You can write your code in this editor

if (global.boulders_on) {
	// update rubble+boulder target location
	updateBoulderTarget();
	// play baba animation
	if(instance_exists(obj_baba_animation) == false) {
		instance_create_layer(1088,192,"boss_sprite",obj_baba_animation);
	}
	if (global.baba_sound == true) {
		show_debug_message("sound vol: " + string(audio_group_get_gain(audiogroup_default)));
		audio_play_sound(snd_baba_boulder,1,0);
	}
	//first tile
	//instance_create_layer(352,480,"boulders",obj_rubble0);
	//instance_create_layer(obj_playertile.x,obj_playertile.y,"boulders",obj_rubble0);
	alarm_set(6,36*2);//show boulder after 2 ticks

	if (array_get(boulderTargetTile,0) == 1) {
		instance_create_layer(352,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,1) == 1) {
		instance_create_layer(416,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,2) == 1) {
		instance_create_layer(480,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,3) == 1) {
		instance_create_layer(544,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,4) == 1) {
		instance_create_layer(608,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,5) == 1) {
		instance_create_layer(672,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,6) == 1) {
		instance_create_layer(736,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,7) == 1) {
		instance_create_layer(800,480,"rubble",obj_rubble0);
	}
	if (array_get(boulderTargetTile,8) == 1) {
		instance_create_layer(864,480,"rubble",obj_rubble0);
	}
} else { //baba disabled
	// hide animation if off
	if(instance_exists(obj_baba_animation)) {
		instance_destroy(obj_baba_animation);
	}
}

// restart to throw a new attack every 3 ticks
alarm_set(5,36*3);