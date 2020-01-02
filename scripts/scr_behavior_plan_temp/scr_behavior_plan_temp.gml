if (distance_to_target > weapon_range){
	target_x = ship_target.x
	target_y = ship_target.y
	seek = true
	flee = false
	pursue = false
	evade = false
	strafe = false
}
						
if (distance_to_target < weapon_range){
	var random_behavior = irandom(2)
	target_x = ship_target.x
	target_y = ship_target.y
	switch (random_behavior){
	case 1:
		seek = false
		flee = false
		pursue = true
		evade = false
		strafe = false
	break;
	case 2:
		seek = false
		flee = false
		pursue = false
		evade = true
		strafe = false
	break;
	case 3:
		seek = false
		flee = false
		pursue = false
		evade = false
		strafe = true
	break;
	}
}