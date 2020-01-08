///@description 
//creation variables that need to be dynamically updated based on other variables


max_fuel = 5+player_level*3
level_income = floor(player_level/2)
income = base_income + streak_income + level_income + bonus_income





//reset deploy button, and deploy the armada!
//TODO Just a thought - there shoudl likely be a check to see if the mouse is still in the correct
//position when released, in case the player wants to cancel a mouse click.  Shouldn't be too tough.




var mouse_left_released = mouse_check_button_released(mb_left)

var fleet = left_fleet

if (mouse_left_released){
	for (var  i =0; i < 3; i++){
		if (construction_bay_deploy_button_pressed[i] = true){
			construction_bay_deploy_button_pressed[i] = false
			//check to see if the fleet has enough fuel
			
			//check to see if the fleet has space
			var fleet_size = array_length_1d(fleet)
			var fleet_space = -1
			for (var j = 0; j < fleet_size - 1; j++){
				if (fleet[j] = noone){
					fleet_space = j
					j = 100
				}
			}
			
			//deploy ship contained
			var active_construction_bay = construction_bays[i]
			
		
			if (active_construction_bay[0] != noone and fleet_space != -1){
				//check to see if there is enough fuel
				var _ship_resource = active_construction_bay[0].ship_resource
				var _ship_class = active_construction_bay[7]
				//woudl also want to check to see if there are fuel reducing modules here
				var deployed_ship = instance_create_layer(40, 40, "Ships", _ship_resource)
				var _fuel_cost = 0
				switch(_ship_class){
					case target_class.interceptor:
						_fuel_cost = 2
					break;
	
					case target_class.fighter:
						_fuel_cost = 4
					break;
	
					case target_class.frigate:
						_fuel_cost = 10
					break;
				}
				if (current_fuel_spent + _fuel_cost > max_fuel){
					instance_destroy(deployed_ship)
				}
					
				
				if (instance_exists(deployed_ship)){
					
					
					
					//may be replaced with an object reference.... hurm
					deployed_ship.module_list[0] = _ship_resource
				
					for (var i = 0; i < 7; i++){
						loading_script[i] = 0
						if (instance_exists(active_construction_bay[i])){
							loading_script[i] = active_construction_bay[i].loading_script
							var module_name = object_get_name(active_construction_bay[i])
							deployed_ship.module_list[i + 1] = module_name
							instance_destroy(active_construction_bay[i])
						
						}
						active_construction_bay[@ i] = noone
					}
	 
							
			
					deployed_ship.frame_load_script = loading_script[0]
					deployed_ship.weapon_load_script = loading_script[1]
					deployed_ship.shield_load_script = loading_script[2]
					deployed_ship.armor_load_script = loading_script[3]
					deployed_ship.targeting_load_script = loading_script[4]
					deployed_ship.ability_load_script = loading_script[5]
					deployed_ship.power_load_script = loading_script[6]
			
					deployed_ship.ship_team = team.left
					//place the ship in the fleet
					left_fleet[fleet_space] = deployed_ship
					//clear the construction bay
					for (var i = 0; i < 7; i++){
						instance_destroy(active_construction_bay[i])
						active_construction_bay[i] = noone
					
					}
					current_fuel_spent += _fuel_cost
				}
			}
			
			
		}
		
	}
	if (invest_button_pressed){
		if (resources >= 4){
			invest_button_pressed = false
			player_experience+=4
			resources-=4
			scr_return_player_level()
		}
	}
	
	if (refresh_button_pressed){
		if (resources >= 2){
			refresh_button_pressed = false
			resources-=2
			scr_create_shuffled_shop(card_type.module)
		}
	}
	
	if (hangar_button_pressed){
		if (resources >= 1){
			hangar_button_pressed = false
			resources-=1
			scr_create_shuffled_shop(card_type.frame)
		}
	}
}
