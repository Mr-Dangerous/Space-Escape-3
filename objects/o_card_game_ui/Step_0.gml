///@description deploy!
//reset deploy button, and deploy the armada!
var mouse_left_released = mouse_check_button_released(mb_left)
fleet_object = instance_find(o_fleets, 0)
var fleet = fleet_object.left_fleet

if (mouse_left_released){
	for (var  i =0; i < 3; i++){
		if (construction_bay_deploy_button_pressed[i] = true){
			construction_bay_deploy_button_pressed[i] = false
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
				var _ship_resource = active_construction_bay[0].ship_resource
				var deployed_ship = instance_create_layer(40, 40, "Ships", _ship_resource)
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
				fleet_object.left_fleet[fleet_space] = deployed_ship
				//clear the construction bay
				for (var i = 0; i < 7; i++){
					instance_destroy(active_construction_bay[i])
					active_construction_bay[i] = noone
					
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
	//TODO 
	if (refresh_button_pressed){
		if (resources >= 2){
			invest_button_pressed = false
			resources-=2
			scr_create_shuffled_shop(module)
		}
	}
}
