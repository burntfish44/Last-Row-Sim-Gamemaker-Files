/// @description Insert description here
// You can write your code in this editor
//show_debug_message("option pressed to toggle on: " + value);
if (visible == true) {
	if (value == "lightning") {
		global.lightning_on = true;
	} else if (value == "boulders") {
		global.boulders_on = true;
	} else if (value == "zebak") {
		global.zebak_on = true;
	} else if (value == "endless") {
		global.endless_mode = true;
	} else if (value == "playerhp") {
		global.player_hp_boost_on = true;
		obj_gamepause_menu.playerHpChanged = true;
	} else if (value == "vmetronome") {
		global.visual_metronome = true;	
	} else if (value == "statusbars") {
		global.status_bars = true;	
	} else if (value == "babasound") {
		global.baba_sound = true;	
	} else if (value == "zebaksound") {
		global.zebak_sound = true;
	}
}