///@param experience
var _player_level = 0
var _player_experience = player_experience
var _level_determined = false
var _i = 0
while (_level_determined = false){
	if (_player_experience > experience_to_level[_i]){
		_player_level = _i
		_i++
	} else {
		_level_determined = true
	}
		
}


return _player_level