/// @description Insert description here
// You can write your code in this editor
duration--
if (duration <= 0){ 
	misfire = true
	instance_destroy()
}

speed += acceleration_rate

if (speed > max_speed){
	speed = max_speed
}
if (instance_exists(projectile_target)){
	//eventually goes through the movement manager with a seek
	var _direction_to_target = point_direction(x, y, projectile_target.x, projectile_target.y)
	turn_to_face_direction(_direction_to_target)
	direction = image_angle

	if (angle_difference(image_angle, _direction_to_target)>90){
		misfire = true
		instance_destroy()
	}

	if (instance_exists(projectile_leader)){
		with(projectile_leader){
			x = other.x
			y = other.y
			image_angle = other.image_angle
		}
	}
}