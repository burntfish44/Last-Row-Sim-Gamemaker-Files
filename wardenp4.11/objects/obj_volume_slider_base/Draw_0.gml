/// @description Insert description here
// You can write your code in this editor

draw_self();

var knob_amount = amount_current / amount_max;
var knob_position_x = x + ((sprite_width - 20) * knob_amount);

draw_sprite(Sprite95,0,knob_position_x,y - 10);