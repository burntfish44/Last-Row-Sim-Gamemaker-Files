/// @description health bar
// You can write your code in this editor

draw_self();

draw_healthbar(obj_bowfa_move_left.x+11,obj_bowfa_move_left.y-71,obj_bowfa_move_left.x+52,obj_bowfa_move_left.y-65,(obj_playertile.player_health/obj_playertile.player_health_max)*100,c_maroon,c_green,c_green,0,true,true);