/// @description Insert description here
// You can write your code in this editor
show_debug_message("settings clicked!!!!!!!!!!!!!");

window_set_cursor(cursor);
//pause if it's not already
if (!instance_exists(obj_gamepause)) {
	instance_create_layer(0,0,"UI_settings_button",obj_gamepause);
	obj_gamepause.regularPause();
} else {
	// unpause and remove this icon from pause section, other should remain
	obj_gamepause.unPause();
	instance_destroy();
}
//inst.userPaused = true;
//inst.togglePause();

//if (inst.userPaused == true) {
//	inst.userPaused = false;
//}