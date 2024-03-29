/// @description health bar
// You can write your code in this editor

draw_self();

// if endless is on, heal boss
if (global.endless_mode == true && boss_health < 100) {
	boss_health = boss_health + 350;
	var hinst = instance_create_layer(obj_bosstile.x-6,obj_bosstile.y-65,"hitsplat",obj_heal_number_boss);
	hinst.applyNumber(350);
}

draw_healthbar(x-128,y-183,x+128,y-174,(boss_health/boss_health_max)*100,c_maroon,c_green,c_green,0,true,true);