/// @description Insert description here
// You can write your code in this editor

switch(state){
	case repair_drone.traveling:
	var _distance_to_target = distance_to_object(target_ship)
	if (_distance_to_target < repair_radius){
		state = repair_drone.attached
	}
	var _p_dir = point_direction(x, y, target_ship.x, target_ship.y)
	turn_to_face_direction(_p_dir)
	direction = image_angle
	speed += acceleration_rate
	limit_speed()
	
	
	break;
	
	case repair_drone.attached:
	if (speed > target_ship.speed){
		speed -= acceleration_rate
	}
	if (speed < target_ship.speed){
		speed = target_ship.speed
	}
	turn_to_face_direction(target_ship.image_angle)
	direction = target_ship.direction
	
	if (repair_power > 0){
		repair_speed_counter++	
	}
	if (repair_speed_counter >= repair_speed){
		repair_speed_counter = 0
		if (target_ship.armor != target_ship.max_armor){
			repair_power--
			target_ship.armor += 20
			if (target_ship.armor > target_ship.max_armor){
				target_ship.armor = target_ship.max_armor
			}
		}
	}
	
	break;
}

if (repair_power <= 0){
	instance_destroy()
}