/// @description tick processing
// You can write your code in this editor

// THIS IS THE CORE OF THE TICK SYSTEM. MOST THINGS QUEUED ARE PROCESSED HERE AND UNQUEUED

//show_debug_message(string(ticktimer) + ", last action: " + string(lastplayeraction));
//show_debug_message(string(ticktimer));

obj_playertile.timeAlive += 1;

// display visual metronome tick
if (global.visual_metronome == true) {
	if (visualtick < 5) {
		if (visualtick == 1) {
			visualtick++;
			instance_create_layer(992,374,"visualtick",obj_tick1);
			instance_destroy(obj_tick2);
			instance_destroy(obj_tick3);
			instance_destroy(obj_tick4);
		}
		else if (visualtick == 2) {
			visualtick++;
			instance_create_layer(992,374,"visualtick",obj_tick2);
			instance_destroy(obj_tick1);
			instance_destroy(obj_tick3);
			instance_destroy(obj_tick4);
		}
		else if (visualtick == 3) {
			visualtick++;
			instance_create_layer(992,374,"visualtick",obj_tick3);
			instance_destroy(obj_tick1);
			instance_destroy(obj_tick2);
			instance_destroy(obj_tick4);
		}
		else if (visualtick == 4) {
			visualtick = 1;
			instance_create_layer(992,374,"visualtick",obj_tick4);
			instance_destroy(obj_tick1);
			instance_destroy(obj_tick2);
			instance_destroy(obj_tick3);
		}
	}
}

// process incoming lightning damage
//compare array of lightning indexes to current index
// if youre standing on one, take damage
// extra check that if you just moved on, dont take damage?
// update current player tile position
currentPlayerTile = array_get_index(tileTruePositions_x,obj_playertile.x);
// if there are queued lightnings (should p much always be the case
//show_debug_message(" curent pos, and lightnings: " + string(currentPlayerTile) + ", " + string(lightningTimings) );
if (array_length(lightningTimings) > 0) {
	if (array_get(lightningTimings,currentPlayerTile) == 0) {
		//show_debug_message("!!! HIT ON TILE: " + string(currentPlayerTile));
		obj_playertile.ateLightningDamage();
	}
	
	//decrement each item in the array
	lightningTimingsPlaceholder = [];
	for (i = 0; i < array_length(lightningTimings); i++) {
		currentLightningItem = array_get(lightningTimings,i);
		if (currentLightningItem == -1) {
			array_push(lightningTimingsPlaceholder,-1);
		} else {
			array_push(lightningTimingsPlaceholder,currentLightningItem - 1);
		}
	}
	//show_debug_message("??? placeholder:"+string(lightningTimingsPlaceholder));
	lightningTimings = lightningTimingsPlaceholder;
}

// DO IT AGANE, with array#2 
if (array_length(lightningTimings2) > 0) {
	if (array_get(lightningTimings2,currentPlayerTile) == 0) {
		//show_debug_message("!!! HIT ON TILE: " + string(currentPlayerTile));
		obj_playertile.ateLightningDamage();
	}
	
	//decrement each item in the array #2
	if (array_length(lightningTimings2) > 0) {
		lightningTimingsPlaceholder = [];
		for (i = 0; i < array_length(lightningTimings2); i++) {
			currentLightningItem = array_get(lightningTimings2,i);
			if (currentLightningItem == -1) {
				array_push(lightningTimingsPlaceholder,-1);
			} else {
				array_push(lightningTimingsPlaceholder,currentLightningItem - 1);
			}
		}
		//show_debug_message("??? placeholder:"+string(lightningTimingsPlaceholder));
		lightningTimings2 = lightningTimingsPlaceholder;
	}
}

//show_debug_message("lightning finished processing, timings array 1: " + string(lightningTimings));
//show_debug_message("lightning finished processing, timings array 2: " + string(lightningTimings2));
// reset array if it's used up
if (array_contains_ext(lightningTimings, [0,1,2,3,4]) == false) {
	//show_debug_message("0-4 not included in " + string(lightningTimings));
	lightningTimings = [];
}
if (array_contains_ext(lightningTimings2, [0,1,2,3,4]) == false) {
	//show_debug_message("0-4 not included in " + string(lightningTimings2));
	lightningTimings2 = [];
}
//show_debug_message("post cleanup 1/2: " + string(lightningTimings) + "/" + string(lightningTimings2));



// process visual movement from last tick
// generate attack if attacking and if attack is off cooldown
if (attackstate == true) {
	movementstate = false;
	if (ticktimer - lastattacktick >= global.attackspeed) {
		if (global.attackspeed == 4) {
			instance_create_layer(obj_playertile.x+16,obj_playertile.y-32,"projectile",obj_rangeball);
		} else if (global.attackspeed == 5) {
			instance_create_layer(obj_playertile.x+16,obj_playertile.y-32,"projectile",obj_mageball);
		}
		lastattacktick = ticktimer;
	}
}

// player is moving
if (movementstate == true) {
	if (pdestination_x < player_x) {
		player_direction = "left";	
	} else if (pdestination_x > player_x) {
		player_direction = "right";
	}
	// edges, can't go past
	if (pdestination_x > 864) {
		pdestination_x = 864;
	} else if (pdestination_x < 352) {
		pdestination_x = 352;
	}
	//show_debug_message("movement state true, player going: " + string(player_direction));
	// if distance is short, go to the new spot
	if (point_distance(pdestination_x,480,player_x,480)<=64){
		obj_playertile.playermove(pdestination_x,480);
		movementstate = false;
	} else if (point_distance(pdestination_x,480,player_x,480)>64) {
		// otherwise keep moving
		if (movementstate == true) {
			if (walking == true) {
				if (pdestination_x > player_x) {
					obj_playertile.playermove(player_x + 64, player_y);
				} else {
					obj_playertile.playermove(player_x - 64, player_y);
				}
			} else {
				if (pdestination_x > player_x) {
					obj_playertile.playermove(player_x + 128, player_y);
				} else {
					obj_playertile.playermove(player_x - 128, player_y);
				}
			}
			attackstate = false;
		}
	}
	// queue next movement
	if (point_distance(pdestination_x,480,player_x,player_y)<184){
		obj_playertile.nextx=pdestination_x;
		obj_playertile.nexty=480;
	}
}

// process incoming damage
if (incomingAttack == true) {
	// actual damage
	if (incomingAttackDamage > 0) {
		obj_playertile.ateZebakHit();
	} else { // a 0
		obj_playertile.hitButNoDamage();
	}
	incomingAttack = false;
	incomingAttackType = "";
	incomingAttackDamage = 0;
}

// process prayer activation/deactivation
//show_debug_message("updating prayer to: " + obj_playertile.active_prayer);
if (obj_playertile.active_prayer == "none") { //both off
	instance_create_layer(1070,615,"UI_prayer",obj_mage_prayer_off);
	instance_create_layer(1115,615,"UI_prayer",obj_range_prayer_off);
	instance_destroy(obj_mage_prayer_on);
	instance_destroy(obj_range_prayer_on);
} else if (obj_playertile.active_prayer == "mage") {
	instance_create_layer(1070,615,"UI_prayer",obj_mage_prayer_on);
	instance_create_layer(1115,615,"UI_prayer",obj_range_prayer_off);
	instance_destroy(obj_mage_prayer_off);
	instance_destroy(obj_range_prayer_on);
	if (prayerJustChanged == true) {
		audio_play_sound(snd_mage_pray_on,1,0);
		prayerJustChanged = false;
	}
} else if (obj_playertile.active_prayer == "range") {
	instance_create_layer(1115,615,"UI_prayer",obj_range_prayer_on);
	instance_create_layer(1070,615,"UI_prayer",obj_mage_prayer_off);
	instance_destroy(obj_range_prayer_off);
	instance_destroy(obj_mage_prayer_on);
	if (prayerJustChanged == true) {
		audio_play_sound(snd_range_pray_on,1,0);
		prayerJustChanged = false;
	}
}

// draw prayer overhead on player
if (obj_playertile.active_prayer == "mage") {
	obj_mage_prayer_on_player.visible = true;
	obj_range_prayer_on_player.visible = false;
} else if (obj_playertile.active_prayer == "range") {
	obj_mage_prayer_on_player.visible = false;
	obj_range_prayer_on_player.visible = true;
} else { // no prayer
	obj_mage_prayer_on_player.visible = false;
	obj_range_prayer_on_player.visible = false;
}

// process food 
if (drank_ambro == true) {
	if (obj_playertile.player_health <= 125) {
		obj_playertile.player_health = 125;
		obj_playertile.player_prayer_points = 123;
	} else {
		obj_playertile.player_health = obj_playertile.player_health + 125;
		obj_playertile.player_prayer_points = 123;
	}
	drank_ambro = false
} else if (drank_brew == true) {
	obj_playertile.player_health += 17;
	drank_brew = false;
} else if (drank_restore == true) {
	obj_playertile.player_prayer_points += 32;
	drank_restore = false;
}

// increment tick
ticktimer++;
// recurse
alarm_set(0,36);