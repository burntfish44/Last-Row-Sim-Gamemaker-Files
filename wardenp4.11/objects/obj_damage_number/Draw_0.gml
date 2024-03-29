/// @description Insert description here
// You can write your code in this editor

//if (exists == true) {
	existsTimer -= 1;
	if (existsTimer <= 0) {
		//exists = false;
		if (slotNum == 1) { // unset slot taken
			obj_playertile.player_damage_number_1 = false;
		} else if (slotNum == 2) {
			obj_playertile.player_damage_number_2 = false;	
		} else if (slotNum == 3) {
			obj_playertile.player_damage_number_3 = false;	
		} else if (slotNum == 4) {
			obj_playertile.player_damage_number_4 = false;	
		}
		instance_destroy(hitblank);
		instance_destroy(missblank);
		instance_destroy();
		return;
	}
	//show_debug_message("damage in dmg draw: " + string(damageAmount) + ", at slot: " + string(slotNum));
	
	text=string(damageAmount);
	if (slotNum == 1) {
		// show red histplat for 1+, blue for 0
		if (damageAmount <= 0.5) {
			draw_text(obj_bowfa_move_left.x+23,obj_bowfa_move_left.y-40,text);
			hitblank.visible = false;
			missblank.visible = true;
		} else {
			// draw the number itself
			draw_text(obj_bowfa_move_left.x+20,obj_bowfa_move_left.y-40,text);
			hitblank.visible = true;
			missblank.visible = false;
		}
		hitblank.x = obj_bowfa_move_left.x - 6;
		hitblank.y = obj_bowfa_move_left.y - 65;
		missblank.x = obj_bowfa_move_left.x - 6;
		missblank.y = obj_bowfa_move_left.y - 65;
	} else if (slotNum == 2) {
		// show red histplat for 1+, blue for 0
		if (damageAmount <= 0.5) {
			draw_text(obj_bowfa_move_left.x+47,obj_bowfa_move_left.y-30,text);
			hitblank.visible = false;
			missblank.visible = true;
		} else {
			draw_text(obj_bowfa_move_left.x+44,obj_bowfa_move_left.y-30,text);
			hitblank.visible = true;
			missblank.visible = false;
		}
		hitblank.x = obj_bowfa_move_left.x + 18;
		hitblank.y = obj_bowfa_move_left.y - 55;
		missblank.x = obj_bowfa_move_left.x + 18;
		missblank.y = obj_bowfa_move_left.y - 55;
	} else if (slotNum == 3) {
		// show red histplat for 1+, blue for 0
		if (damageAmount <= 0.5) {
			draw_text(obj_bowfa_move_left.x+18,obj_bowfa_move_left.y-10,text);
			hitblank.visible = false;
			missblank.visible = true;
		} else {
			draw_text(obj_bowfa_move_left.x+15,obj_bowfa_move_left.y-10,text);
			hitblank.visible = true;
			missblank.visible = false;

		}
		hitblank.x = obj_bowfa_move_left.x -11;
		hitblank.y = obj_bowfa_move_left.y - 35;
		missblank.x = obj_bowfa_move_left.x -11;
		missblank.y = obj_bowfa_move_left.y - 35;
	} else if (slotNum == 4) {
		// show red histplat for 1+, blue for 0
		if (damageAmount <= 0.5) {
			draw_text(obj_bowfa_move_left.x+49,obj_bowfa_move_left.y,text);
			hitblank.visible = false;
			missblank.visible = true;
		} else {
			draw_text(obj_bowfa_move_left.x+46,obj_bowfa_move_left.y,text);
			hitblank.visible = true;
			missblank.visible = false;
		}
		hitblank.x = obj_bowfa_move_left.x +18;
		hitblank.y = obj_bowfa_move_left.y - 25;
		missblank.x = obj_bowfa_move_left.x +18;
		missblank.y = obj_bowfa_move_left.y - 25;
	}
//}