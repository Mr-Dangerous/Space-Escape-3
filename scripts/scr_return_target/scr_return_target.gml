var _fleet_to_target
if (ship_team = team.left){
	_fleet_to_target = card_game_ui_object.right_fleet
}
if (ship_team = team.right){
	_fleet_to_target = card_game_ui_object.left_fleet
}

//change target algos
if (hunter_strike_multiplier > 0){
	hunter_strike_multiplier = 0
}



var _enemy_target = noone
if (_enemy_target = noone){
	var _distance_to_target = 100000
	var _number_of_enemies = ds_list_size(_fleet_to_target)
	for (var i = 0; i < _number_of_enemies; i++){
		var _ship_to_target = ds_list_find_value(_fleet_to_target, i)
		if (instance_exists(_ship_to_target)){
			//run special targeting algos here
			
			var _distance_to_new_target = point_distance(x, y, _ship_to_target.x, _ship_to_target.y)
			if (_ship_to_target.cloak = false and _distance_to_new_target < _distance_to_target){
				_enemy_target = _ship_to_target
				_distance_to_target = _distance_to_new_target
			}
		}
	}
}

return _enemy_target