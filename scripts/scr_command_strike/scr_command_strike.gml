var _fleet 

if (ship_team = team.right){
	_fleet = card_game_ui_object.right_fleet
}
if (ship_team = team.left){
	_fleet = card_game_ui_object.left_fleet
}

var _maximum_distance = 300

var _ships_affected = ds_list_create()

for (var i = 0; i < ds_list_size(_fleet); i++){
	var _allied_ship = ds_list_find_value(_fleet, i)
	if (instance_exists(_allied_ship)){
		if (point_distance(x, y, _allied_ship.x, _allied_ship.y) < _maximum_distance){
			if (!_allied_ship.target_locked){
				ds_list_add(_ships_affected, _allied_ship)
			}
			
		}
	}
}

var _command_strike_strength = energy_current
var _number_of_targets = ds_list_size(_ships_affected)
var _stacks = floor(_command_strike_strength/_number_of_targets)
var _remainder = _command_strike_strength - _stacks*_number_of_targets  
for (var i = 0; i < _number_of_targets; i++){
	var _affected_ship = ds_list_find_value(_ships_affected, i)
	_affected_ship.ship_target = ship_target
	_affected_ship.command_strike_bonus = 4*_stacks
	_affected_ship.command_strike_bonus_counter = floor(energy_current / 4)*60
	show_debug_message(_affected_ship.command_strike_bonus)
}

for (var i = 0; i < _remainder; i++){
	var _remaining_ships = ds_list_size(_ships_affected)
	var _random_seed = irandom(_remaining_ships)
	var _affected_ship = ds_list_find_value(_ships_affected, _random_seed)
	_affected_ship.command_strike_bonus += 4
	ds_list_delete(_ships_affected, _random_seed)
	show_debug_message(_affected_ship.command_strike_bonus)
}



ds_list_destroy(_ships_affected)
