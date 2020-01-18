#region Graphic things
//load the sprite
sprite_index = s_pirate_interceptor_original
var _sprite_length
if (sprite_height > sprite_width){
	_sprite_length = sprite_height
} else { 
	_sprite_length = sprite_width
}
image_scale = small_ship_size / _sprite_length
image_xscale = image_scale
image_yscale = image_scale
visible = true



//Weapon visual offsets
/*
Weapon 1 offsets are the x and y offsets on the base image.
Using the length offset and direction offset, a lengthdir_x and y
function can generate bullets from the desired location.
*/
var weapon_1_base_x_offset = 45 //orginal sprite
var weapon_1_base_y_offset = -121 //orginal sprite
//length including adjusments for image scale
var weapon_1_length_offset = point_distance(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset * image_scale))
//base direction offset
var weapon_1_direction_offset = point_direction(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset* image_scale))


var weapon_2_base_x_offset = 45 //orginal sprite
var weapon_2_base_y_offset = 121 //orginal sprite
//length including adjusments for image scale
var weapon_2_length_offset = point_distance(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset * image_scale))
//base direction offset
var weapon_2_direction_offset = point_direction(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset* image_scale))

var number_of_weapons = 2

weapon_visual_offsets[0, 0] = weapon_1_length_offset
weapon_visual_offsets[0, 1] = weapon_1_direction_offset
weapon_visual_offsets[1, 0] = weapon_2_length_offset
weapon_visual_offsets[1, 1] = weapon_2_direction_offset

basic_attack_array[ 0, 0] = number_of_weapons
basic_attack_array[ 0, 1] = ship_team
basic_attack_array[0, 2] = image_scale

for (var i = 1; i <= number_of_weapons; i++){

	basic_attack_array[i, 0] = 5
	basic_attack_array[i, 1] = s_bullet_original
	basic_attack_array[i, 2] = weapon_damage_level_2 //damage
	basic_attack_array[i, 3] = projectile.light //damage_type
	basic_attack_array[i, 4] = weapon_visual_offsets[i-1, 0] //length from origin
	basic_attack_array[i, 5] = weapon_visual_offsets[i-1, 1]//distance from origin
	basic_attack_array[i, 6] = close_range //duration, or range really.
}
#region exhausts
var _exhaust_1_x_offset = -287*image_scale
var _exhaust_1_y_offset = 0*image_scale



exhaust_array[0, 0] = point_direction(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)
exhaust_array[0, 1] = point_distance(0, 0, _exhaust_1_x_offset, _exhaust_1_y_offset)


#endregion

#endregion


#region Baseline variables
shields = low_shields
armor = low_armor
max_speed = fast_movement_speed
acceleration_rate = fast_acceleration
turn_speed = fast_turn_speed
priority_target = target_class.fighter
energy = 0

fire_rate = medium_fast_attack_speed
fire_rate_counter = 0
class = target_class.interceptor
#endregion