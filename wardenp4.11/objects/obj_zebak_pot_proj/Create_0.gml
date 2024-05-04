/// @description Insert description here
// You can write your code in this editor
//draw_self();

projdir = point_direction(x,y,obj_player_collision_box.x, obj_player_collision_box.y);
dist_to_player = distance_to_object(obj_player_collision_box);
ticksToImpact = 0;

if (global.zebak_level == 0) {
	ticksToImpact = 3;
} else {
	ticksToImpact = 2;	
}

denominator = (36*ticksToImpact/5);

speed = 1;
speed = (dist_to_player/5)/denominator;
// update speed 
alarm_set(0,denominator);
alarm_set(1,denominator*2);
alarm_set(2,denominator*3);
alarm_set(3,denominator*4);
alarm_set(4,denominator*4.5);
alarm_set(5,36*ticksToImpact); //poof visual & damage