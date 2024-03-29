/// @description Insert description here
// You can write your code in this editor

if (global.status_bars == true) {
	draw_healthbar(1000,481,1020,779,(obj_playertile.player_health/obj_playertile.player_health_max)*100,c_black,c_maroon,c_maroon,3,true,true);

	if (obj_playertile.player_health <= 99) {
		draw_text_transformed(1000, 481, obj_playertile.player_health, 1.5,1.5, 0);
	} else if (obj_playertile.player_health > 99 && obj_playertile.player_health <= 999) {
		draw_text_transformed(996, 481, obj_playertile.player_health, 1.5,1.5, 0);
	} else {
		draw_text_transformed(990, 481, obj_playertile.player_health, 1.5,1.5, 0);
	}
}