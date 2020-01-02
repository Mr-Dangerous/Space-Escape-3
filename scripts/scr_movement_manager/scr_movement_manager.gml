var _desired_direction = 0
var _added_motion = 0

if (seek or flee){
	var _seek_direction = point_direction(x, y, target_x, target_y)
	if (flee){
		_seek_direction -= 180
	}
	var _direction_v_desired_direction_difference = abs(angle_difference(direction, _seek_direction))
	turn_to_face_direction(_seek_direction)
	if (_direction_v_desired_direction_difference < 90){
		direction = image_angle
	}
	_desired_direction += _seek_direction
	_added_motion += acceleration_rate

	//check for arrival
	
	var _distance_to_target = point_distance(x, y, target_x, target_y)
	if (_distance_to_target < 50){
		speed -= acceleration_rate
		_added_motion = 0
		if (speed < 0){
			speed = 0
		}
	}
	
}
if (evade or pursue){
	//needs a lead target!
	if (instance_exists(ship_target)){
		var _target_direction = ship_target.direction
		var _target_speed = ship_target.speed
		var _distance_to_target = distance_to_object(ship_target)
		var _projectile_flight_time = _distance_to_target/projectile_speed
					
		var _lead_target_x = ship_target.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
		var _lead_target_y = ship_target.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
	
		var _pursue_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
		if (evade){
			_pursue_direction -= 180
		}
		var _direction_v_desired_direction_difference = abs(angle_difference(direction, _pursue_direction))
		turn_to_face_direction(_pursue_direction)
		if (_direction_v_desired_direction_difference < 90){
			direction = image_angle
		}
		_desired_direction += _pursue_direction
		_added_motion += acceleration_rate
	} else {
		if (pursue){
			pursue = !pursue
			seek = true
		}
		if (evade){
			evade = !evade
			flee = true
		}
	}
}

if (strafe){
	_desired_direction = direction
	_added_motion += acceleration_rate
	if (instance_exists(ship_target)){
		var _target_direction = ship_target.direction
		var _target_speed = ship_target.speed
		var _distance_to_target = distance_to_object(ship_target)
		var _projectile_flight_time = _distance_to_target/projectile_speed
					
		var _lead_target_x = ship_target.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
		var _lead_target_y = ship_target.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
	
		var _pursue_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
		
		turn_to_face_direction(_pursue_direction)
		_desired_direction += _pursue_direction
		_added_motion += acceleration_rate
	} else {
		if (pursue){
			pursue = !pursue
			seek = true
		}
		if (evade){
			evade = !evade
			flee = true
		}
	}
}


//Post movement manager stuff
motion_add(_desired_direction, _added_motion)
limit_speed()