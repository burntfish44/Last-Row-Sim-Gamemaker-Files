/// @description Insert description here
// You can write your code in this editor

// text settings
draw_set_font(osrs);
draw_set_color(c_yellow);

//lightningOn = obj_boss.lightning_on;
//babaOn = obj_boss.boulders_on;
//zebakOn = obj_boss.zebak_on;

//playerHpBoostOn = obj_playertile.player_hp_boost_on;
playerHpChanged = false;
//playerHpValue = 0;
//playerAttackSpeed = obj_ticktimer.attackspeed;

//obj_gamepause.updateGlobals();

// re-add cog, can be used to unpause
//instance_create_layer(1216,0,"UI_pause_screen_buttons",obj_game_settings_button);


// add boss options
lightningOptionOn = instance_create_layer(64,352,"UI_pause_screen_buttons",obj_checkbox_yes);
lightningOptionOn.trackValue("lightning");
lightningOptionOff = instance_create_layer(64,352,"UI_pause_screen_buttons",obj_checkbox_no);
lightningOptionOff.trackValue("lightning");
babaOptionOn = instance_create_layer(64,416,"UI_pause_screen_buttons",obj_checkbox_yes);
babaOptionOn.trackValue("boulders");
babaOptionOff = instance_create_layer(64,416,"UI_pause_screen_buttons",obj_checkbox_no);
babaOptionOff.trackValue("boulders");
zebakOptionOn = instance_create_layer(64,480,"UI_pause_screen_buttons",obj_checkbox_yes);
zebakOptionOn.trackValue("zebak");
zebakOptionOff = instance_create_layer(64,480,"UI_pause_screen_buttons",obj_checkbox_no);
zebakOptionOff.trackValue("zebak");
zebLvlSliderLeft = instance_create_layer(64,535,"UI_pause_screen_buttons",obj_slidebox_left);
zebLvlSliderLeft.trackValue("zeblvl");
zebLvlSliderRight = instance_create_layer(64,535,"UI_pause_screen_buttons",obj_slidebox_right);
zebLvlSliderRight.trackValue("zeblvl");
endlessModeOn = instance_create_layer(64,624,"UI_pause_screen_buttons",obj_checkbox_yes);
endlessModeOn.trackValue("endless");
endlessModeOff = instance_create_layer(64,624,"UI_pause_screen_buttons",obj_checkbox_no);
endlessModeOff.trackValue("endless");

// add player options
highHpOptionOn = instance_create_layer(544,352,"UI_pause_screen_buttons",obj_checkbox_yes);
highHpOptionOn.trackValue("playerhp");
highHpOptionOff = instance_create_layer(544,352,"UI_pause_screen_buttons",obj_checkbox_no);
highHpOptionOff.trackValue("playerhp");

//highPrayerOptionOn = instance_create_layer(544,416,"UI_pause_screen_buttons",obj_checkbox_yes);
//highPrayerOptionOn.trackValue("prayer");
//highPrayerOptionOff = instance_create_layer(544,416,"UI_pause_screen_buttons",obj_checkbox_no);
//highPrayerOptionOff.trackValue("prayer");
highPrayerOptionOn = instance_create_layer(544,416,"UI_pause_screen_buttons",obj_checkbox_yes_perma);

wepSpeedSliderLeft = instance_create_layer(544,480,"UI_pause_screen_buttons",obj_slidebox_left);
wepSpeedSliderLeft.trackValue("wepspeed");
wepSpeedSliderRight = instance_create_layer(544,480,"UI_pause_screen_buttons",obj_slidebox_right);
wepSpeedSliderRight.trackValue("wepspeed");

visualMetronomeOn = instance_create_layer(544,562,"UI_pause_screen_buttons",obj_checkbox_yes);
visualMetronomeOn.trackValue("vmetronome");
visualMetronomeOff = instance_create_layer(544,562,"UI_pause_screen_buttons",obj_checkbox_no);
visualMetronomeOff.trackValue("vmetronome");

statusBarsOn = instance_create_layer(544,626,"UI_pause_screen_buttons",obj_checkbox_yes);
statusBarsOn.trackValue("statusbars");
statusBarsOff = instance_create_layer(544,626,"UI_pause_screen_buttons",obj_checkbox_no);
statusBarsOff.trackValue("statusbars");

hoveredTileOn = instance_create_layer(544,690,"UI_pause_screen_buttons",obj_checkbox_yes);
hoveredTileOn.trackValue("hoveredtile");
hoveredTileOff = instance_create_layer(544,690,"UI_pause_screen_buttons",obj_checkbox_no);
hoveredTileOff.trackValue("hoveredtile");


// add sound options
volumeSlider = instance_create_layer(952,380,"UI_pause_screen_buttons",obj_volume_slider_base);

babaSoundOn = instance_create_layer(1020,416,"UI_pause_screen_buttons",obj_checkbox_yes);
babaSoundOn.trackValue("babasound");
babaSoundOff = instance_create_layer(1020,416,"UI_pause_screen_buttons",obj_checkbox_no);
babaSoundOff.trackValue("babasound");

zebakSoundOn = instance_create_layer(1020,480,"UI_pause_screen_buttons",obj_checkbox_yes);
zebakSoundOn.trackValue("zebaksound");
zebakSoundOff = instance_create_layer(1020,480,"UI_pause_screen_buttons",obj_checkbox_no);
zebakSoundOff.trackValue("zebaksound");

// add ping slider
pingSlider = instance_create_layer(952,672,"UI_pause_screen_buttons",obj_ping_slider);



patchNotesButton = instance_create_layer(32,704,"UI_pause_screen_buttons",obj_patchnotes_button);

//resetButton = instance_create_layer(960,352,"UI_pause_screen_buttons",obj_restart_button);
//resumeButton = instance_create_layer(960,256,"UI_pause_screen_buttons",obj_resume_button);

//function destroyOptions() {
//	instance_destroy(lightningOption);	
//}