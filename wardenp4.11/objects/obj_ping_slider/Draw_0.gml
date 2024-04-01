/// @description Insert description here
// You can write your code in this editor
draw_self();

var knob_amount = amount_current / amount_max; // 0-1, percentage based
var knob_amount_percentage = knob_amount * 100;

//show_debug_message("knob amount: " + string(knob_amount));

a_info[0, e_info.selected] = round((a_info[0,e_info.total] / 100) * knob_amount_percentage);

var percentage2 = (a_info[0,e_info.selected] / a_info[0,e_info.total]);

var knob_position_x = x + ((sprite_width - 20) * percentage2);

draw_text_transformed(1152,660,string(array_get(pingOptions,a_info[0,e_info.selected])),2,2,0);

draw_sprite(Sprite95,0,knob_position_x,y - 10);