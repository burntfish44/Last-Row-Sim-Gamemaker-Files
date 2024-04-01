if (mouse_x >= 992 && mouse_x < 1395 && mouse_y >= 430 && mouse_y < 833) {
	//show_debug_message("CLICKED IN INVENTORY, NO MOVE");
	return;
}

if (mouse_x >= 495 && mouse_x < 785 && mouse_y >= 352 && mouse_y <= 382) {
	//show_debug_message("clicked boss, so don't apply movement");
	return;
}

instance_create_layer(mouse_x,mouse_y,"clicksprite",obj_yellowclick);

if (keyboard_check(vk_control)) {
	obj_ticktimer.walking = true;
} else { 
	obj_ticktimer.walking = false;	
}

//update destination tile after ping frames pass
alarm_set(0,1 + global.ping); 