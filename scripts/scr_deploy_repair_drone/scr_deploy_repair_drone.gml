var i = 1
var _target_ship = self
var _radius = 300
var _target_list_acquired = false
var _target_list = ds_list_create()

while (!_target_list_acquired){
	var _nearby_ship = instance_nth_nearest(x, y, o_ship, i)
	var _distance = point_distance(x, y, _nearby_ship.x, _nearby_ship.y)
	if (instance_exists(_nearby_ship)){
		if (_distance < _radius){
			if (_nearby_ship.ship_team = ship_team){
				ds_list_add(_target_list, _nearby_ship)
			}
			i++
		} else {
			_target_list_acquired = true
		}
	} else {
		_target_list_acquired = true
	}
	if (i > 30){
		_target_list_acquired = true
	}
}

var _list_size = ds_list_size(_target_list)


for (var i = 0; i< _list_size; i++){
	var _ship_to_check = ds_list_find_value(_target_list, i)
	if (instance_exists(_ship_to_check) and instance_exists(_target_ship)){
		if (_ship_to_check.armor/_ship_to_check.max_armor < _target_ship.armor/_target_ship.max_armor){
			_target_ship = _ship_to_check
		}
	}
}

if (instance_exists(_target_ship)){
	var _repair_drone = instance_create_layer(x, y, "Ships", o_repair_drone)
	with (_repair_drone){
		repair_power = other.energy_current
		image_angle = other.image_angle
		direction = other.direction
		target_ship = _target_ship
	}
}