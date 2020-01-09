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
	max_armor = armor
	max_shields = shields
	//temporary for now
	
}
#endregion

if (ship_team = team.right){
	allied_fleet = card_game_ui_object.right_fleet
	enemy_fleet = card_game_ui_object.left_fleet
	
	
}
if (ship_team = team.left){
	allied_fleet = card_game_ui_object.left_fleet
	enemy_fleet = card_game_ui_object.right_fleet
	show_debug_message(shields)
	show_debug_message(armor)
}

if (armor <= 0){
	instance_destroy()
}
var _energy_multiplier = 10


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
		//tick variables
		if (energy_sub_counter < max_energy*_energy_multiplier) energy_sub_counter++
		energy = energy_sub_counter/_energy_multiplier
		if (energy >= max_energy){
			if (ability_load_script != 0){
				//will actually be a state
				state = ship.cast_ability
			}
		}
	
		//find target
		if (!instance_exists(ship_target)){
			ship_target = scr_return_target()
		}
		
		if (instance_exists(ship_target)){
			
			var distance_to_target = point_distance(x, y, ship_target.x, ship_target.y)
			var direction_to_target = point_direction(x, y, ship_target.x, ship_target.y)
			var current_weapon_range = basic_attack_array[1, 6]*basic_attack_array[1, 0]
			var secondary_weapon_range = secondary_attack_array[1, 6]*secondary_attack_array[1, 0]
			var gimbal_fire_angle = basic_attack_array[0,3]
			var secondary_gimbal_fire_angle = secondary_attack_array[0, 3]
			
			turn_to_face_direction(direction_to_target)
			direction = image_angle
			if (distance_to_target > current_weapon_range){
				speed += acceleration_rate
			} else {
				speed -= acceleration_rate
			}
			limit_speed()
			
			
			//set up firing behavior
			//primary attack
			
			var angle_to_target = abs(angle_difference(image_angle, direction_to_target))
			fire_rate_counter++
			if (fire_rate_counter >= fire_rate and angle_to_target < gimbal_fire_angle and distance_to_target <= current_weapon_range){
				fire_rate_counter = 0
				fire_basic_attack(basic_attack_array)
			}
			if (secondary_fire_rate != -1){
				secondary_fire_rate_counter++
				if (secondary_fire_rate_counter >= secondary_fire_rate and angle_to_target < secondary_gimbal_fire_angle and distance_to_target <= secondary_weapon_range * 1.3){
					secondary_fire_rate_counter = 0
					fire_basic_attack(secondary_attack_array)
					show_debug_message("secondary_attack_fired")
				}
			}
		}
			
	break;
	
	case ship.cast_ability:
		script_execute(ability_script)
		

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

//Post stat machine ability scripts
if (temporary_shield_counter > 0){
	temporary_shield_counter--
	if (temporary_shield_counter = 1){
		if (temporary_shields > 0){
			temporary_shields = 0
		}
	}
}