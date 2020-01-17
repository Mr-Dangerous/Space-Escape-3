if (created = false){
	ds_list_add(ships_shocked, target_ship)
	if (target_ship.temporary_shields > 0){
		target_ship.temporary_shields -= overload_damage
		if (target_ship.temporary_shields < 0){
			overload_damage += target_ship.temporary_shields
			target_ship.temporary_shields = 0
		}
	}
	if (target_ship.shields > 0){
		target_ship.shields -= overload_damage
		if (target_ship.shields < 0){
			target_ship.shields = 0
		}
	}
	created = true
	
}
if (image_index = image_number-3 and number_of_bounces > 0){
	var i = 2
	var overload_target_found = false
	while(!overload_target_found){
		var _ship_to_check = instance_nth_nearest(x, y, o_ship, i)
		if (instance_exists(_ship_to_check)){
			ds_list_add(ships_shocked, _ship_to_check)
			var _distance = distance_to_object(_ship_to_check)
			if (_distance < 200){
				if (_ship_to_check.ship_team = origin_team and ds_list_find_index(ships_shocked, _ship_to_check) = -1){
					i++
				} else {
					overload_target_found = true
					var _overload = instance_create_layer(_ship_to_check.x, _ship_to_check.y, "Projectiles", o_overload)
					with(_overload){
						ds_list_copy(ships_shocked, other.ships_shocked)
						number_of_bounces = other.number_of_bounces - 1
						overload_damage = other.overload_damage
						origin_team = other.origin_team
						target_ship = _ship_to_check
					}
				}
			} else {
				number_of_bounces = 0
				overload_target_found = true
			}
		} else {
			number_of_bounces = 0
			overload_target_found = true
		}
			
	}
}
if (image_index = image_number - 1){
	ds_list_destroy(ships_shocked)
	instance_destroy()
}
