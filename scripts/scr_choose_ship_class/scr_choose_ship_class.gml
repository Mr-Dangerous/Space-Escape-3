//@param possible level
var _player_level
if (argument_count > 0){
	_player_level = argument0
} else {
	_player_level = player_level
}

var _random_seed = irandom_range(1, 100)
var _class = ""
var _interceptor_chance = 0
var _fighter_chance = 0
var _frigate_chance = 0
//reference class table
switch(_player_level){
	case 1:
		_interceptor_chance = 60
		_fighter_chance = 40
		_frigate_chance = 0
		
	break;
	case 2:
		_interceptor_chance = 57
		_fighter_chance = 43
		_frigate_chance = 0
	break;
	case 3:
		_interceptor_chance = 53
		_fighter_chance = 46
		_frigate_chance = 1
	break;
	case 4:
		_interceptor_chance = 52
		_fighter_chance = 45
		_frigate_chance = 3
	break;
	case 5:
		_interceptor_chance = 50
		_fighter_chance = 43
		_frigate_chance = 7
	break;
	case 6:
		_interceptor_chance = 48
		_fighter_chance = 41
		_frigate_chance = 11
	break;
	case 7:
		_interceptor_chance = 45
		_fighter_chance = 39
		_frigate_chance = 16
	break;
	case 8:
		_interceptor_chance = 42
		_fighter_chance = 37
		_frigate_chance = 21
	break;
	case 9:
		_interceptor_chance = 40
		_fighter_chance = 35
		_frigate_chance = 25
	break;
	case 10:
		_interceptor_chance = 35
		_fighter_chance = 35
		_frigate_chance = 30
	break;
}

if (_random_seed < _interceptor_chance){
	_class = "Interceptor"
} else {
	if (_random_seed < _interceptor_chance + _fighter_chance){
		_class = "Fighter"
	} else {
		_class = "Frigate"
	}
}

return _class