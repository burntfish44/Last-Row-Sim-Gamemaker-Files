/// @description explosion
// You can write your code in this editor
//show_debug_message("explosion animation start, try to dmg player");
//obj_ticktimer.updateIncomingAttack("mage");
obj_playertile.zebakProjectileHit("mage");
instance_create_layer(obj_player_collision_box.x,obj_player_collision_box.y,"zebak_attacks_projs",obj_zebak_pot_proj_hit);
instance_destroy();