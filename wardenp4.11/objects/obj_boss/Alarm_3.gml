/// @description second set
// You can write your code in this editor

//show_debug_message("*** second set, adding lightnings n: " + string(tileTargetsTicksBeforeHit));

// create a lightning with 1 tick delay at each tile that it is supposed to appear at
if (array_get(tileTargetsTicksBeforeHit,0) == 1) {
	instance_create_layer(352,480,"floor_lightnings",obj_lightning_shadow0);
}
if (array_get(tileTargetsTicksBeforeHit,1) == 1) {
	instance_create_layer(416,480,"floor_lightnings",obj_lightning_shadow1_rm);
}
if (array_get(tileTargetsTicksBeforeHit,2) == 1) {
	instance_create_layer(480,480,"floor_lightnings",obj_lightning_shadow2_rm);
}
if (array_get(tileTargetsTicksBeforeHit,3) == 1) {
	instance_create_layer(544,480,"floor_lightnings",obj_lightning_shadow3_rm);
}
if (array_get(tileTargetsTicksBeforeHit,4) == 1) {
	instance_create_layer(608,480,"floor_lightnings",obj_lightning_shadow4_rm);
}
if (array_get(tileTargetsTicksBeforeHit,5) == 1) {
	instance_create_layer(672,480,"floor_lightnings",obj_lightning_shadow5_rm);
}
if (array_get(tileTargetsTicksBeforeHit,6) == 1) {
	instance_create_layer(736,480,"floor_lightnings",obj_lightning_shadow6_rm);
}
if (array_get(tileTargetsTicksBeforeHit,7) == 1) {
	instance_create_layer(800,480,"floor_lightnings",obj_lightning_shadow7_rm);
}
if (array_get(tileTargetsTicksBeforeHit,8) == 1) {
	instance_create_layer(864,480,"floor_lightnings",obj_lightning_shadow8_rm);
}