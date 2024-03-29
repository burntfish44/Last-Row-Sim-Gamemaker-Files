/// @description Insert description here
// You can write your code in this editor

//tell tile to activate damage
obj_floortile6.activateBoulderDamage();
instance_create_layer(obj_floortile6.x,obj_floortile6.y,"rubble",obj_boulder_break);
instance_destroy();