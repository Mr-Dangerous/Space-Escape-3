var grid_space_radius = 32
#region change positions

if (new_ship = false){
	//check to see what grid position is nearest
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

	var grid_height = ds_grid_height(grid_container)
	var grid_width = ds_grid_width(grid_container)

	var _assigned_x = -1
	var _assigned_y = -1
	for (var i = 0; i < grid_width; i++){
		for (var j = 0; j < grid_height; j++){
			grid_position = ds_grid_get(grid_position_map, i, j)
		
			var distance_to_grid_space = point_distance(mouse_x, mouse_y, grid_position[0], grid_position[1])
			//check to see if there are any ohte rnearby grid spaces
		
			if (distance_to_grid_space < grid_space_radius){
				//check to see if something else is there
				if (ds_grid_get(grid_container, i, j) = noone){
					_assigned_x = i
					_assigned_y = j
					_previous_grid_x = reference_object.assigned_grid_x
					_previous_grid_y = reference_object.assigned_grid_y
					ds_grid_set(grid_container, _previous_grid_x, _previous_grid_y, noone)
					ds_grid_set(grid_container, i, j, reference_object)
					with (reference_object){
					
						assigned_grid_x = _assigned_x
						assigned_grid_y = _assigned_y
						i = 100
						j = 100
				
					}
				} else {
					i = 100
					j = 100
					break;
				}
			}
		}
	}
}

#endregion

#region New solution, using factories!
//check to see the nearest grid space
if (new_ship){
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

	var grid_height = ds_grid_height(grid_container)
	var grid_width = ds_grid_width(grid_container)

	var _assigned_grid_x = -1//will be put into the factory soon
	var _assigned_grid_y = -1//will be put into the factory soon

	for (var i = 0; i < grid_width; i++){
		for (var j = 0; j < grid_height; j++){
			grid_position = ds_grid_get(grid_position_map, i, j)
		
			var distance_to_grid_space = point_distance(mouse_x, mouse_y, grid_position[0], grid_position[1])
			//check to see if there are any other nearby grid spaces
		
			if (distance_to_grid_space < grid_space_radius){
				//check to see if something else is there
				if (ds_grid_get(grid_container, i, j) = noone){
					_assigned_grid_x = i
					_assigned_grid_y = j
					reference_factory.assigned_grid_x = _assigned_grid_x
					reference_factory.assigned_grid_y = _assigned_grid_y
					//set a delpoy variable here, get the factory to do it!
					reference_factory.create_ship = true
					i = 100
					j = 100
				} 
				
			}
		}
	}
}


#endregion

instance_destroy()