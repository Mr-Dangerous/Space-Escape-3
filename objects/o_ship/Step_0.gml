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
		//find valid target
		if (!instance_exists(ship_target) or ship_target = noone){
			ship_target = scr_find_target()
		}
		
		if (instance_exists(ship_target)){
			//execute behavior
			distance_to_target = point_distance(x, y, ship_target.x, ship_target.y)
			weapon_range = projectile_flight_time*projectile_speed
			
			#region execute behavior
			combat_timing_counter--
			if (combat_timing_counter <= 0){
				combat_timing_counter = (irandom_range(40, 80)-pilot_reflexes)
			
				switch(class){
					//if ship is an interceptor....
					case target_class.interceptor:
						switch(ship_target.class){
							//and is targeting an interceptor.....
							case target_class.interceptor:
							scr_behavior_plan_temp()
							
							break;
						
							//and is targeting a fighter.....
							case target_class.fighter:
							scr_behavior_plan_temp()
							break;
						
							//and is targeting a frigate....
							case target_class.frigate:
							scr_behavior_plan_temp()
							break;
						}
					break;
				
					//the ship is a fighter....
					case target_class.fighter:
						switch(ship_target.class){
							//and is targeting an interceptor.....
							case target_class.interceptor:
							scr_behavior_plan_temp()
				
							break;
						
							//and is targeting a fighter.....
							case target_class.fighter:
							scr_behavior_plan_temp()
							break;
						
							//and is targeting a frigate....
							case target_class.frigate:
							scr_behavior_plan_temp()
							break;
						}
					break;
				
					//the ship is a frigate....
					case target_class.frigate:
						switch(ship_target.class){
							//and is targeting an interceptor.....
							case target_class.interceptor:
							scr_behavior_plan_temp()
							break;
						
							//and is targeting a fighter.....
							case target_class.fighter:
							scr_behavior_plan_temp()
							break;
						
							//and is targeting a frigate....
							case target_class.frigate:
							scr_behavior_plan_temp()
							break;
						}
					break;
				}
				#endregion
			
			
				//targeting and firing
				
		
				
			}
			var _direction_to_target = point_direction(x, y, ship_target.x, ship_target.y)
			var _distance_to_target = distance_to_object(ship_target)
			var _angle_difference_to_target = abs(angle_difference(image_angle, _direction_to_target))
		
			fire_counter++
			if (fire_counter >= fire_rate and _angle_difference_to_target < 4 and _distance_to_target < weapon_range){
				fire_counter = 0
				fire_basic_attack(basic_attack_array)
			}
			scr_movement_manager()
			
		}
		
	break;
}