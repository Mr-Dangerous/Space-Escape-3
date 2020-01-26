#region Graphic things
//load the sprite
var _sprite_length
if (sprite_height > sprite_width){
	_sprite_length = sprite_height
} else { 
	_sprite_length = sprite_width
}
image_scale = large_ship_size / _sprite_length
image_xscale = image_scale
image_yscale = image_scale
visible = true



//Weapon visual offsets
/*
Weapon 1 offsets are the x and y offsets on the base image.
Using the length offset and direction offset, a lengthdir_x and y
function can generate bullets from the desired location.
*/

//NOTE:  PLASMA.  BALLS.  LAYER NEEDS TO BE UNDERNEATH THE SHIP.
var weapon_1_base_x_offset = 230//orginal sprite
var weapon_1_base_y_offset = 0 //orginal sprite
//length including adjusments for image scale
var weapon_1_length_offset = point_distance(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset * image_scale))
//base direction offset
var weapon_1_direction_offset = point_direction(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset* image_scale))

var weapon_2_base_x_offset = 240//orginal sprite
var weapon_2_base_y_offset = -181//orginal sprite
//length including adjusments for image scale
var weapon_2_length_offset = point_distance(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset * image_scale))
//base direction offset
var weapon_2_direction_offset = point_direction(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset* image_scale))

var weapon_3_base_x_offset = 240 //orginal sprite
var weapon_3_base_y_offset = 181 //orginal sprite
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
var _exhaust_1_x_offset = -258*image_scale
var _exhaust_1_y_offset = 0*image_scale



exhaust_array[0, 0] = point_direction(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)
exhaust_array[0, 1] = point_distance(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)


#endregion


#endregion



#region Baseline variables
shields = high_sheilds
armor = very_high_armor
max_speed = slow_movement_speed
acceleration_rate = slow_acceleration
turn_speed = slow_turn_speed
priority_target = target_class.frigate
energy = 0

fire_rate = fast_attack_speed
fire_rate_counter = 0
secondary_fire_rate = 0
secondary_fire_rate_counter = 0
class = target_class.frigate

#endregion

