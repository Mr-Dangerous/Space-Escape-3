//find intital starting location

var position_assigned = false
while (!position_assigned){
	if (ship_team = team.right){
		for (var i = battle_grid_width; i > 0; i--){
			for (var j = battle_grid_height; j > 0; j--){
				if (ds_grid_get(battle_grid, i, j) = noone){
					ds_grid_set(battle_grid, i, j, self)
					assigned_grid_x = i
					assigned_grid_y = j
					position_assigned = true
					break;
				}
				if (position_assigned){
					break;
				}
			}
			if (position_assigned){
				break;
			}
		}
	}
	if (ship_team = team.left){
		for (var i = 0; i < battle_grid_width; i++){
			for (var j = 0; j < battle_grid_height; j++){
				if (ds_grid_get(battle_grid, i, j) = noone){
					ds_grid_set(battle_grid, i, j, self)
					assigned_grid_x = i
					assigned_grid_y = j
					position_assigned = true
					break;
				}
				if (position_assigned){
					break;
				}
			}
			if (position_assigned){
				break;
			}
		}
	}
}