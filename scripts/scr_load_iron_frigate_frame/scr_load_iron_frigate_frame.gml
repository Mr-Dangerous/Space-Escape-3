#region Graphic things
//load the sprite
sprite_index = s_iron_frigate_original
var _sprite_length
if (sprite_height > sprite_width){
	_sprite_length = sprite_height
} else { 
	_sprite_length = sprite_width
}
image_scale = 128 / _sprite_length
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

basic_attack_array[@ 0, 0] = number_of_weapons
basic_attack_array[@ 0, 1] = team.right

basic_attack_array[@ 1, 0] = 5
basic_attack_array[@ 1, 1] = s_bullet_original
basic_attack_array[@ 1, 2] = 40 //damage
basic_attack_array[@ 1, 3] = projectile.light //damage_type
basic_attack_array[@ 1, 4] = weapon_visual_offsets[0,0] //length from origin
basic_attack_array[@ 1, 5] = weapon_visual_offsets[0, 1]
basic_attack_array[@ 1, 6] = 200

basic_attack_array[@ 2,0] = 5
basic_attack_array[@ 2,1] = s_bullet_original
basic_attack_array[@ 2,2] = 40 //damage
basic_attack_array[@ 2, 3] = projectile.light //damage_type
basic_attack_array[@ 2, 4] = weapon_visual_offsets[1,0] //length from origin
basic_attack_array[@ 2, 5] = weapon_visual_offsets[1, 1]
basic_attack_array[@ 2, 6] = 200

#endregion

#region Baseline variables
shields = 200
armor = 600
max_speed = 1
acceleration_rate = 0.01
turn_speed = .2
weapon_range = 400
priority_target = target_class.frigate
energy = 0
max_energy = 0
damage = 60
fire_rate = 100
fire_rate_counter = 0
projectile_sprite_resource = s_bullet_original
projectile_damage_type = projectile.medium
#endregion

#region size in grid squares
ship_length = 3
ship_width = 2
#endregion