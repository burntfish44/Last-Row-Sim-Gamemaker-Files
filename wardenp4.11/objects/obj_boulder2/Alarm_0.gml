/// @description Insert description here
// You can write your code in this editor

//tell tile to activate damage
obj_floortile2.activateBoulderDamage();
instance_create_layer(obj_floortile2.x,obj_floortile2.y,"rubble",obj_boulder_break);
instance_destroy();