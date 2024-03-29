/// @description Insert description here
// You can write your code in this editor

// base 208 frames incl exploding rock and fading shadow
// 52 new tot = 208/4
// damage should happen on frame 36? the frame it touches the ground. 

draw_self();
if(image_index >= 30 && image_index < 31) {
	image_speed=0;
	instance_destroy();
}