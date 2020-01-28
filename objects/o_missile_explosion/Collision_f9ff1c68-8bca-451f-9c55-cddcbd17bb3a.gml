//check to see if the ship is on the damaged list
var can_be_damaged = true
for (var i = 0; i < array_length_1d(damaged_ships); i++){
	can_be_damaged = true
	if (damaged_ships[i] = other){
		can_be_damaged = false
	}
}
if (other.ship_team != team_attack_from and can_be_damaged){
	var _distance_from_target = point_distance(x, y, other.x, other.y)
	_distance_from_target = clamp(_distance_from_target, 32, 120)
	var _damage = damage/_distance_from_target*16
	//may need to change mass
	scr_calculate_damage(other, _damage, 5, false, false)
}



	