/// @description Insert description here
// You can write your code in this editor
is_being_dragged = false;

global.volume = amount_current / 100; //0-1
audio_group_set_gain(audiogroup_default,global.volume,0);