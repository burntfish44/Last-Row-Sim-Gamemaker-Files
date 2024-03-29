/// @description Insert description here
// You can write your code in this editor

//draw_sprite(spr_yellowclick,0,mouse_x,mouse_y);
//obj_yellowclick.draw();
instance_create_layer(mouse_x,mouse_y,"clicksprite",obj_yellowclick);

//player_current_x = obj_playertile.x;
//player_current_y = obj_playertile.y;
//show_debug_message("destination x should be updated to "+string(x));
obj_ticktimer.pdestination_x = x;
obj_ticktimer.pdestination_y = y;

obj_ticktimer.movementstate = true;
obj_ticktimer.attackstate = false;