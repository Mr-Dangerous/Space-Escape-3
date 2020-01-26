#region Graphic things

var _sprite_length
if (sprite_height > sprite_width){
	_sprite_length = sprite_height
} else { 
	_sprite_length = sprite_width
}
image_scale = medium_ship_size / _sprite_length
image_xscale = image_scale
image_yscale = image_scale
visible = true



//Weapon visual offsets
/*
Weapon 1 offsets are the x and y offsets on the base image.
Using the length offset and direction offset, a lengthdir_x and y
function can generate bullets from the desired location.
*/

//NOTE:  THE CRYSTAL FIGHTER AND FRIGATE WILL FIRE PLASMA BALLS.  BECAUSE WHY NOT

var weapon_1_base_x_offset = 325//orginal sprite
var weapon_1_base_y_offset = 0 //orginal sprite
//length including adjusments for image scale
var weapon_1_length_offset = point_distance(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset * image_scale))
//base direction offset
var weapon_1_direction_offset = point_direction(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset* image_scale))

var weapon_2_base_x_offset = 230//orginal sprite
var weapon_2_base_y_offset = -216//orginal sprite
//length including adjusments for image scale
var weapon_2_length_offset = point_distance(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset * image_scale))
//base direction offset
var weapon_2_direction_offset = point_direction(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset* image_scale))

var weapon_3_base_x_offset = 230 //orginal sprite
var weapon_3_base_y_offset = 216 //orginal sprite
//length including adjusments for image scale
var weapon_3_length_offset = point_distance(0, 0, (weapon_3_base_x_offset * image_scale), (weapon_3_base_y_offset * image_scale))
//base direction offset
var weapon_3_direction_offset = point_direction(0, 0, (weapon_3_base_x_offset * image_scale), (weapon_3_base_y_offset* image_scale))

weapon_visual_offsets[0, 0] = weapon_1_length_offset
weapon_visual_offsets[0, 1] = weapon_1_direction_offset

weapon_visual_offsets[1, 0] = weapon_2_length_offset
weapon_visual_offsets[1, 1] = weapon_2_direction_offset

weapon_visual_offsets[2, 0] = weapon_3_length_offset
weapon_visual_offsets[2, 1] = weapon_3_direction_offset

//weapon_visual_offsets[3, 0] = weapon_4_length_offset
//weapon_visual_offsets[3, 1] = weapon_4_direction_offset

#region exhausts
var _exhaust_1_x_offset = -206*image_scale
var _exhaust_1_y_offset = 130*image_scale

var _exhaust_2_x_offset = -206*image_scale
var _exhaust_2_y_offset = -130*image_scale



exhaust_array[0, 0] = point_direction(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)
exhaust_array[0, 1] = point_distance(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)

exhaust_array[1, 0] = point_direction(0, 0, _exhaust_2_x_offset, _exhaust_2_y_offset)
exhaust_array[1, 1] = point_distance(0, 0, _exhaust_2_x_offset, _exhaust_2_y_offset)


#endregion
#endregion
