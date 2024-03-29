/// @description Insert description here
// You can write your code in this editor

obj_playertile.active_prayer = "range";
obj_ticktimer.prayerJustChanged = true;

instance_create_layer(1070,615,"UI_prayer",obj_mage_prayer_off);
instance_create_layer(1115,615,"UI_prayer",obj_range_prayer_on);
instance_destroy(obj_mage_prayer_on);
instance_destroy();