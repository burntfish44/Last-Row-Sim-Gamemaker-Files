/// @description on click
// You can write your code in this editor

instance_create_layer(mouse_x,mouse_y,"clicksprite",obj_redclick);

obj_ticktimer.attackstate = true;
obj_ticktimer.attackstarttick = obj_ticktimer.ticktimer;
