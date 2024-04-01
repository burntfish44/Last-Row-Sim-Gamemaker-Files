/// @description Insert description here
// You can write your code in this editor

chanceToMiss = 0.3; // bowfa
maxhit = 51;

//show_debug_message("RANGE PROJECTILE CREATED, speed: " + string(global.attackspeed));

var p_start_x = x;
var p_start_y = y;

var _projdir = point_direction(p_start_x,p_start_y,obj_bosstile.x, obj_bosstile.y);
var _projdist = point_distance(p_start_x,p_start_y,obj_bosstile.x, obj_bosstile.y);

visible = true;
speed = 8;
direction = _projdir;

function projectile_die() {
	calculate_damage();
	instance_destroy();
}

function calculate_damage() {
	//accuracy roll
	hit_chance = random(1);
	hit_value = round(random_range(1,maxhit));
	if (hit_chance > chanceToMiss) {
		//show_debug_message("doing damage " + string(hit_value));
		obj_boss.boss_health = obj_boss.boss_health - hit_value;
		obj_playertile.addToDamageDone(hit_value);
		var dinst = instance_create_layer(obj_bosstile.x-6,obj_bosstile.y-65,"hitsplat",obj_damage_number_boss);
		dinst.applyNumber(hit_value);
	} else {
		//show_debug_message("miss," + string(hit_chance) + "<" + string(chanceToMiss));
		var dinst = instance_create_layer(obj_bosstile.x-6,obj_bosstile.y-65,"hitsplat",obj_damage_number_boss);
		dinst.applyNumber(0);
	}
}
