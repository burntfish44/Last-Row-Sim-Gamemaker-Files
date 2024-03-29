/// @description Insert description here
// You can write your code in this editor
//var near = instance_nearest(x,y,obj_bowfa_move_left);

// keep updating direction/dist
projdir = point_direction(x,y,obj_player_collision_box.x, obj_player_collision_box.y);
dist_to_player = distance_to_object(obj_player_collision_box);
direction = projdir;

//move_towards_point(near.x,near.y-50,newspeed);