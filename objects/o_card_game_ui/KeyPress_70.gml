/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < array_length_1d(enemy_ship_factories); i++){
	var _factory = enemy_ship_factories[i]
	if (_factory.ship_frame_contained != noone){
		_factory.create_ship = true
	}
}
