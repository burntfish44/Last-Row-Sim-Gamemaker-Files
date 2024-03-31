/// @description third set
// You can write your code in this editor

//show_debug_message("*** third set, adding lightnings n: " + string(tileTargetsTicksBeforeHit));

// create a lightning with 2 ticks delay at each tile that it is supposed to appear at
if (array_get(tileTargetsTicksBeforeHit,0) == 2) {
	instance_create_layer(352,480,"floor_lightnings",obj_lightning_shadow0);
}
if (array_get(tileTargetsTicksBeforeHit,1) == 2) {
	instance_create_layer(416,480,"floor_lightnings",obj_lightning_shadow1_rm);
}
if (array_get(tileTargetsTicksBeforeHit,2) == 2) {
	instance_create_layer(480,480,"floor_lightnings",obj_lightning_shadow2_rm);
}
if (array_get(tileTargetsTicksBeforeHit,3) == 2) {
	instance_create_layer(544,480,"floor_lightnings",obj_lightning_shadow3_rm);
}
if (array_get(tileTargetsTicksBeforeHit,4) == 2) {
	instance_create_layer(608,480,"floor_lightnings",obj_lightning_shadow4_rm);
}
if (array_get(tileTargetsTicksBeforeHit,5) == 2) {
	instance_create_layer(672,480,"floor_lightnings",obj_lightning_shadow5_rm);
}
if (array_get(tileTargetsTicksBeforeHit,6) == 2) {
	instance_create_layer(736,480,"floor_lightnings",obj_lightning_shadow6_rm);
}
if (array_get(tileTargetsTicksBeforeHit,7) == 2) {
	instance_create_layer(800,480,"floor_lightnings",obj_lightning_shadow7_rm);
}
if (array_get(tileTargetsTicksBeforeHit,8) == 2) {
	instance_create_layer(864,480,"floor_lightnings",obj_lightning_shadow8_rm);
}
