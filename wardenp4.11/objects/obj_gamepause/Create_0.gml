/// @description Insert description here
// You can write your code in this editor

//pause = false;
//userPaused = false;
pauseSurface = -1;
pauseSurfaceBuffer = -1;
pause = true;
playerHP = obj_playertile.player_health;
bossHP = obj_boss.boss_health;
pauseReason = "";
timeLived = string(round(obj_playertile.timeAlive * .6)) + " seconds"; 
lightningsEaten = obj_playertile.player_lightnings_ate;
bouldersEaten = obj_playertile.player_boulders_ate;
zebaksEaten = obj_playertile.player_zebaks_ate;
damageDone = obj_playertile.damage_done;

instance_deactivate_all(true);

function unPause() {
		pause = false;
		instance_activate_all();
		instance_destroy();
}

function gameStartPause() {
	removePausedInstances();
	global.first_pause = false;
	instance_create_layer(0,0,"UI_pause_screen",obj_gamepause_title);
	pauseReason = "gamestart";
}

function showPatchNotes() {
	
	
	show_debug_message("implement this");
	
	
}

function gameStartOptions() {
	removePausedInstances();
	pauseReason = "gamestart";
	instance_create_layer(0,0,"UI_pause_screen",obj_gamepause_menu);
	startButton = instance_create_layer(736,32,"UI_pause_screen_buttons",obj_start_button_small);
	backButton = instance_create_layer(928,32,"UI_pause_screen_buttons",obj_back_button);	
}

// pause type
function regularPause() {
	removePausedInstances();
	if (playerHP == 0 || bossHP == 0) { 
		optionsWhenDead();
		return;
	}
	show_debug_message("actual regular pause, should get here from death: " + string(playerHP) + "/" + string(bossHP)); 
	pauseReason = "regular";
	instance_create_layer(0,0,"UI_pause_screen",obj_gamepause_menu);
	resetButton = instance_create_layer(736,32,"UI_pause_screen_buttons",obj_restart_button);
	// if it's a death or win screen, don't add resume
	if (playerHP > 0 && bossHP > 0) {
		resumeButton = instance_create_layer(928,32,"UI_pause_screen_buttons",obj_resume_button);
	} else {
		// if it is, add a back option to see results again
		backButton = instance_create_layer(928,32,"UI_pause_screen_buttons",obj_back_button);
	}
}

function optionsWhenDead() {
	//pauseReason = "optionswhendead";
	instance_create_layer(0,0,"UI_pause_screen",obj_gamepause_menu);
	resetButton = instance_create_layer(736,32,"UI_pause_screen_buttons",obj_restart_button);
	backButton = instance_create_layer(928,32,"UI_pause_screen_buttons",obj_back_button);
}

function diedPause() {
	pauseReason = "playerdead";
	removePausedInstances();
	instance_create_layer(0,0,"UI_pause_screen",obj_gamepause_death);
	resetButton = instance_create_layer(736,32,"UI_pause_screen_buttons",obj_restart_button);
	optionsButton = instance_create_layer(928,32,"UI_pause_screen_buttons",obj_game_settings_button_big);
}

function bossDiedPause() {
	pauseReason = "bossdead";
	removePausedInstances();
	instance_create_layer(0,0,"UI_pause_screen",obj_gamepause_win);
	resetButton = instance_create_layer(736,32,"UI_pause_screen_buttons",obj_restart_button);
	optionsButton = instance_create_layer(928,32,"UI_pause_screen_buttons",obj_game_settings_button_big);
}

function previousScreen() {
	show_debug_message("go back!!! to:" + string(pauseReason));
	//removePausedInstances();
	if (pauseReason == "playerdead") {
		show_debug_message("go back to player dead");
		diedPause();
	} else if (pauseReason == "bossdead") {
		show_debug_message("go back to boss dead");
		bossDiedPause();
	} else if (pauseReason == "gamestart") {
		show_debug_message("go back to title screen");
		gameStartPause();
	}
}

// remove all generated buttons
function removePausedInstances() {
	if (instance_exists(obj_gamepause_title)) {
		instance_destroy(obj_gamepause_title);
	} 
	if (instance_exists(obj_gamepause_menu)) {
		instance_destroy(obj_gamepause_menu);
	} 
	if (instance_exists(obj_gamepause_death)) {
		instance_destroy(obj_gamepause_death);
	} 
	if (instance_exists(obj_gamepause_win)) {
		instance_destroy(obj_gamepause_win);
	} 
	if (instance_exists(obj_restart_button)) {
		instance_destroy(obj_restart_button);
	}
	if (instance_exists(obj_resume_button)) {
		instance_destroy(obj_resume_button);
	}
	if (instance_exists(obj_game_settings_button_big)) {
		instance_destroy(obj_game_settings_button_big);
	}
	if (instance_exists(obj_start_button_big)) {
		instance_destroy(obj_start_button_big);
	}
		if (instance_exists(obj_start_button_small)) {
		instance_destroy(obj_start_button_small);
	}
	if (instance_exists(obj_options_button_big)) {
		instance_destroy(obj_options_button_big);
	}
	if (instance_exists(obj_back_button)) {
		instance_destroy(obj_back_button);
	}
}