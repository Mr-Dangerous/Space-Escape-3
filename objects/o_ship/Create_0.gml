module_list = array_create(7, [noone])
created = false
#region positioning


battle_grid = 0
battle_grid_positions = 0
battle_map = instance_find(o_battle_map, 0)

if (ship_team = team.left){
	battle_grid = battle_map.left_grid_container
	battle_grid_positions = battle_map.left_grid_positions
}
if (ship_team = team.right){
	battle_grid = battle_map.right_grid_container
	battle_grid_positions = battle_map.right_grid_positions
}

battle_grid_width = ds_grid_width(battle_grid)
battle_grid_height = ds_grid_height(battle_grid)


//find intital starting location
var position_assigned = false
while (!position_assigned){
	if (ship_team = team.right){
		for (var j = 0; j <= battle_grid_width-1; j++){
			for (var i = 0; i <= battle_grid_height-1; i++){
				if (ds_grid_get(battle_grid, j, i) = noone){
					ds_grid_set(battle_grid, j, i, self)
					assigned_grid_x = j
					assigned_grid_y = i
					position_assigned = true
					break;
				}
				if (position_assigned){
					break;
				}
			} if (position_assigned){
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
#endregion

basic_attack_array = create_basic_attack_array()
fire_counter = 0
fire_rate = 40

visible = false

state = ship.planning



