/// @description Insert description here
// You can write your code in this editor

//tell tile to activate damage
obj_floortile5.activateBoulderDamage();
instance_create_layer(obj_floortile5.x,obj_floortile5.y,"rubble",obj_boulder_break);
instance_destroy();