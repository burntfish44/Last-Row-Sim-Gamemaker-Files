/// @description Insert description here
// You can write your code in this editor

//reset text color from yellow to white
draw_set_color(c_white);
instance_destroy(lightningOptionOn);
instance_destroy(lightningOptionOff);
instance_destroy(babaOptionOn);
instance_destroy(babaOptionOff);
instance_destroy(zebakOptionOn);
instance_destroy(zebakOptionOff);
instance_destroy(zebLvlSliderLeft);
instance_destroy(zebLvlSliderRight);
instance_destroy(endlessModeOn);
instance_destroy(endlessModeOff);
instance_destroy(highHpOptionOn);
instance_destroy(highHpOptionOff);
instance_destroy(highPrayerOptionOn);
//instance_destroy(highPrayerOptionOff);

instance_destroy(wepSpeedSliderLeft);
instance_destroy(wepSpeedSliderRight);
// update player values on menu close
if (instance_exists(obj_playertile) == true) {
	if (playerHpChanged == true) {
		if (global.player_hp_boost_on == true) {
			obj_playertile.setPlayerHp(9999);
		} else {
			obj_playertile.setPlayerHp(99);
		}
	}
}

instance_destroy(visualMetronomeOn);
instance_destroy(visualMetronomeOff);
instance_destroy(statusBarsOn);
instance_destroy(statusBarsOff);
instance_destroy(hoveredTileOn);
instance_destroy(hoveredTileOff);

instance_destroy(volumeSlider);

instance_destroy(babaSoundOn);
instance_destroy(babaSoundOff);
instance_destroy(zebakSoundOn);
instance_destroy(zebakSoundOff);

instance_destroy(pingSlider);


instance_destroy(patchNotesButton);