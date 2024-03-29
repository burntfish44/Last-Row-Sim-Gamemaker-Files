/// @description Insert description here
// You can write your code in this editor

if (!variable_global_exists("first_pause")) {
	instance_create_layer(0,0,"UI_settings_button",obj_gamepause);
	obj_gamepause.gameStartPause();
}