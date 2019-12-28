#region Graphic things
//load the sprite
sprite_index = s_iron_interceptor_original
image_scale = 0.06
image_xscale = image_scale
image_yscale = image_scale



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
#endregion

#region Baseline variables
shields = 0
armor = 100
max_speed = 1
acceleration_rate = 0.01
turn_speed = .2
weapon_range = 400
priority_target = target_class.frigate
energy = 0
max_energy = 0
damage = 20
fire_rate = 40
fire_rate_counter = 0
projectile_sprite_resource = s_bullet_original
projectile_damage_type = projectile.light
#endregion

#region size in grid squares
ship_length = 1
ship_width = 1
#endregion