/// @description Insert description here
// You can write your code in this editor
//draw_self();

projdir = point_direction(x,y,obj_player_collision_box.x, obj_player_collision_box.y);
dist_to_player = distance_to_object(obj_player_collision_box);


speed = 1;
speed = (dist_to_player/5)/(36*3/5);
alarm_set(0,21.6);
alarm_set(1,43.2);
alarm_set(2,64.8);
alarm_set(3,86.4);
alarm_set(4,97.2);
alarm_set(5,108);