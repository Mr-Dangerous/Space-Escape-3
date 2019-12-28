/// @description 
if (created = false){
	created = true
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
	
	show_debug_message("shields" + string(shields))
	show_debug_message("armor " +string(armor))
	

	//post script loading
	image_xscale = image_scale
	image_yscale = image_scale

	#endregion
}

switch(state){
	case ship.locked:
	
	break;
	
	case ship.planning:
	
	break;
	
	case ship.battle:
	
	break;
}