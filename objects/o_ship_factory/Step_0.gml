/// @description 
#region Origin and class counting
//CONSIDERATION:  This section should probably be somewhere else.  I'm just not sure where.
if (instance_exists(ship_frame_contained)){
	//assign origin
	iron_count = 0
	solar_count = 0
	imperial_count = 0
	pirate_count = 0
	crystal_count = 0
	hunter_count = 0
	breakthrough_count = 0
	ghost_count = 0
	ECP_count = 0
	weapons_platform_count = 0
	shield_count = 0
	command_count = 0
	support_count = 0
	corvette_count = 0
	
	for (var i = 0; i < 7; i++){
		var _module
		if (i < 6){
			_module = factory_item[i, 1]
		}
		if (i = 6){
			_module = ship_frame_contained
		}
		if (instance_exists(_module)){
			var _origin = _module.origin
			var _class = _module.sub_class

			switch (_origin){
				case origin_iron:
					iron_count++
				break;
		
				case origin_crystal:
					crystal_count++
				break;
		
				case origin_imperial:
					imperial_count++
				break;
		
				case origin_pirate:
					pirate_count++
				break;
		
				case origin_solar:
					solar_count++
				break;
			}
			//assign class
			switch(_class){
				case class_hunter:
					hunter_count++
				break;
		
				case class_ghost:
					ghost_count++
				break;
		
				case class_breakthrough:
					breakthrough_count++
				break;
		
				case class_weapons_platform:
					weapons_platform_count++
				break;
		
				case class_ECP:
					ECP_count++
				break;
		
				case class_shield:
					shield_count++
				break;
		
				case class_support:
					support_count++
				break;
		
				case class_corvette:
					corvette_count++
				break;
		
				case class_command:
					command_count++
				break;
			}
		}
	}
}
#endregion

#region hover and information
//adjust the variables of the factory




var _mouse_x = device_mouse_x_to_gui(0)
var _mouse_y = device_mouse_y_to_gui(0)
if (point_in_rectangle(_mouse_x, _mouse_y, gui_x, gui_y, gui_x+_factory_sprite_size, gui_y+_factory_sprite_size) and
	factory_team = team.left){
	hover = true
} else {
	hover = false
}
if (hover = true){
	if(hover_timer < 60){
		hover_timer++
	}
	//code to create the hover object here
	if (hover_timer >= 60){
		if (!instance_exists(hover_card)){
			
			hover_card = instance_create_layer(0, 0, "Above_Cards", o_hover_card)
			hover_card.gui_x = gui_x + _factory_sprite_size + 20
			hover_card.gui_y = gui_y
			hover_card.reference_factory = self
		
		}
	}
	
}
if (hover = false and hover_timer > 0){
	
	if (instance_exists(hover_card) and hover_card.hover = false){
		instance_destroy(hover_card)
	}
	hover_timer = 0
}

#endregion


	


#region create the ship when commanded to
if (create_ship = true and factory_team = team.left 
and instance_exists(ship_frame_contained) and !instance_exists(fielded_ship) and assigned_grid_x != -1){
	show_debug_message("Command to create recieved!")
	show_debug_message("assigned grid x = " + string(assigned_grid_x))
	show_debug_message("assigned grid y = " + string(assigned_grid_y))
	//create the ship
	var deployed_ship = noone
	//woudl also want to check to see if there are fuel reducing modules here
	var _fuel_discount = 0 // would be done via factories.
	//check to make sure this is the first time this ship is being created
	//you don't want to deduct fuel for ships already fielded
	
	if (new_ship = true){
		if (card_game_controller.current_fuel_spent + ship_frame_contained.fuel_cost + _fuel_discount <= card_game_controller.max_fuel){//COME BACK TO THIS
			deployed_ship = instance_create_layer(40, 40, "Ships", o_ship)
			card_game_controller.current_fuel_spent += ship_frame_contained.fuel_cost
			new_ship = false
		}
	} else {
		deployed_ship = instance_create_layer(40, 40, "Ships", o_ship)
	}


	
	//inject variables here
	if (instance_exists(deployed_ship)){
		//may be replaced with an object reference.... hurm
		//get some work done here!
		var _module_array = array_create(7, 0)
		_module_array[0] = ship_frame_contained.graphic_offset_script
		for (var i = 1; i < 7; i++){
			if (factory_item[i-1, 1] != noone){
				_module_array[i] = factory_item[i-1,1].loading_script
			}
		}
		deployed_ship.basic_ability = ship_frame_contained.basic_ability_script
		deployed_ship.assigned_grid_x = assigned_grid_x
		deployed_ship.assigned_grid_y = assigned_grid_y
		deployed_ship.reference_factory = self
		deployed_ship.ship_team = team.left
		deployed_ship.fuel_cost = ship_frame_contained.fuel_cost + _fuel_discount
		deployed_ship.name = ship_frame_contained.name
		deployed_ship.class = ship_frame_contained.class
		deployed_ship.sprite_index = ship_frame_contained.sprite_index
		deployed_ship.image_scale = ship_frame_contained.image_scale
		//attack array stuff
		
		
		
		#region assign the origin and class counters.... this is not very good.
		scr_assign_origin_class_counters(deployed_ship)
		#endregion
		
				
		for (var i = 0; i < 7; i++){
			deployed_ship.loading_scripts[i] = _module_array[i]
		}
	}
	//fill the grid container
	var battle_map = instance_find(o_battle_map, 0)
	var grid_container = battle_map.left_grid_container
	var grid_position_map = battle_map.left_grid_positions

	
	ds_grid_set(grid_container, assigned_grid_x, assigned_grid_y, deployed_ship)
		
	fielded_ship = deployed_ship
	create_ship = false
}

/// @description 



if (create_ship = true and factory_team = team.right and 
instance_exists(ship_frame_contained) and !instance_exists(fielded_ship)){
	show_debug_message("Command to create recieved!")
	show_debug_message("assigned grid x = " + string(assigned_grid_x))
	show_debug_message("assigned grid y = " + string(assigned_grid_y))
	//create the ship
	var _ship_resource = o_ship
	//woudl also want to check to see if there are fuel reducing modules here
	var deployed_ship = instance_create_layer(40, 40, "Ships", _ship_resource)
	

	//inject variables here
if (instance_exists(deployed_ship)){
		//may be replaced with an object reference.... hurm
		//get some work done here!
		var _module_array = array_create(7, 0)
		_module_array[0] = ship_frame_contained.graphic_offset_script
		for (var i = 1; i < 7; i++){
			if (factory_item[i-1, 1] != noone){
				_module_array[i] = factory_item[i-1,1].loading_script
			}
		}
		deployed_ship.basic_ability = ship_frame_contained.basic_ability_script
		deployed_ship.assigned_grid_x = assigned_grid_x
		deployed_ship.assigned_grid_y = assigned_grid_y
		deployed_ship.reference_factory = self
		deployed_ship.ship_team = team.right
		deployed_ship.name = ship_frame_contained.name
		deployed_ship.class = ship_frame_contained.class
		deployed_ship.sprite_index = ship_frame_contained.sprite_index
		deployed_ship.image_scale = ship_frame_contained.image_scale
		//attack array stuff
		
		
		
		#region assign the origin and class counters.... this is not very good.
		scr_assign_origin_class_counters(deployed_ship)
		#endregion
		
				
		for (var i = 0; i < 7; i++){
			deployed_ship.loading_scripts[i] = _module_array[i]
		}
	}
	//fill the grid container
	var battle_map = instance_find(o_battle_map, 0)
	var grid_container = battle_map.left_grid_container
	var grid_position_map = battle_map.left_grid_positions

	
	ds_grid_set(grid_container, assigned_grid_x, assigned_grid_y, deployed_ship)
		
	fielded_ship = deployed_ship
	create_ship = false
}

if (create_ship = true) create_ship = false
#endregion






