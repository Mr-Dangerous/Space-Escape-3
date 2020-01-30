/// @description Insert description here
// You can write your code in this editor

switch(state){
	case repair_drone.deploy:
		speed += acceleration_rate
		direction = image_angle
		limit_speed()
		deploy_counter--
		if (deploy_counter <= 0){
			state = repair_drone.traveling
			
			if (rotation_spin = 0) rotation_spin = -90
			if (rotation_spin = 1) rotation_spin = 90
		}
	break;
	case repair_drone.traveling:
	if (instance_exists(target_ship)){
		var _distance_to_target = distance_to_object(target_ship)
		if (_distance_to_target < repair_radius){
			state = repair_drone.attached
			//small shield buff
			target_ship.shields += repair_power*5
			if (target_ship.shields > target_ship.max_shields){
				target_ship.shields = target_ship.max_shields
			}
		}
		var _p_dir = point_direction(x, y, target_ship.x, target_ship.y)
		turn_to_face_direction(_p_dir)
		direction = image_angle
		speed += acceleration_rate
		limit_speed()
	}
	
	break;
	
	case repair_drone.attached:
	if (instance_exists(target_ship)){
		
		direction = point_direction(x, y, target_ship.x, target_ship.y)+rotation_spin
		var _distance = point_distance(x, y, target_ship.x, target_ship.y)
		if (_distance > 90){
			direction += sign(rotation_spin)
		}
		if (_distance < 50){
			direction -= sign(rotation_spin)	
		}
		max_speed = 1
		turn_to_face_direction(direction)
		speed += acceleration_rate
		limit_speed()
			
	
		if (repair_power > 0){
			repair_speed_counter++	
		}
		if (repair_speed_counter >= repair_speed){
			repair_speed_counter = 0
			if (target_ship.armor != target_ship.max_armor){
				repair_power--
				target_ship.armor += 15
				if (target_ship.armor > target_ship.max_armor){
					target_ship.armor = target_ship.max_armor
				}
			}
		}
	}
	
	break;
}

if (repair_power <= 0 or !instance_exists(target_ship)){
	instance_destroy()
}