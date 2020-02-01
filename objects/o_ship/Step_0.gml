#region loadup scripts
if (created = false){
	created = true
	
	#region get the correct instance refrences
	if (ship_team = team.left){
		allied_fleet = card_game_ui_object.left_fleet
		enemy_fleet = card_game_ui_object.right_fleet
		battle_grid = battle_map.left_grid_container
		battle_grid_positions = battle_map.left_grid_positions

			
	}
	if (ship_team = team.right){
		allied_fleet = card_game_ui_object.right_fleet
		enemy_fleet = card_game_ui_object.left_fleet
		battle_grid = battle_map.right_grid_container
		battle_grid_positions = battle_map.right_grid_positions
		direction = 180
		image_angle = 180
	}
	#endregion
	

	basic_attack_array[0, 1] = ship_team
	secondary_attack_array[0, 1] = ship_team
#endregion
#region script loading
	//slap that JSON array in there
	var _ship_map = card_game_ui_object.ship_maps[? name]
    origin = _ship_map[? "Origin"]
    class = _ship_map[? "Class"]
    sub_class = _ship_map[? "Sub Class"]
    resource_cost = _ship_map[? "Resource Cost"]
    armor = _ship_map[? "Armor"]
    shields = _ship_map[? "Shields"]
    armor_resilency = _ship_map[? "Armor Resiliency"]
    shield_power = _ship_map[? "Shield Power"]
    max_speed = _ship_map[? "Max Speed"]
    turn_speed = _ship_map[? "Turn Speed"]
    acceleration_rate = _ship_map[? "Acceleration"]
    fuel_cost = _ship_map[? "Fuel Cost"]
    ship_mass = _ship_map[? "Ship Mass"]
    basic_attack_number = _ship_map[? "Number of Basic Attacks"]
    basic_attack_projectile_speed = _ship_map[? "Basic Attack Projectile Speed"]
    basic_attack_projectile_duration = _ship_map[? "Basic Attack Projectile Duration"]
    basic_attack_weapon_speed = _ship_map[? "Basic Attack Weapon Speed"]
    basic_attack_weapon_damage = _ship_map[? "Basic Attack Weapon Damage"]
    basic_attack_weapon_mass = _ship_map[? "Basic Attack Weapon Mass"]
	basic_attack_range = basic_attack_projectile_speed*basic_attack_projectile_duration
    basic_attack_projectile_sprite = s_bullet_original
	energy = _ship_map[? "Energy Starting"]
    max_energy = _ship_map[? "Energy to Cast"]
    energy_per_second = _ship_map[? "Energy Generation"]
    basic_ability = asset_get_index(_ship_map[? "Basic Ability Script"])
		
	var number_of_scripts = array_length_1d(loading_scripts)
	for (var i = 0; i < number_of_scripts; i++){
		if (loading_scripts[i] != 0){
			script_execute(loading_scripts[i])
		}
	}
	//Get the basic attacks working
	basic_attack_array[0, 0] = basic_attack_number//number of basic attacks
	basic_attack_array[0, 1] = ship_team
	basic_attack_array[0, 2] = image_scale //seperate image scale of projectile
	basic_attack_array[0, 3] = 5//gimbal_fire_angle
	basic_attack_array[0, 4] = basic_attack_weapon_mass //basic weapon weapon mass
	basic_attack_array[0, 5] = true//if the damage is directional in nature
	//for each basic attack
	for (var i = 1; i < basic_attack_number+1; i++){
		
		basic_attack_array[i, 0] = basic_attack_projectile_speed //basic speed
		basic_attack_array[i, 1] = basic_attack_projectile_sprite //projectile resource
		basic_attack_array[i, 2] = basic_attack_weapon_damage //damage
		basic_attack_array[i, 3] = projectile.light //damage_type//DEPRECATED
		basic_attack_array[i, 4] = weapon_visual_offsets[i-1, 0] //length from origin
		basic_attack_array[i, 5] = weapon_visual_offsets[i-1, 1] //direction? from origin
		basic_attack_array[i, 6] = basic_attack_projectile_duration //flight time in frames
	}
	
	//post script loading
	//NOTE:  imagescale needs to adjust.
	var _sprite = asset_get_index(string(_ship_map[? "Sprite"]))
	var _sprite_longest_dimension = sprite_get_width(_sprite)
	if (sprite_get_height(_sprite) > _sprite_longest_dimension){
		_sprite_longest_dimension = sprite_get_height(_sprite)
	}
	switch(class){
		case "Interceptor":
			image_scale = 64/_sprite_longest_dimension
		break;
		
		case "Fighter":
			image_scale = 96/_sprite_longest_dimension
		break;
		
		case "Frigate":
			image_scale = 186/_sprite_longest_dimension
		break;
	}
	image_xscale = image_scale
	image_yscale = image_scale
	

	
	//assign relavent values to things
	max_armor = armor
	max_shields = shields
	scr_apply_origin_class_bonus()//Consideration - maybe somewhere else?

	
}
#endregion
#region Pre state machine checks



if (armor <= 0){
	combat_explosion = true
	instance_destroy()
}

if (ship_disabled_counter > 0){
	state = ship.disabled
}


if (cloak){
	if (cloak_timer > 0){
		cloak_timer--
	}
	if (image_alpha > .5){
		image_alpha -= .05
	}
	if (cloak_timer = 0){
		cloak = false
		if (state = ship.stalking) state = ship.battle
	}
} else {
	if (image_alpha < 1){
		image_alpha += .1
		if (image_alpha>1){
			image_alpha = 1
		}
	}
}

//determine exhaust scale multipler
exhaust_scale_multiplier = 1
if (speed = 0) exhaust_scale_multiplier = 0


//determine some dynamically calculated variables
energy_current_bonus = 0 + hyper_amp_bonus
energy_current = floor(max_energy/5) + energy_current_bonus
attack_speed_multiplier = 1 + hunter_strike_multiplier
weapon_damage_bonus = 0 + command_strike_bonus


#endregion



#region State MAchine
switch(state){
	
	case ship.locked:
	
	break;
	
	case ship.planning:
	var _target_coordinate_array = battle_grid_positions[# assigned_grid_x, assigned_grid_y]
	var _target_x = _target_coordinate_array[0]
	var _target_y = _target_coordinate_array[1]
	x = _target_x
	y = _target_y

		
	break;
	
	case ship.repositioning:
			
	
	break;
	
	case ship.battle:
		//tick variables
		if (energy_sub_counter < 15) energy_sub_counter++
		if (energy_sub_counter >= 15){
			energy_sub_counter = 0
			energy += energy_per_second
		}
		
	
		//find target
		if (!instance_exists(ship_target) or ship_target.cloak){
			ship_target = scr_return_target()
		}
		
		if (instance_exists(ship_target)){
			
			var distance_to_target = point_distance(x, y, ship_target.x, ship_target.y)
			var direction_to_target = point_direction(x, y, ship_target.x, ship_target.y)
			var current_weapon_range = basic_attack_range
			var secondary_weapon_range = secondary_attack_array[1, 6]*secondary_attack_array[1, 0]
			var gimbal_fire_angle = 5//basic_attack_array[0,3]
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
			basic_attack_weapon_speed_counter++
			if (basic_attack_weapon_speed_counter * attack_speed_multiplier >= basic_attack_weapon_speed and angle_to_target < gimbal_fire_angle and distance_to_target <= current_weapon_range){
				if (precision_strike_attacks < 1){
					basic_attack_weapon_speed_counter = 0
				} else {
					precision_strike_attacks--
					basic_attack_weapon_speed_counter = basic_attack_weapon_speed-10
				}
				fire_basic_attack(basic_attack_array)
			}
			if (secondary_attack_weapon_speed_counter != -1){
				secondary_attack_weapon_speed_counter++
				if (secondary_attack_weapon_speed_counter * attack_speed_multiplier >= secondary_attack_weapon_speed and angle_to_target < gimbal_fire_angle and distance_to_target <= current_weapon_range){
					secondary_attack_weapon_speed_counter = 0
					fire_secondary_attack(secondary_attack_array)
				}
			}
		}
		if (energy >= max_energy){
			state = ship.cast_ability
		}
			
	break;
	
	
	
	
	
	
	
	
	case ship.cast_ability:
	show_debug_message(energy_current)
	script_execute(ability_script)
	show_debug_message(energy_current)
	script_execute(basic_ability)
	
	
	//some abilities will trigger a new state, if they don't, here's where it switches back.
	if (state = ship.cast_ability){
		state = ship.battle
		energy = 0
		energy_sub_counter = 0
	}
		

	break;
	
	case  ship.stalking:
	//purpose of the stalking state is for the ship to find the furthest target according to priority, 
	//sneak behind them, and then blast them to bits froms behind.
	
	if (ship_target = noone){
		if (cloak_timer > 40){
			var _fleet_to_check
			if (ship_team = team.left){
				_fleet_to_check = card_game_ui_object.right_fleet 
			}
			if (ship_team = team.right){
				_fleet_to_check = card_game_ui_object.left_fleet
			}
			var _distance_to_target = 0
			for (var i = 0; i < ds_list_size(_fleet_to_check); i++){
				var _ship_to_check = ds_list_find_value(_fleet_to_check, i)
				if (instance_exists(_ship_to_check)){
					var _distance_to_checked_ship = point_distance(x, y, _ship_to_check.x, _ship_to_check.y)
					if (_distance_to_checked_ship > _distance_to_target and _ship_to_check.cloak = false){
						ship_target = _ship_to_check
						_distance_to_target = _distance_to_checked_ship
			
					}
		
				}
			}
		} else {
			scr_return_target()
		}
	} 
	//head towards the target, but sneakily
	//needs to evnetually be a seek function
	if (instance_exists(ship_target)){
		var _enemy_ship_facing = ship_target.image_angle
		var _length_behind_enemy = 100
		var _x = ship_target.x + lengthdir_x(_length_behind_enemy, _enemy_ship_facing-180)
		var _y = ship_target.y + lengthdir_y(_length_behind_enemy, _enemy_ship_facing-180)
		movement_target_x = _x
		movement_target_y = _y
	
	
		//move that way
		var _distance_to_movement_target = point_distance(x, y, movement_target_x, movement_target_y)
		var _direction_to_movement_target = point_direction(x, y, movement_target_x, movement_target_y)
		var _direction_to_ship_target = point_direction(x, y, ship_target.x, ship_target.y)
		if (cloak_timer > 30 or _distance_to_movement_target > 100){
			turn_to_face_direction(_direction_to_movement_target)
			direction = image_angle
			motion_add(direction, acceleration_rate)
			limit_speed()
		} else {
			//open fire
			if (cloak_timer > 30) cloak_timer = 30
			speed = 0
			limit_speed()
			turn_to_face_direction(_direction_to_ship_target)
			if (abs(angle_difference(image_angle, _direction_to_ship_target) < 1)){
				var _old_critical_hit_chance = critical_hit_chance
				critical_hit_chance = 100
				fire_basic_attack(basic_attack_array)
				basic_attack_weapon_speed_counter = 0
				if (secondary_attack_weapon_speed != -1){
					fire_basic_attack(basic_attack_array)
					secondary_attack_weapon_speed_counter = 0
				}
				critical_hit_chance = _old_critical_hit_chance
				state = ship.battle
				cloak_timer = 0
				energy_sub_counter = 0
				energy = 0
			}
		}
	}
		
	
	//break the cloak if you can
	
	
	
	break;
	
	
	case ship.channel_ability:
	#region Ability state machine
		switch(channel_ability_state){
			case channel_ability.hyper_boost:
			if (hyper_boost_channel_timer = -2){
				hyper_boost_channel_timer = 60
				//sets the base variables, although maybe this shouldnt be needed
				old_max_speed = max_speed
				old_turning_speed = turn_speed
				old_acceleration_rate = acceleration_rate
			}
			if (hyper_boost_channel_timer > 0){
				hyper_boost_channel_timer--
				if (speed > 0){
					speed -= .5
				}
				if (speed < 0){
					speed = 0
				}
				turn_speed = 5
					
			
				ship_target = scr_return_furthest_target()
				
				var _p_dir = point_direction(x, y, ship_target.x, ship_target.y)
				turn_to_face_direction(_p_dir)
				direction = image_angle
			}
			if (hyper_boost_channel_timer = 0){
				//eventually, this will jsut seek the target, overshoot for
				//sure, and then leave the state.
				exhaust_scale_multiplier *= 2
				ship_target = instance_furthest(x, y, o_ship)
				if (hyper_boost_duration_timer = -1){
					hyper_boost_duration_timer = 60
				}
				if (hyper_boost_duration_timer > 0){
					hyper_boost_duration_timer--
				}
				max_speed = old_max_speed * 3 //hyperboost multiplier
				turn_speed = 1
				acceleration_rate = old_acceleration_rate * 2
				speed += acceleration_rate
				if (speed > max_speed){
					speed = max_speed
				}
				
				if (instance_exists(ship_target)){
					var _p_dir = point_direction(x, y, ship_target.x, ship_target.y)
					turn_to_face_direction(_p_dir)
					direction = image_angle
					
				}
				if (hyper_boost_duration_timer = 0){
					
					hyper_boost_channel_timer--
					ship_target = scr_return_target()
					turn_speed = old_turning_speed
					acceleration_rate = old_acceleration_rate
					
				}
			}
			if (hyper_boost_channel_timer = -1){
				//begin to restore old values
				if (!instance_exists(ship_target)){
					ship_target = scr_return_target()
				}
				max_speed -=.2
				if (instance_exists(ship_target)){
					var _p_dir = point_direction(x, y, ship_target.x, ship_target.y)
					turn_to_face_direction(_p_dir)
					direction = image_angle
				}
				if (max_speed < old_max_speed){
					max_speed = old_max_speed
					hyper_boost_channel_timer--
					energy = 0
					energy_sub_counter = 0
					hyper_boost_duration_timer--
					state = ship.battle
				}
			}
				
			
			break;
		}
		#endregion
	break;
	
	case ship.firing_range://for testing purposes only.
	/*
	fire_rate_counter++
	image_angle+=.5
	direction=image_angle
	if (fire_rate_counter >= fire_rate){
		fire_rate_counter = 0
		fire_basic_attack(basic_attack_array)
		
	}
	if (secondary_fire_rate != -1){
		secondary_fire_rate_counter++
		if (secondary_fire_rate_counter >= secondary_fire_rate){
			secondary_fire_rate_counter = 0
			fire_basic_attack(secondary_attack_array)

		}
	}
	
	if (energy_sub_counter < max_energy*energy_multiplier) energy_sub_counter+=.5
	energy = energy_sub_counter/energy_multiplier
	if (energy >= max_energy){
		if (ability_script != 0){
			//will actually be a state
			state = ship.cast_ability
		}
	}
	if (keyboard_check_pressed(ord("Z"))) state = ship.cast_ability
	*/
	
	break;
	
	case ship.disabled:
	if (ship_disabled_counter > 0) ship_disabled_counter--
	if (ship_disabled_counter <= 0){
		state = ship.battle//TO BE CHANGED
	}
	
	if (speed > 0){
		speed -= .05
	}
	if (speed < 0){
		speed = 0
	}
	
	break;
}
#endregion
#region Temporary area for abilities
//NOTE!!!  These will need to be lifted out of poost state machine at some poitn and put into battle
if (armor_script != 0){
	
	script_execute(armor_script)
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
if (inhibitor_shield_counter = 0){
	inhibitor_shield_counter-=1
	if (temporary_shields > 0){
		temporary_shields -= inhibitor_shields_granted
		if (temporary_shields < 0){
			temporary_shields = 0
		}
	}
}

/*if (hunter_strike_counter > 0){
	//reset attack speed
	if (hunter_strike_counter = 1){
		hunter_strike_multiplier = 0
		hunter_strike_counter = -1
	}
	hunter_strike_counter--
	
}*/

if (command_strike_bonus_counter > 0){
	command_strike_bonus_counter--
	if (command_strike_bonus_counter = 0){
		command_strike_bonus = 0
		command_strike_bonus_counter--
	}
}


//spell checks
if (thermal_lance_damage_counter > 0) thermal_lance_damage_counter--
if (serrated_plates_damage_counter > 0) serrated_plates_damage_counter--
if (emergency_shield_counter > 0) emergency_shield_counter--
if (inhibitor_shield_counter > 0){
	inhibitor_shield_counter--
	if (temporary_shields > 0){
		generate_shields = 10
	}
}
if (wave_crasher_shield_damage_counter > 0) wave_crasher_shield_damage_counter--

if (hyper_amp_counter > 0){
	hyper_amp_counter--
	if (hyper_amp_counter = 0){
		shields += hyper_amp_shields_drained
		show_debug_message("shields restored!")
		show_debug_message(shields)
		hyper_amp_bonus = 0
		hyper_amp_counter--
	}
}
#endregion