/// @description Insert description here
// You can write your code in this editor

//if (exists == true) {
	existsTimer -= 1;
	if (existsTimer <= 0) {
		instance_destroy(hitblank);
		instance_destroy(missblank);
		instance_destroy();
		return;
	}
	//show_debug_message("damage in dmg draw: " + string(damageAmount) + ", at slot: " + string(slotNum));
	
	text=string(damageAmount);
		
		// show red histplat for 1+, blue for 0
		// put the number slightly right if single digit
		if (damageAmount <= 0.5) {
			draw_text(obj_bosstile.x+23,obj_bosstile.y-40,text);
			hitblank.visible = false;
			missblank.visible = true;
		} else if (damageAmount >= 1 && damageAmount < 10) {
			draw_text(obj_bosstile.x+23,obj_bosstile.y-40,text);
			hitblank.visible = true;
			missblank.visible = false;
		} else {
			draw_text(obj_bosstile.x+20,obj_bosstile.y-40,text);
			hitblank.visible = true;
			missblank.visible = false;
		}
		hitblank.x = obj_bosstile.x - 6;
		hitblank.y = obj_bosstile.y - 65;
		missblank.x = obj_bosstile.x - 6;
		missblank.y = obj_bosstile.y - 65;
