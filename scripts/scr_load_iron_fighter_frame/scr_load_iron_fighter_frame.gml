#region Graphic things
//load the sprite

sprite_index = s_iron_fighter_original
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
var weapon_1_base_x_offset = 502 //orginal sprite
var weapon_1_base_y_offset = -180 //orginal sprite
//length including adjusments for image scale
var weapon_1_length_offset = point_distance(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset * image_scale))
//base direction offset
var weapon_1_direction_offset = point_direction(0, 0, (weapon_1_base_x_offset * image_scale), (weapon_1_base_y_offset* image_scale))


var weapon_2_base_x_offset = 502 //orginal sprite
var weapon_2_base_y_offset = 180 //orginal sprite
//length including adjusments for image scale
var weapon_2_length_offset = point_distance(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset * image_scale))
//base direction offset
var weapon_2_direction_offset = point_direction(0, 0, (weapon_2_base_x_offset * image_scale), (weapon_2_base_y_offset* image_scale))

//

//




var number_of_weapons = 2

weapon_visual_offsets[0, 0] = weapon_1_length_offset
weapon_visual_offsets[0, 1] = weapon_1_direction_offset
weapon_visual_offsets[1, 0] = weapon_2_length_offset
weapon_visual_offsets[1, 1] = weapon_2_direction_offset

basic_attack_array[@0, 0] = number_of_weapons
basic_attack_array[@0, 1] = team.right

for (var i = 1; i <= number_of_weapons; i++){

	basic_attack_array[@i, 0] = 5
	basic_attack_array[@i, 1] = s_bullet_original
	basic_attack_array[@i, 2] = weapon_damage_level_3 //damage
	basic_attack_array[@i, 3] = projectile.light //damage_type
	basic_attack_array[@i, 4] = weapon_visual_offsets[i-1, 0] //length from origin
	basic_attack_array[@i, 5] = weapon_visual_offsets[i-1, 1]//distance from origin
	basic_attack_array[@i, 6] = close_range //duration, or range really.
	
}

#endregion

#region Baseline variables
shields = medium_shields
armor = medium_armor
max_speed = 2
acceleration_rate = 0.1
turn_speed = .2
priority_target = target_class.frigate
energy = 0
max_energy = 0
fire_rate = medium_fast_attack_speed
fire_rate_counter = 0
class = target_class.fighter
#endregion

#region size in grid squares
ship_length = 2
ship_width = 1
#endregion