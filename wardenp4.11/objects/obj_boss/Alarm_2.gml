/// @description first set
// You can write your code in this editor

//show_debug_message("*** first set, adding lightnings n: " + string(tileTargetsTicksBeforeHit));

// create a lightning with 0 delay at each tile that it is supposed to appear at
if (array_get(tileTargetsTicksBeforeHit,0) == 0) {
	instance_create_layer(352,480,"floor_lightnings",obj_lightning_shadow0);
}
if (array_get(tileTargetsTicksBeforeHit,1) == 0) {
	instance_create_layer(416,480,"floor_lightnings",obj_lightning_shadow1);
}
if (array_get(tileTargetsTicksBeforeHit,2) == 0) {
	instance_create_layer(480,480,"floor_lightnings",obj_lightning_shadow2);
}
if (array_get(tileTargetsTicksBeforeHit,3) == 0) {
	instance_create_layer(544,480,"floor_lightnings",obj_lightning_shadow3);
}
if (array_get(tileTargetsTicksBeforeHit,4) == 0) {
	instance_create_layer(608,480,"floor_lightnings",obj_lightning_shadow4);
}
if (array_get(tileTargetsTicksBeforeHit,5) == 0) {
	instance_create_layer(672,480,"floor_lightnings",obj_lightning_shadow5);
}
if (array_get(tileTargetsTicksBeforeHit,6) == 0) {
	instance_create_layer(736,480,"floor_lightnings",obj_lightning_shadow6);
}
if (array_get(tileTargetsTicksBeforeHit,7) == 0) {
	instance_create_layer(800,480,"floor_lightnings",obj_lightning_shadow7);
}
if (array_get(tileTargetsTicksBeforeHit,8) == 0) {
	instance_create_layer(864,480,"floor_lightnings",obj_lightning_shadow8);
}

