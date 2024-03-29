/// @description 
// You can write your code in this editor

// check hp
if(boss_health <= 0) {
	//boss dies
	show_debug_message("***boss is dead!!");
	boss_health = 0; //remove overkill
	processBossDeath();
	//instance_destroy();
}
