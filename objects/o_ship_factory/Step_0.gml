/// @description 

if (create_ship = true){
	
	show_debug_message("Command to create recieved!")
	show_debug_message("assigned grid x = " + string(assigned_grid_x))
	show_debug_message("assigned grid y = " + string(assigned_grid_y))
	//create the ship
	var _ship_resource = o_ship
	var _ship_class = ship_frame_contained.class
	//woudl also want to check to see if there are fuel reducing modules here
	var deployed_ship = instance_create_layer(40, 40, "Ships", _ship_resource)
	var _fuel_cost = 0
	switch(_ship_class){
	//TODO:  Needs to become an enum or macro.
	//Currently, ship frame cards are strings.
	case "Interceptor":
		_fuel_cost = 2
	break;
	
	case "Fighter":
		_fuel_cost = 4
	break;
	
	case "Frigate":
		_fuel_cost = 10
	break;
	}
	if (card_game_controller.current_fuel_spent + _fuel_cost > card_game_controller.max_fuel){
		instance_destroy(deployed_ship)
		//TODO empty the assigned x and y in the grid
	}
	

	//inject variables here
	if (instance_exists(deployed_ship)){
		//may be replaced with an object reference.... hurm
		var _module_array = array_create(7, 0)
		_module_array[0] = ship_frame_contained.loading_script
		for (var i = 1; i < 7; i++){
			if (factory_item[i-1, 1] != noone){
				_module_array[i] = factory_item[i-1,1].loading_script
			}
		}
		deployed_ship.assigned_grid_x = assigned_grid_x
		deployed_ship.assigned_grid_y = assigned_grid_y
		deployed_ship.reference_factory = self
		
				
		for (var i = 0; i < 7; i++){
			deployed_ship.loading_scripts[i] = _module_array[i]
		}
	}
	//fill the grid container
	var battle_map = instance_find(o_battle_map, 0)
	var grid_container
	var grid_position_map
	if (ship_team = team.right){
		grid_container = battle_map.right_grid_container
		grid_position_map = battle_map.right_grid_positions
	}
	if (ship_team = team.left){
		grid_container = battle_map.left_grid_container
		grid_position_map = battle_map.left_grid_positions
	}
	ds_grid_set(grid_container, assigned_grid_x, assigned_grid_y, deployed_ship)
		
	fielded_ship = deployed_ship
	create_ship = false
}
