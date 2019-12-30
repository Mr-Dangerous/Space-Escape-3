#region loadup scripts
if (created = false){
	created = true

	
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
//post script loading
image_xscale = image_scale
image_yscale = image_scale
}
#endregion



switch(state){
	case ship.locked:
	
	break;
	
	case ship.planning:
	var _target_coordinate_array = battle_grid_positions[# assigned_grid_x, assigned_grid_y]
	var _target_x = _target_coordinate_array[0]
	var _target_y = _target_coordinate_array[1]
	x = _target_x
	y = _target_y
	show_debug_message(assigned_grid_x)
	show_debug_message(_target_x)
	
	fire_counter++
	if (fire_counter >= fire_rate){
		fire_counter = 0
		fire_basic_attack(basic_attack_array)
	}
	
	
	break;
	
	case ship.repositioning:
			
	
	break;
	
	case ship.battle:
	
	break;
}