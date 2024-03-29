/// @description Insert description here
// You can write your code in this editor

//tell tile to activate damage
obj_floortile3.activateBoulderDamage();
instance_create_layer(obj_floortile3.x,obj_floortile3.y,"rubble",obj_boulder_break);
instance_destroy();