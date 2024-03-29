/// @description Insert description here
// You can write your code in this editor
image_speed=.5;
draw_self();
if(image_index >= 4 && image_index < 5) {
	image_speed=0;
	instance_destroy();
}