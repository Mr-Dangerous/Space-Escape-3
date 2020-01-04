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
	
	if (ship_team = team.left){
		battle_grid = battle_map.left_grid_container
		battle_grid_positions = battle_map.left_grid_positions
	
		
	}
	if (ship_team = team.right){
		battle_grid = battle_map.right_grid_container
		battle_grid_positions = battle_map.right_grid_positions
		
	}
	scr_determine_start_location()
	projectile_speed = basic_attack_array[1,0]
	projectile_flight_time = basic_attack_array[1, 6]
	
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

if (ship_team = team.right){
	allied_fleet = fleet_object.right_fleet
	enemy_fleet = fleet_object.left_fleet
	
}
if (ship_team = team.left){
	allied_fleet = fleet_object.left_fleet
	enemy_fleet = fleet_object.right_fleet
}


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
		
	break;
	
	case ship.repositioning:
			
	
	break;
	
	case ship.battle:
		//find target
		if (!instance_exists(ship_target)){
			ship_target = scr_return_target()
		}
		//find how many enemies on tail
		var enemies_targeting_ship_array = scr_get_ship_tail_number()
		var number_of_enemies_targeting_ship = array_length_1d(enemies_targeting_ship_array)
		
		//whole thing may need to be folded into combat timing thing.
		//check to see if in range of target
		if (instance_exists(ship_target)){
			
			var distance_to_target = distance_to_object(ship_target)
			var current_weapon_range = basic_attack_array[1, 6]*basic_attack_array[1, 0]
		
			combat_timing_counter--
		
			if (combat_timing_counter <= 0){
				combat_timing_counter = irandom_range(40, 80) - pilot_reflexes
				//if target is out of range....
				if (distance_to_target > current_weapon_range*1.2){
					//seek the target
					scr_set_movement_variables(true, false, false, false, false)
				} else {
					//all of the combat AI should be here
					switch(class){
					case target_class.interceptor:
					//the interceptor should be agile and responsive.
					//It will often use the strafe behavior.
					//prepare to evade!
					if (number_of_enemies_targeting_ship > 3){
						//find the nearest enemy targeting the ship and flee from it
						var nearest_enemy = noone
						var distance_to_nearest_enemy = 200
						for (var i = 0; i < number_of_enemies_targeting_ship-1; i++){
							var distance_to_enemy = distance_to_object(enemies_targeting_ship_array[i])
							if (distance_to_enemy < distance_to_nearest_enemy){
								nearest_enemy = enemies_targeting_ship_array[i]
							}
						}
						if (instance_exists(nearest_enemy)){
							scr_set_movement_variables(false, true, false, false, false)
						}
					}
										
					break;
					case target_class.fighter:
					//The fighter should be deadly and precise
					//It will often attempt to anticipate the opponents movements 
					//and attempt to get into solid positions
				
					break;
					case target_class.frigate:
					//The frigate should be mostly stationary.
					//IT will use superior range to win the day.
					break;
					}
					
				}
			
			}
			scr_movement_manager()
		}
		
		
	break;
	
	case ship.firing_range://for testing purposes only.
	fire_rate_counter++
	image_angle+=.5
	direction=image_angle
	if (fire_rate_counter >= fire_rate){
		fire_rate_counter = 0
		fire_basic_attack(basic_attack_array)
	}
	break;
}