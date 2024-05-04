/// @description shoot projectile
// You can write your code in this editor

if (global.attackspeed == 4) {
	instance_create_layer(obj_playertile.x+16,obj_playertile.y-32,"projectile",obj_rangeball);
} else if (global.attackspeed == 5) {
	instance_create_layer(obj_playertile.x+16,obj_playertile.y-32,"projectile",obj_mageball);
}