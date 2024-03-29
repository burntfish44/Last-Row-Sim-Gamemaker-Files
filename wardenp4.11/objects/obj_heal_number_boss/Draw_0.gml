/// @description Insert description here
// You can write your code in this editor

//if (exists == true) {
	existsTimer -= 1;
	if (existsTimer <= 0) {
		instance_destroy(healblank);
		instance_destroy();
		return;
	}
	//show_debug_message("damage in dmg draw: " + string(damageAmount) + ", at slot: " + string(slotNum));
	
	text=string(healAmount);
		
	// show red histplat for 1+, blue for 0
	// put the number slightly right if single digit
	draw_text(obj_bosstile.x+16,obj_bosstile.y-70,text);
	healblank.visible = true;
	//missblank.visible = false;
	healblank.x = obj_bosstile.x - 6;
	healblank.y = obj_bosstile.y - 95;