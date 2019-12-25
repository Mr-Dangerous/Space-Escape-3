
#region Graphic things
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
weapon_visual_offsets = array_create(number_of_weapons [0, 0])
weapon_visual_offsets[0, 0] = weapon_1_length_offset
weapon_visual_offsets[0, 1] = weapon_1_direction_offset
weapon_visual_offsets[1, 0] = weapon_2_length_offset
weapon_visual_offsets[1, 1] = weapon_2_direction_offset
#endregion

#region Baseline variables
shields = 0
armor = 0
max_speed = 0
acceleration_rate = 0
turn_speed = .5
weapon_range = 0
priority_target = 0
energy = 0
#endregion

#region size
ship_length = 1
ship_width = 1
#endregion

#region positioning
battle_grid = 0
battle_map = instance_find(o_battle_map, 0)
if (ship_team = team.left){
	battle_grid = battle_map.left_grid_container
}
if (ship_team = team.right){
	battle_grid = battle_map.right_grid_container
}
#endregion

#region loadup scripts
loading_scripts[0] = frame_load_script
loading_scripts[1] = weapon_load_script
loading_scripts[2] = shield_load_script
loading_scripts[3] = armor_load_script
loading_scripts[4] = targeting_load_script
loading_scripts[5] = ability_load_script
loading_scripts[6] = power_load_script
#endregion

#region script loading
var number_of_scripts = array_length_1d(loading_scripts)
for (var i = 0; i < number_of_scripts; i++){
	if (loading_scripts[i] != 0){
		script_execute(loading_scripts[i])
	}
}

#endregion

state = ship.planning



