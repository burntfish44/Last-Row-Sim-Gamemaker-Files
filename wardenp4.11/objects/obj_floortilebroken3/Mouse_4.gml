/// @description Insert description here
// You can write your code in this editor

if (mouse_x >= 992 && mouse_x < 1395 && mouse_y >= 430 && mouse_y < 833) {
	show_debug_message("CLICKED IN INVENTORY, NO MOVE");
	return;
}

instance_create_layer(mouse_x,mouse_y,"clicksprite",obj_yellowclick);

//player_current_x = obj_playertile.x;
//player_current_y = obj_playertile.y;
//show_debug_message("destination x should be updated to "+string(x));
obj_ticktimer.pdestination_x = x;
obj_ticktimer.pdestination_y = y;

obj_ticktimer.movementstate = true;
obj_ticktimer.attackstate = false;