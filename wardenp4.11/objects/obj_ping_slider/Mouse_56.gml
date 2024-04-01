/// @description Insert description here
// You can write your code in this editor
is_being_dragged = false;

var newPing = array_get(frameDelay,a_info[0,e_info.selected]);
//show_debug_message("NEW PING!!!!: " + string(newPing));
global.indexOfPingArray = a_info[0,e_info.selected];
global.ping = newPing;

//global.volume = amount_current / 100; //0-1
//audio_group_set_gain(audiogroup_default,global.volume,0);