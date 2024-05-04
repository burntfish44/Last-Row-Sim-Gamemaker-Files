/// @description Insert description here
// You can write your code in this editor
//show_debug_message("option pressed to toggle off: " + value);
if (visible == true) {
	if (value == "lightning") {
		global.lightning_on = false;
	} else if (value == "boulders") {
		global.boulders_on = false;
	} else if (value == "zebak") {
		global.zebak_on = false;
	} else if (value == "endless") {
		global.endless_mode = false;
	} else if (value == "playerhp") {
		global.player_hp_boost_on = false;
		obj_gamepause_menu.playerHpChanged = true;
	} else if (value == "vmetronome") {
		global.visual_metronome = false;
	} else if (value == "statusbars") {
		global.status_bars = false;	
	} else if (value == "hoveredtile") {
		global.hovered_tile = false;
	} else if (value == "babasound") {
		global.baba_sound = false;	
	} else if (value == "zebaksound") {
		global.zebak_sound = false;
	}
}