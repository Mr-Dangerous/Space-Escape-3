var _point_direction = argument0

if (image_angle != _point_direction){
	_angle_difference = angle_difference(image_angle, _point_direction)
	image_angle -= sign(_angle_difference)*turn_speed
	if (abs(_angle_difference) < turn_speed){
		image_angle = _point_direction
	}

}