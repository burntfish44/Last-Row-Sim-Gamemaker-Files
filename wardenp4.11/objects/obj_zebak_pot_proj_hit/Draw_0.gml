/// @description Insert description here
// You can write your code in this editor
draw_self();
x = obj_player_collision_box.x;
y = obj_player_collision_box.y;

if(image_index >= 6 && image_index < 7) {
	image_speed=0;
	//obj_playertile.zebakProjectileHit("mage");
	instance_destroy();
}