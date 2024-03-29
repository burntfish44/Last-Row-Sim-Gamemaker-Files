/// @description Insert description here
// You can write your code in this editor

//tell tile to activate damage
obj_floortile0.activateBoulderDamage();
var boulder = instance_create_layer(obj_floortile0.x,obj_floortile0.y,"rubble",obj_boulder_break);
instance_destroy();