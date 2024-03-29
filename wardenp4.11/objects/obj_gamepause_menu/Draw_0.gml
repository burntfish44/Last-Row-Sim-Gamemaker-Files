/// @description Insert description here
// You can write your code in this editor

draw_self();
lightningOptionOn.visible = false;
lightningOptionOff.visible = false;
babaOptionOn.visible = false;
babaOptionOff.visible = false;
zebakOptionOn.visible = false;
zebakOptionOff.visible = false;
highHpOptionOn.visible = false;
highHpOptionOff.visible = false;
wepSpeedSliderLeft.visible = false;
wepSpeedSliderRight.visible = false;
babaSoundOn.visible = false;
babaSoundOff.visible = false;
zebakSoundOn.visible = false;
zebakSoundOff.visible = false;

// update which options should be checked by showing visible/non
if(global.lightning_on == true) {
	lightningOptionOn.visible = true;
	lightningOptionOff.visible = false;
} else {
	lightningOptionOn.visible = false;
	lightningOptionOff.visible = true;
}
if(global.boulders_on == true) {
	babaOptionOn.visible = true;
	babaOptionOff.visible = false;
} else {
	babaOptionOn.visible = false;
	babaOptionOff.visible = true;
}
if(global.zebak_on == true) {
	zebakOptionOn.visible = true;
	zebakOptionOff.visible = false;
} else {
	zebakOptionOn.visible = false;
	zebakOptionOff.visible = true;
}
if(global.endless_mode == true) {
	endlessModeOn.visible = true;
	endlessModeOff.visible = false;
} else {
	endlessModeOn.visible = false;
	endlessModeOff.visible = true;
}


if (global.player_hp_boost_on == true) {
	highHpOptionOn.visible = true;
	highHpOptionOff.visible = false;
} else {
	highHpOptionOn.visible = false;
	highHpOptionOff.visible = true;
}
if (global.player_prayer_boost_on == true) {
	highPrayerOptionOn.visible = true;
	//highPrayerOptionOff.visible = false;
} 
//else {
//	highPrayerOptionOn.visible = false;
//	highPrayerOptionOff.visible = true;
//}

if (global.attackspeed == 4) {
	wepSpeedSliderLeft.visible = true;
	wepSpeedSliderRight.visible = false;
} else {
	wepSpeedSliderLeft.visible = false;
	wepSpeedSliderRight.visible = true;
}
if(global.visual_metronome == true) {
	visualMetronomeOn.visible = true;
	visualMetronomeOff.visible = false;
} else {
	visualMetronomeOn.visible = false;
	visualMetronomeOff.visible = true;
}
if(global.status_bars == true) {
	statusBarsOn.visible = true;
	statusBarsOff.visible = false;
} else {
	statusBarsOn.visible = false;
	statusBarsOff.visible = true;
}

if(global.baba_sound == true) {
	babaSoundOn.visible = true;
	babaSoundOff.visible = false;
} else {
	babaSoundOn.visible = false;
	babaSoundOff.visible = true;
}
if(global.zebak_sound == true) {
	zebakSoundOn.visible = true;
	zebakSoundOff.visible = false;
} else {
	zebakSoundOn.visible = false;
	zebakSoundOff.visible = true;
}