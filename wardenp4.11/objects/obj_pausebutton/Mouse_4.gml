/// @description Insert description here
// You can write your code in this editor

paused = !paused;
if (paused ) {
	instance_deactivate_all(true);
} else {
	instance_activate_all();
}