/// @description on click
// You can write your code in this editor

instance_create_layer(mouse_x,mouse_y,"clicksprite",obj_redclick);

alarm_set(8,1 + global.ping); 
