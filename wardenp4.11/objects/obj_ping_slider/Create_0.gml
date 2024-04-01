/// @description Insert description here
// You can write your code in this editor

// I don't really understand what's going on in these files, it just sorta works. 
// partially copied from my volume slider, partially implemented from https://www.youtube.com/watch?v=mOerb3nG3qM
cursor = cr_none;
//must be in increments of 16.66, cuz 1 frame is 16.66ms
pingOptions = [0,16,33,50,66,83,100,116,133,150,166,183,200,216,233,250,266,283];
frameDelay = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
enum e_info {
	total,
	selected
}

if (!variable_global_exists("indexOfPingArray")) {
	global.indexOfPingArray = 2; // default 33ms ping/2 frame delay
}
a_info[0, e_info.total] = 17;
a_info[0, e_info.selected] = global.indexOfPingArray;
amount_max = 100;
amount_current = (a_info[0,e_info.selected] / a_info[0,e_info.total]) * 100;
//amount_current = round(global.ping * 100);
//convert global into a percentage of the options 
//amount_current = round(((array_get_index(frameDelay,global.ping)) / 18) * 100);
//amount_current = (a_info[0,e_info.selected] / a_info[0,e_info.total]);

//show_debug_message("current and max: " + string(amount_current) + "/" + string(amount_max));
is_being_dragged = false;





