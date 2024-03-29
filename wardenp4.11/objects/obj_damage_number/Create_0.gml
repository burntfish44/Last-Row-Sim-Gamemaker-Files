/// @description Insert description here
// You can write your code in this editor
damageAmount = 0;
//exists = true;
existsTimer = 72; // how long the hitsplat is visible
//onBoss = false;
slotNum = 0;
draw_set_font(osrs);

if (obj_playertile.player_damage_number_1 == false) {
	//show_debug_message("assigning damage slot 1");
	slotNum = 1;
	obj_playertile.player_damage_number_1 = true;
	
} else if (obj_playertile.player_damage_number_2 == false) {
	//show_debug_message("assigning damage slot 2");
	slotNum = 2;
	obj_playertile.player_damage_number_2 = true;
	
} else if (obj_playertile.player_damage_number_3 == false) {
	//show_debug_message("assigning damage slot 3");
	slotNum = 3;
	obj_playertile.player_damage_number_3 = true;
	
} else if (obj_playertile.player_damage_number_4 == false) {
	//show_debug_message("assigning damage slot 4");
	slotNum = 4;
	obj_playertile.player_damage_number_4 = true;
} else {
	//show_debug_message("no room, don't display");
	return;
}

//show_debug_message(" damage object created" );

function applyNumber(value) {
	damageAmount = value;
}

function updateExistsTimer() {
	existsTimer = 72;
}

//show_debug_message("damage object drawn");
//create then hide hitsplat base
hitblank = instance_create_layer(x,y,"hitsplat",obj_hitsplat_player_blank);
missblank = instance_create_layer(x,y,"hitsplat",obj_hitsplat_player_miss_blank);
//obj_hitsplat_player_blank.visible = false;
//obj_hitsplat_player_miss_blank.visible = false;
