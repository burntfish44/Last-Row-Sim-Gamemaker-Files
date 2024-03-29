/// @description Insert description here
// You can write your code in this editor
damageAmount = 0;
existsTimer = 72; // how long the hitsplat is visible

draw_set_font(osrs);

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
hitblank.visible=false;
missblank.visible=false;
//obj_hitsplat_player_blank.visible = false;
//obj_hitsplat_player_miss_blank.visible = false;
